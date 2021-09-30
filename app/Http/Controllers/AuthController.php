<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use  App\User;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\PushNotificationCommonController;
use URL;
use DB;

class AuthController extends Controller
{
    public function __construct()
    {
        $tasks_controller = new PushNotificationCommonController;
    }
    public function register(Request $request)
    {
        if ($request->login_type == 'google') {
            $this->validate($request, [
                'email' => 'required|email',
                'login_type' => 'required',
                'google_id' => 'required',
                'country_id' => 'required',
            ]);
        } else if ($request->login_type == 'facebook') {
            $this->validate($request, [
                'email' => 'required|email',
                'login_type' => 'required',
                'facebook_id' => 'required',
                'country_id' => 'required',
            ]);
        } else {
            $this->validate($request, [
                'email' => 'required|email',
                'password' => 'nullable|required_with:password_confirmation|string|confirmed',
                'password_confirmation' => 'required',
            ]);
        }
        try {
            $user = User::where('email', $request->email)->first();
            if (isset($request->phone) && $request->phone != "" && $request->login_type == 'normal') {
                $chck_phone = User::where('phone', $request->phone)->first();
                //echo count($chck_phone);die;
                if ($chck_phone != null) {
                    return response()->json(['message' => 'PhoneNo already registered', 'status' => 404], 201);
                }
            }

            if ($user != null) {
                if ($request->login_type != 'normal') {
                    //$password='12345678';
                    $credentials = array('email' => $request->email, 'password' => $request->email);
                    $usertype = User::where('email', $request->email)->first();
                    if (empty($usertype)) {
                        return response()->json(['message' => 'Invalid credentials', 'status' => 201], 401);
                    } else {
                        //$token = Auth::loginUsingId($usertype['id']);
                        $user = User::find($usertype['id']);
                        $token = Auth::fromUser($user);
                        $finalData = array();
                        $usertype = User::where('email', $request->email)->first();
                        $finalData = array('token' => $this->respondWithToken($token));
                        $data = collect([
                            "status" => 200,
                            "message" => "Success",
                            'user_id'       => $usertype['id'],
                            'first_name'    => $usertype['first_name'],
                            'last_name'     => $usertype['last_name'],
                            'email'         => $usertype['email'],
                            'phone'         => $usertype['phone'],
                            'profile_image' => URL::to('/') . "/public/Media/" . $usertype['profile_image'],
                            "data"          => $this->respondWithToken($token)
                        ]);
                        return response()->json($data, 200);
                    }
                } else {
                    return response()->json(['message' => 'User already registered', 'status' => 404], 200);
                }
            }
            if ($file = $request->file('file')) {
                $destinationPath = base_path('public/Media/');
                $profileImage = uniqid('file') . "-" . $file->getClientOriginalName();
                $path = $file->move($destinationPath, $profileImage);
                //$data = collect(["status" => "200", "message" => "Success", "data" => $profileImage]);
                //return response()->json($data, 200);
            }
            $tasks_controller = new PushNotificationCommonController;
            
            $user = new User;
            $user->first_name    = @$request->input('first_name');
            $user->last_name     = @$request->input('last_name');
            $user->area          = @$request->input('area');
            $user->country_code  = @$request->input('country_code');
            $user->phone         = @$request->input('phone');
            $user->email         = @$request->input('email');
            $user->country_id         = @$request->input('country_id');
            $user->referral_code = @$request->input('referral_code');
            $user->login_type    = @$request->input('login_type');
            $user->profile_image = @$profileImage;
            $user->referral_by      = '';
            $user->status        = 1;
            $plainPassword       = $request->input('password');
            if ($request->login_type == 'google') {
                $user->google_id    = $request->input('google_id');
                $plainPassword = '12345678';
            }
            if ($request->login_type == 'facebook') {
                $user->facebook_id  = $request->input('facebook_id');
                $plainPassword = '12345678';
            }
            $user->password      = app('hash')->make($plainPassword);

            $user->save();
            
            $referalCode = $tasks_controller->generateUsersReferralCode($user->id);
            $getamount = DB::table('wallet_recharge')->insert([
                'transactionid' => "",
                'transactiontype' => '',
                'user_id' => $user->id,
                'phone' => '',
                'method' => '',
                'amount' => '0',
                'change_amount' => '0',
                'description' => 'First Entry',
                'created_at' => date("Y-m-d H:i:s"),
                'updated_at' => date("Y-m-d H:i:s")
            ]);
            $message = "You have register successfully with Duradrive at" . date("F j, Y, g:i A");
            $ext = 'registration';
            $tasks_controller->postNotification($user->id, $message, $ext);


            if ($request->login_type != 'normal') {

                //$password='12345678';
                $credentials = array('email' => $request->email, 'password' => '12345678');
                //print_r($credentials);die();
                $usertype = User::where('email', $request->email)->first();
                if (empty($usertype)) {
                    return response()->json(['message' => 'Invalid credentials', 'status' => 201], 401);
                } else {
                    $finalData = array();
                    $user = User::find($usertype['id']);
                    $token = Auth::fromUser($user);

                    $usertype = User::where('email', $request->email)->first();
                    $finalData = array('token' => $this->respondWithToken($token));
                    $data = collect([
                        "status" => 200,
                        "message" => "Success",
                        'user_id'       => $usertype['id'],
                        'first_name'    => $usertype['first_name'],
                        'last_name'     => $usertype['last_name'],
                        'email'         => $usertype['email'],
                        'phone'         => $usertype['phone'],
                        'profile_image' => URL::to('/') . "/public/Media/" . $usertype['profile_image'],
                        "data"          => $this->respondWithToken($token)
                    ]);
                    return response()->json($data, 200);
                }
            } else {
                $data = collect(["status" => 200, "message" => "Success", "data" => $user]);
                return response()->json($data, 200);
            }
        } catch (\Exception $e) {
            // dd($e);
            return response()->json(['message' => $e->getMessage()], 500);
        }
    }


    public function login(Request $request)
    {
        $this->validate($request, [
            //'email' => 'required|string',
            'password' => 'required|string',
        ]);

        if (!empty($request->get('phone'))) {
            $credentials = $request->only(['phone', 'password']);
        } else {
            $credentials = $request->only(['email', 'password']);
        }
        if (!$token = Auth::attempt($credentials)) {
            return response()->json(['message' => 'Invalid credentials', 'status' => 201], 401);
        } else {
            $finalData = array();
            if (!empty($request->get('phone'))) {
                $usertype = User::where('phone', $request->phone)->first();
                if ($usertype['country_code'] != $request->country_code) {
                    return response()->json(['message' => 'Country code not matched', 'status' => 201], 401);
                }
            } elseif (filter_var($request->get('email'), FILTER_VALIDATE_EMAIL)) {
                $usertype = User::where('email', $request->email)->first();
            }
            if ($request->country_id != $usertype['country_id']) {
                return response()->json(['message' => 'Country not matched', 'status' => 201], 401);
            }
            $finalData = array('token' => $this->respondWithToken($token));
            $tasks_controller = new PushNotificationCommonController;
            $message = "You have login successfully with Duradrive at " . date("F j, Y, g:i A");
            $ext = 'login';
            $tasks_controller->postNotification($usertype['id'], $message, $ext);
            $referalCode = DB::table('users_referralcode')->where('user_id', $usertype['id'])->where('is_used','0')->first();
            $data = collect([
                "status"        => 200,
                "message"       => "Success",
                'user_id'       => $usertype['id'],
                'first_name'    => $usertype['first_name'],
                'last_name'     => $usertype['last_name'],
                'email'         => $usertype['email'],
                'phone'         => $usertype['phone'],
                'profile_image' => URL::to('/') . "/public/Media/" . $usertype['profile_image'],
                "data"          => $this->respondWithToken($token),
                'referalCode'   => $referalCode,
            ]);
            return response()->json($data, 200);
        }
    }
}
