<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\PushNotificationCommonController;
use App\User;
use URL;
use DB;

class UserController extends Controller
{
    /**
     * Instantiate a new UserController instance.update_user_profile
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Get the authenticated User.
     *
     * @return Response
     */
    public function profile(Request $request)
    {

        $rules = [
            'user_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $user = DB::table('users')->where('id', $request->user_id)->first();
                //print_r($user);die;
                if (empty($user)) {
                    return response()->json(['message' => 'Data not found!'], 404);
                }
                $doc = DB::table('country')->where('id', $user->country_id)->first();
                //print_r($user);die;

                if (isset($doc->country_name) && $doc->country_name != null) {
                    $country_name = $doc->country_name;
                } else {
                    $country_name = "";
                }
                if ($user->facebook != null) {
                    $facebook = $user->facebook;
                } else {
                    $facebook = "";
                }
                if ($user->google != null) {
                    $google = $user->google;
                } else {
                    $google = "";
                }
                if ($user->country_code != null) {
                    $country_code = $user->country_code;
                } else {
                    $country_code = 0;
                }

                if ($user->country_id != null) {
                    $country_id = $user->country_id;
                } else {
                    $country_id = 0;
                }

                if ($user->name != null) {
                    $name = $user->name;
                } else {
                    $name = $user->first_name;
                }
                $getamount = DB::table('wallet_recharge')->where('user_id', $request->user_id)->orderBy('id', 'desc')->first();
                // echo "<pre>";
                // print_r($getamount);
                // die;

                $price = $getamount->amount;
                if (!empty($price)) {
                    $price = $price;
                } else {
                    $price = 0;
                }
                $user_rating_review = DB::table('user_rating_review')->where('user_id', $request->user_id)->count();

                $data = array(
                    'id'            => $user->id,
                    'profile_image' => URL::to('/') . "/public/Media/" . $user->profile_image,
                    'name'          => $name,
                    'country_code'  => $country_code,
                    'amount'        => $price,
                    'review'        => $user_rating_review,
                    'currency'      => '₱',
                    'email'         => $user->email,
                    'phone'         => $user->phone,
                    'country_id'    => $country_id,
                    'country'       => $country_name,
                    'facebook'      => $facebook,
                    'google'        => $google,
                    'status'        => $user->status
                );

                $data = collect(["status" => "200", "message" => "Data fetch successfully.!", "data" => $data]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['message' => 'Data not found!'], 404);
            }
        }
    }

    /**
     * Get all User.
     *
     * @return Response
     */
    public function allUsers()
    {
        $users = User::all();
        $tasks_controller = new PushNotificationCommonController;
        foreach ($users as $user) {
            $referalCode = $tasks_controller->generateUsersReferralCode($user->id);
        }
        die("sssssss");
        return response()->json(['users' =>  User::all()], 200);
    }
    public function useReferralCodeByUsers(Request $request)
    {
        // $this->allUsers();
        // die;
        $rules = [
            'user_id' => 'required|integer',
            'referral_code' => 'required|string',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $tasks_controller = new PushNotificationCommonController;
                $usersReferralData = DB::table('users_referralcode')
                    ->where('refereal_code', $request->referral_code)
                    ->where('is_used', '0')
                    ->first();
                if ($usersReferralData) {

                    DB::table('users_referralcode')
                        ->where('refereal_code', $request->referral_code)
                        //->where('is_used', '0')
                        ->update([
                            'is_used'       => '1',
                            'used_by'       => $request->user_id,
                            'used_date_at'  => date("Y-m-d H:i:s")
                        ]);

                    DB::table('users')
                        ->where('id', $request->user_id)
                        ->update([
                            'referral_by'  => $request->referral_code,
                        ]);
                    $referalCode = $tasks_controller->generateUsersReferralCode($usersReferralData->user_id);
                    $data = collect(["status" => "200", "message" => "Referral code used successfully"]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => '200', 'message' => 'Referral code not found'], 404);
                }
            } catch (\Exception $e) {
                echo "<pre>";
                print_r($e);
                die;
                return response()->json(['message' => $e->getMessage()], 404);
            }
        }
    }
    /**
     * Get one user.
     *
     * @return Response
     */
    public function singleUser($id)
    {
        try {
            $user = User::findOrFail($id);
            return response()->json(['user' => $user], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'user not found!'], 404);
        }
    }

    public function update_user_name(Request $request)
    {
        $rules = [
            'user_id' => 'required|integer',
            /*'first_name'=>'required|string',
                'last_name'=>'required|string',
                'phone'=>'required|integer',*/
            'name' => 'required|string'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                if ($file = $request->file('photo')) {
                    $destinationPath = base_path('public/Media/');
                    $profileImage = uniqid('photo') . "-" . $file->getClientOriginalName();
                    $path = $file->move($destinationPath, $profileImage);
                    //$data = collect(["status" => "200", "message" => "Success", "data" => $profileImage]);
                    //return response()->json($data, 200);
                } else {
                    $profileImage = "";
                }
                $data = array(
                    'name' => $request->name,
                    'profile_image'   => $profileImage,
                );

                $user = DB::table('users')->where('id', $request->user_id)->update($data);
                $tasks_controller = new PushNotificationCommonController;
                $message = " You have update user name successfully with Duradrive at " . date("F j, Y, g:i A");
                $ext = 'usernameupdate';
                $tasks_controller->postNotification($request->user_id, $message, $ext);

                $data = collect(["status" => "200", "message" => "Profile update successfully.!"]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                print_r($e);
                return response()->json(['message' => 'user not found!'], 404);
            }
        }
    }

    public function update_country(Request $request)
    {
        $rules = [
            'user_id' => 'required|integer',
            'country_id' => 'required|string'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {

                $data = array(
                    'country_id' => $request->country_id,
                );

                $user = DB::table('users')->where('id', $request->user_id)->update($data);
                $tasks_controller = new PushNotificationCommonController;
                $message = " You have country update successfully with Duradrive at " . date("F j, Y, g:i A");
                $ext = 'countryupdate';
                $tasks_controller->postNotification($request->user_id, $message, $ext);

                $data = collect(["status" => "200", "message" => "Country update successfully.!"]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                print_r($e);
                return response()->json(['message' => 'user not found!'], 404);
            }
        }
    }

    public function update_phone(Request $request)
    {
        $rules = [
            'user_id' => 'required|integer',
            'phone' => 'required|string',
            'country_code' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {

                $data = array(
                    'phone' => $request->phone,
                    'country_code' => $request->country_code
                );
                $getdata = DB::table('users')->where('phone', $request->phone)->where('id', '!=', $request->user_id)->first();

                if (!empty($getdata)) {
                    $data = collect(["status" => "201", "message" => "Phone already exits.!"]);
                    return response()->json($data, 201);
                }
                //echo "hi";die;
                $user = DB::table('users')->where('id', $request->user_id)->update($data);
                $tasks_controller = new PushNotificationCommonController;
                $message = " You have phone update successfully with Duradrive at " . date("F j, Y, g:i A");
                $ext = 'phoneupdate';
                $tasks_controller->postNotification($request->user_id, $message, $ext);

                $data = collect(["status" => "200", "message" => "Phone update successfully.!"]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['message' => 'user not found!'], 404);
            }
        }
    }


    public function user_password_update(Request $request)
    {

        /* dd($request->all()); die;*/
        $rules = [
            'old_password' => 'required',
            'password' => 'nullable|required_with:password_confirmation|string|confirmed',
            'password_confirmation' => 'required',
            'user_id' => 'required|integer'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {

                $data = array(
                    'password' => Hash::make($request->password),
                    /*Hash::make*/
                );

                $user = User::find($request->user_id);

                if (!Hash::check($request->old_password, $user->password)) {
                    $data = collect(["status" => "201", "message" => "Password Not mached.!"]);
                    return response()->json($data, 201);
                }

                $user = DB::table('users')->where('id', $request->user_id)->update($data);
                $tasks_controller = new PushNotificationCommonController;
                $message = " You have password update successfully with Duradrive at " . date("F j, Y, g:i A");
                $ext = 'passwordupdate';
                $tasks_controller->postNotification($request->user_id, $message, $ext);
                $data = collect(["status" => "200", "message" => "Password update successfully.!"]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                print_r($e);
                return response()->json(['message' => 'user not found!'], 404);
            }
        }
    }

    public function getlocation(Request $request)
    {
        $rules = [
            'user_id' => 'required|integer'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 201);
        } else {
            //ini_set('memory_limit', '-1');
            try {
                $user = DB::table('useraddress')->where('user_id', $request->user_id)->get();

                $data = collect(["status" => "200", "message" => "Data fetch successfully.!", "data" => $user]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                print_r($e);
                return response()->json(['message' => 'Data not found!'], 404);
            }
        }
    }
    public function alllocation(Request $request)
    {
        try {
            $user = DB::table('service_area')->get();

            $data = collect(["status" => "200", "message" => "Data fetch successfully.!", "data" => $user]);
            return response()->json($data, 200);
        } catch (\Exception $e) {
            print_r($e);
            return response()->json(['message' => 'Data not found!'], 404);
        }
    }

    public function refercode(Request $request)
    {
        try {
            $user = DB::table('reference_codemaster')->where('recode', $request->refer_code)->first();

            if (!empty($user)) {
                $data = collect(["status" => "200", "message" => "Code matched successfully.!", "data" => $user]);
            } else {
                $data = collect(["status" => "200", "message" => "Code Not matched.!", "data" => '']);
            }

            return response()->json($data, 200);
        } catch (\Exception $e) {
            print_r($e);
            return response()->json(['message' => 'Data not found!'], 404);
        }
    }

    public function addaddress(Request $request)
    {
        $rules = [
            'user_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {

            try {
                $item = DB::table('useraddress')->insertGetId($request->all());
                $tasks_controller = new PushNotificationCommonController;
                $message = " You have add address successfully with Duradrive at " . date("F j, Y, g:i A");
                $ext = 'addaddress';
                $tasks_controller->postNotification($request->user_id, $message, $ext);
                return response()->json(['status' => 200, 'message' => 'Success', 'data' => $item], 200);
            } catch (\Exception $e) {
                print_r($e);
                return response()->json(['message' => 'Something went wrong.Please try again!'], 404);
            }
        }
    }
    public function getaddress(Request $request)
    {
        $rules = [
            'user_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {

            try {
                $item = DB::table('useraddress')->where('user_id', $request->user_id)->orderBy('updated_at', 'DESC')->get();

                //$items= $item->orderBy('id', 'DESC')->get();;
                if (!empty($item)) {
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $item], 200);
                } else {
                    return response()->json(['status' => 200, 'message' => 'address Not found', 'data' => ''], 201);
                }
            } catch (\Exception $e) {
                print_r($e);
                return response()->json(['message' => 'Something went wrong.Please try again!'], 404);
            }
        }
    }

    public function updateaddress(Request $request)
    {

        $rules = [
            'user_id' => 'required|int',
            'addressid' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                if ($request->isdefault = '1') {
                    $is_update = DB::table('useraddress')->where('user_id', $request->user_id)->where('id', '!=', $request->addressid)->update(['isdefault' => '0']);
                }
                $addressData = DB::table('useraddress')->where('user_id', $request->user_id)->where('id', $request->addressid)->first();
                if ($addressData) {
                    $finalData = array(
                        'address1'       => $request->address1,
                        'address2'           => $request->address2,
                        'latitude'           => $request->latitude,
                        'longitude'          => $request->longitude,
                        'contactperson'      => $request->contactperson,
                        'mobile'             => $request->mobile,
                        'isdefault'          => $request->isdefault,
                        'updated_at'         => date("Y-m-d H:i:s")
                    );

                    $is_update = DB::table('useraddress')->where('user_id', $request->user_id)->where('id', $request->addressid)->update($finalData);
                    $tasks_controller = new PushNotificationCommonController;
                    $message = " You have address update successfully with Duradrive at " . date("F j, Y, g:i A");
                    $ext = 'addressupdate';
                    $tasks_controller->postNotification($request->user_id, $message, $ext);
                    return response()->json(['status' => 200, 'message' => 'updated successfully', 'data' => 1], 200);
                } else {
                    return response()->json(['status' => 200, 'message' => 'not updated', 'data' => ''], 201);
                }
            } catch (\Exception $e) {
                print_r($e);
                return response()->json(['message' => 'Something went wrong.Please try again!'], 404);
            }
        }
    }

    public function deleteaddress(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            'addressid' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $is_update = DB::table('useraddress')->where('user_id', $request->user_id)->where('id', $request->addressid)->delete();
                $tasks_controller = new PushNotificationCommonController;
                $message = " You have address deleted successfully with Duradrive at " . date("F j, Y, g:i A");
                $ext = 'addressdeleted';
                $tasks_controller->postNotification($request->user_id, $message, $ext);
                return response()->json(['status' => 200, 'message' => 'address deleted successfully', 'data' => $is_update], 200);
            } catch (\Exception $e) {
                //dd($e);
                return response()->json(['message' => $e->getMessage()], 500);
            }
        }
    }

    public function updatesociallink(Request $request)
    {
        $rules = [
            'user_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $finalData  =   array(
                    'google'      => $request->has('google') ? $request->google : "",
                    'facebook'    => $request->has('facebook') ? $request->facebook : "",
                );
                $is_update  = DB::table('users')->where('id', $request->user_id)->update($finalData);
                if (!empty($is_update)) {
                    $tasks_controller = new PushNotificationCommonController;
                    $message = " You have social update successfully with Duradrive at " . date("F j, Y, g:i A");
                    $ext = 'socialupdate';
                    $tasks_controller->postNotification($request->user_id, $message, $ext);
                    return response()->json(['status' => 200, 'message' => 'updated successfully', 'data' => $is_update], 200);
                } else {
                    return response()->json(['status' => 200, 'message' => 'not updated', 'data' => ''], 201);
                }
            } catch (\Exception $e) {
                print_r($e);
                return response()->json(['message' => 'Something went wrong.Please try again!'], 404);
            }
        }
    }

    public function getsociallink(Request $request)
    {
        $rules = [
            'user_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {

            try {
                $item = DB::table('users')->where('id', $request->user_id)->first();
                //dd($item);die;
                if (!empty($item)) {
                    $finalData  =   array(
                        'google'      => $request->google,
                        'facebook'    => $request->facebook
                    );
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $item], 200);
                } else {
                    return response()->json(['status' => 200, 'message' => 'detail Not found', 'data' => ''], 201);
                }
            } catch (\Exception $e) {
                print_r($e);
                return response()->json(['message' => 'Something went wrong.Please try again!'], 404);
            }
        }
    }


    public function getcard(Request $request)
    {
        $rules = [
            'user_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {

            try {
                $item = DB::table('user_card')->where('user_id', $request->user_id)->get();

                if (!empty($item)) {
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $item], 200);
                } else {
                    return response()->json(['status' => 200, 'message' => 'detail Not found', 'data' => ''], 201);
                }
            } catch (\Exception $e) {
                print_r($e);
                return response()->json(['message' => 'Something went wrong.Please try again!'], 404);
            }
        }
    }

    public function addcard(Request $request)
    {
        $rules = [
            'user_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {

            try {
                $item = DB::table('user_card')->insertGetId($request->all());
                $tasks_controller = new PushNotificationCommonController;
                $message = " You have add card successfully with Duradrive at " . date("F j, Y, g:i A");
                $ext = 'addcard';
                $tasks_controller->postNotification($request->user_id, $message, $ext);
                return response()->json(['status' => 200, 'message' => 'Success', 'data' => $item], 200);
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['message' => 'Something went wrong.Please try again!'], 404);
            }
        }
    }

    public function updatecard(Request $request)
    {
        $rules = [
            'user_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {

            try {
                $finalData  =   array(
                    'name'         => $request->name,
                    'number'       => $request->number,
                    'expirydate'   => $request->expirydate,
                    'securitycode' => $request->securitycode
                );

                $is_update  = DB::table('user_card')->where('id', $request->id)->where('user_id', $request->user_id)->update($finalData);
                if (!empty($is_update)) {
                    $tasks_controller = new PushNotificationCommonController;
                    $message = " You have add card successfully with Duradrive at " . date("F j, Y, g:i A");
                    $ext = 'cardupdate';
                    $tasks_controller->postNotification($request->user_id, $message, $ext);
                    return response()->json(['status' => 200, 'message' => 'updated successfully', 'data' => $is_update], 200);
                } else {
                    return response()->json(['status' => 200, 'message' => 'not updated', 'data' => ''], 201);
                }
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['message' => 'Something went wrong.Please try again!'], 404);
            }
        }
    }

    public function deletecard(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            'id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $is_update = DB::table('user_card')->where('user_id', $request->user_id)->where('id', $request->id)->delete();
                $tasks_controller = new PushNotificationCommonController;
                $message = " You have card deleted successfully with Duradrive at " . date("F j, Y, g:i A");
                $ext = 'carddeleted';
                $tasks_controller->postNotification($request->user_id, $message, $ext);
                return response()->json(['status' => 200, 'message' => 'card deleted successfully', 'data' => $is_update], 200);
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }

    public function getpersonaldoc(Request $request)
    {
        try {
            $user = DB::table('document')->whereIn('id', [1, 2])->get();

            //print_r($user);

            $data = collect(["status" => "200", "message" => "Data fetch successfully.!", "data" => $user]);
            return response()->json($data, 200);
        } catch (\Exception $e) {
            dd($e);
            return response()->json(['message' => 'Data not found!'], 404);
        }
    }

    public function getbusinessdoc(Request $request)
    {
        try {
            $user = DB::table('document')->whereIn('id', [3, 4])->get();

            //print_r($user);

            $data = collect(["status" => "200", "message" => "Data fetch successfully.!", "data" => $user]);
            return response()->json($data, 200);
        } catch (\Exception $e) {
            dd($e);
            return response()->json(['message' => 'Data not found!'], 404);
        }
    }

    public function update_document(Request $request)
    {

        $rules = [
            'user_id' => 'required|int',
            'document_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                if ($file = $request->file('frontimage')) {
                    $destinationPath = base_path('public/Media/');
                    $frontImage = uniqid('frontimage') . "-" . $file->getClientOriginalName();
                    $path = $file->move($destinationPath, $frontImage);
                    $data = array(
                        'user_id'     => $request->user_id,
                        'frontimage'  => $frontImage,
                        'status'      => 0,
                        'document_id' => $request->document_id
                    );
                }
                if ($file = $request->file('backimage')) {
                    $destinationPath = base_path('public/Media/');
                    $backimage = uniqid('backimage') . "-" . $file->getClientOriginalName();
                    $path = $file->move($destinationPath, $backimage);

                    $data = array(
                        'user_id'     => $request->user_id,
                        'backimage'   => $backimage,
                        'status'      => 0,
                        'document_id' => $request->document_id
                    );
                }

                // print_r($data);die;

                $exit = DB::table('userdocument')->where('user_id', $request->user_id)->where('document_id', $request->document_id)->first();
                //         echo "<pre>";
                // print_r($exit);
                // die;
                if (!empty($exit)) {
                    $item = DB::table('userdocument')->where('user_id', $request->user_id)->where('document_id', $request->document_id)->update($data);
                    $usertype = DB::table('users')->where('id', $request->user_id)->first();
                    $tasks_controller = new PushNotificationCommonController;
                    $message = " You have updated docs successfully with Duradrive at " . date("F j, Y, g:i A");
                    $ext = 'updatedocs';
                    $tasks_controller->postNotification($request->user_id, $message, $ext);
                } else {
                    $item = DB::table('userdocument')->insertGetId($data);
                }

                $data = collect(["status" => "200", "message" => "document uploaded successfully.!", "data" => $item]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                dd($e);
                //print_r($e);
                return response()->json(['message' => 'Something went wrong!Please try again'], 404);
            }
        }
    }

    public function userpersonaldoc(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            //'document_id'=>'required|int',
            //'type'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {

            try {
                $user = DB::table('userdocument')->whereIn('document_id', [1, 2])->where('user_id', $request->user_id)->get();

                if (!empty($user) && count($user) > 0) {
                    $dataidcard = null;
                    $datadriver = null;
                    foreach ($user as $item) {
                        $doc = DB::table('document')->where('id', $item->document_id)->first();

                        if ($item->document_id == 1) {
                            $dataidcard = array(
                                'documentname' => $doc->name,
                                'frontimage'   => URL::to('/') . "/public/Media/" . $item->frontimage,
                                'backimage'    => URL::to('/') . "/public/Media/" . $item->backimage,
                                'status'       => $item->status
                            );
                        }
                        if ($item->document_id == 2) {
                            $datadriver = array(
                                'documentname' => $doc->name,
                                'frontimage'   => URL::to('/') . "/public/Media/" . $item->frontimage,
                                'backimage'    => URL::to('/') . "/public/Media/" . $item->backimage,
                                'status'       => $item->status
                            );
                        }
                    }

                    $data = collect(["status" => "200", "message" => "Data fetch successfully.!", "dataidcard" => $dataidcard, "datadriver" => $datadriver]);
                    return response()->json($data, 200);
                } else {

                    $data = collect(["status" => "201", "message" => "Data not found!"]);
                    return response()->json($data, 201);
                }
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['message' => 'Data not found!'], 404);
            }
        }
    }

    public function userbusinessdoc(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            //'document_id'=>'required|int',
            //'type'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $user = DB::table('userdocument')->whereIn('document_id', [3, 4])->where('user_id', $request->user_id)->get();

                if (!empty($user) && count($user) > 0) {
                    $databusinessone = null;
                    $databusinesstwo = null;
                    foreach ($user as $item) {
                        $doc = DB::table('document')->where('id', $item->document_id)->first();
                        if ($item->document_id == 3) {
                            $databusinessone = array(
                                'documentname' => $doc->name,
                                'frontimage'   => URL::to('/') . "/public/Media/" . $item->frontimage,
                                'backimage'    => URL::to('/') . "/public/Media/" . $item->backimage,
                                'status'       => $item->status
                            );
                        }

                        if ($item->document_id == 4) {
                            $databusinesstwo = array(
                                'documentname' => $doc->name,
                                'frontimage'   => URL::to('/') . "/public/Media/" . $item->frontimage,
                                'backimage'    => URL::to('/') . "/public/Media/" . $item->backimage,
                                'status'       => $item->status
                            );
                        }
                    }
                    $data = collect(["status" => "200", "message" => "Data fetch successfully.!", "dataone" => $databusinessone, "datatwo" => $databusinesstwo]);
                    return response()->json($data, 200);
                } else {
                    $data = collect(["status" => "201", "message" => "No Data found!"]);
                    return response()->json($data, 201);
                }
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['message' => 'Data not found!'], 404);
            }
        }
    }


    public function userReviewRating(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                // $ratingData = DB::table('user_rating_review')
                // ->where('user_id', $request->user_id)
                // ->get();
                $ratingData = DB::table('user_rating_review as urr')
                    ->join('driveuser as du', 'urr.driver_id', '=', 'du.id')
                    ->join('users as us', 'urr.user_id', '=', 'us.id')
                    ->where('urr.user_id', $request->user_id)
                    ->select('urr.*', 'du.firstname', 'du.middlename', 'du.lastname', 'du.profilephoto_url', 'us.first_name as user_firstname', 'us.last_name as user_lastname', 'du.address as driver_address')
                    ->get();
                $finalArray = array();
                if (count($ratingData) > 0) {
                    foreach ($ratingData as $rate) {
                        $finalArray[] = array(
                            'remarks' => $rate->remarks,
                            'rating' => $rate->rating,
                            'rating' => $rate->rating,
                            'created_at' => $rate->created_at,
                            'firstname' => $rate->firstname,
                            'middlename' => $rate->middlename,
                            'lastname' => $rate->lastname,
                            'user_firstname' => $rate->user_firstname,
                            'user_lastname' => $rate->user_lastname,
                            'driver_address' => $rate->driver_address,
                            'profilephoto_url' => URL::to('/') . "/public/Media/" . $rate->profilephoto_url,
                        );
                    }
                    $avg_stars = DB::table('user_rating_review')
                        ->avg('rating');
                    $data = collect([
                        "status" => "200",
                        "message" => "Data fetch successfully.!",
                        "data" => $finalArray,
                        'avg_stars' => $avg_stars
                    ]);
                } else {
                    $data = collect([
                        "status" => "201",
                        "message" => "Data Not found.!",
                        "data" => null,
                        'avg_stars' => null
                    ]);
                }

                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(["status" => "200", 'message' => $e->getMessage()], 404);
            }
        }
    }

    public function userDriverRating(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            'driver_id' => 'required|int',
            'order_id' => 'required|int',

        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                DB::table('driveuserrating')->insert([
                    'userid' =>  $request->user_id,
                    'orderid' => $request->order_id,
                    'driverid' =>  $request->driver_id,
                    'rating' =>  $request->rating,
                    'remarks' =>  $request->remarks,
                    'service_type' => $request->service_type,
                    'status' =>  1,
                    'created_at' =>  date("Y-m-d H:i:s"),
                    'updated_at' =>  date("Y-m-d H:i:s"),
                ]);
                $data = collect([
                    "status" => "200",
                    "message" => "Review added successfully.!",
                ]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(["status" => "200", 'message' => $e->getMessage()], 404);
            }
        }
    }
    public function userReferralCode(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            'referal_code' => 'required',

        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {

                $referalCode = DB::table('users')->where('referral_code', $request->referal_code)->first();
                if ($referalCode) {
                    $ref = DB::table('users')->where('id', $request->user_id)->update([
                        'referral_by' => $request->referal_code
                    ]);
                    $data = collect([
                        "status" => "200",
                        "message" => "Added successfully.!",
                    ]);
                    return response()->json($data, 200);
                } else {
                    $data = collect([
                        "status" => "201",
                        "message" => "Referal code Not found.!",
                    ]);
                    return response()->json($data, 200);
                }
            } catch (\Exception $e) {
                return response()->json(["status" => "200", 'message' => $e->getMessage()], 404);
            }
        }
    }


    public function delete_document(Request $request)
    {
        $rules = [
            'id' => 'required|int',
            'user_id' => 'required|int',
            //'document_id' => 'required|int',
            'type' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                //$is_update = DB::table('userdocument')->where('id', $request->id)->delete();
                if ($request->type == 'frontimage') {
                    $data = array(
                        'frontimage'   => null,
                    );
                }
                if ($request->type == 'backimage') {
                    $data = array(
                        'backimage'   => null,
                    );
                }


                $is_update = DB::table('userdocument')
                    ->where('user_id', $request->user_id)
                    ->where('document_id', $request->id)
                    ->update($data);

                $usertype = DB::table('users')->where('id', $request->user_id)->first();
                $tasks_controller = new PushNotificationCommonController;
                $message = " You have delete docs successfully with Duradrive at " . date("F j, Y, g:i A");
                $ext = 'deletedocs';
                $tasks_controller->postNotification($request->user_id, $message, $ext);

                $is_delete = DB::table('userdocument')->where('user_id', $request->user_id)->where('document_id', $request->id)->first();
                if ($is_delete->frontimage == null && $is_delete->backimage == null) {
                    $update = DB::table('userdocument')->where('user_id', $request->user_id)->where('document_id', $request->id)->delete();
                }

                return response()->json(['status' => 200, 'message' => 'Deleted successfully', 'data' => $is_update], 200);
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }
}
