<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
//use  App\User;
//use  App\Driver;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use URL;
use DB;

class DriverController extends Controller
{
    public function drivernoti(Request $request)
    {
        $this->validate($request, [
            'id' => 'required|string',
        ]);
        $check = DB::table('driveusernotification')
            ->where('durauserid', '=', $request->id)
            ->first();
        $data = collect([
            "status" => 200, "message" => "Success", 'data' => $check,
        ]);
        return response()->json($data, 200);
    }
    public function register(Request $request)
    {
        $this->validate($request, [
            'mobile' => 'required|integer',
            'email' => 'required|email',
            'password' => 'nullable|required_with:password_confirmation|string|confirmed',
            'password_confirmation' => 'required',
        ]);
        try {
            $userd = DB::table('driveuser')
                ->where('email', $request->email)
                ->get();
            if (count($userd) == 0) {
                if ($file = $request->file('frontlicensephoto')) {
                    $destinationPath = base_path('public/Media/');
                    $frontlicensephoto = uniqid('file') . "-" . $file->getClientOriginalName();
                    $path = $file->move($destinationPath, $frontlicensephoto);
                }
                if ($file = $request->file('backlicensephoto')) {
                    $destinationPath = base_path('public/Media/');
                    $backlicensephoto = uniqid('file') . "-" . $file->getClientOriginalName();
                    $path = $file->move($destinationPath, $backlicensephoto);
                }
                if ($file = $request->file('plno')) {
                    $destinationPath = base_path('public/Media/');
                    $plno = uniqid('file') . "-" . $file->getClientOriginalName();
                    $path = $file->move($destinationPath, $plno);
                }
                if ($file = $request->file('crno')) {
                    $destinationPath = base_path('public/Media/');
                    $crno = uniqid('file') . "-" . $file->getClientOriginalName();
                    $path = $file->move($destinationPath, $crno);
                }
                if ($file = $request->file('vehiclephoto')) {
                    $destinationPath = base_path('public/Media/');
                    $vehiclephoto = uniqid('file') . "-" . $file->getClientOriginalName();
                    $path = $file->move($destinationPath, $vehiclephoto);
                }
                if ($file = $request->file('profilephoto_url')) {
                    $destinationPath = base_path('public/Media/');
                    $profilephoto_url = uniqid('file') . "-" . $file->getClientOriginalName();
                    $path = $file->move($destinationPath, $profilephoto_url);
                }
                $plainPassword          = app('hash')->make($request->input('password'));
                $datass = array(
                    'firstname'        => $request->input('firstname'),
                    'middlename'       => $request->input('middlename'),
                    'lastname'         => $request->input('lastname'),
                    'mobile'            => $request->input('mobile'),
                    'email'            => $request->input('email'),
                    'referralcode'     => $request->input('referralcode'),
                    'accname'          => $request->input('accname'),
                    'gcashno'          => $request->input('gcashno'),
                    'dob'              => $request->input('dob'),
                    'profilephoto_url' => isset($profilephoto_url),
                    'isactive'           => 0,
                    'password'         => $plainPassword,
                );
                $addData = DB::table('driveuser')
                ->insertGetId($datass);
                $docdata = array(
                    'driver_id'         => $addData,
                    'frontlicensephoto' => $request->frontlicensephoto,
                    'backlicensephoto'  => $request->backlicensephoto,
                    'plno'              => $request->plno,
                    'crno'              => $request->crno,
                    'vehiclephoto'      => $request->vehiclephoto,
                    'vehicle_id'        => $request->vehicle,
                );
                $addDatadoc = DB::table('drivepersonaldoc')
                ->insertGetId($docdata);
                $addDataId = array(
                    'driver_id'         => $addData,
                );
                $data = collect(["status" => 200, "message" => "Success", "data" => $addDataId]);
                return response()->json($data, 200);
            } else {
                return response()->json(['message' => 'User already registered', 'status' => 404], 201);
            }
        } catch (\Exception $e) {
            dd($e);
            return response()->json(['message' => $e, 'status' => 404], 201);
        }
    }
    public function login(Request $request)
    {
        $this->validate($request, [
            'mobile' => 'required|string',
            'password' => 'required|string',
        ]);
        $credentials = $request->only(['mobile', 'password']);
        $check = DB::table('driveuser')->where('mobile', '=', $request->mobile)->first();
        if (Hash::check($request->password, $check->password)) {
            echo "true";
            die;
        }
        //echo $data."fgdf";die;
        if (!$token = Auth::attempt($credentials)) {
            return response()->json(['message' => 'Invalid credentials', 'status' => 201], 401);
        } else {
            $finalData = array();
            $userd = DB::table('driveuser')->where('mobile', $request->mobile)->get();
            print_r($userd);
            die;
            $finalData =  array('token'        => $this->respondWithToken($token));
            //print_r($finalData);die;        $this->respondWithToken($token)->getData()->token            
            $data = collect([
                "status" => 200, "message" => "Success", 'user_id'       => $usertype['id'],
                'first_name'    => $usertype['first_name'],
                'last_name'     => $usertype['last_name'],
                'email'         => $usertype['email'],
                'phone'         => $usertype['phone'],
                'profile_image' => URL::to('/') . "/public/Media/" . $usertype['profile_image'],
                "data"          => $this->respondWithToken($token)
            ]);
            return response()->json($data, 200);
        }
    }
}
