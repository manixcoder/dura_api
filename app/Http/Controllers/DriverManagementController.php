<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Twilio\Rest\Client;
use App\Http\Controllers\PushNotificationCommonController;
use App\Driver;
use  App\User;
use Illuminate\Support\Facades\Auth;
use URL;
use DB;
use QRCode;

class DriverManagementController extends Controller
{

    public function sendOTP(Request $request)
    {
        $rules = [
            'country_code' => 'required',
            'mobile' => 'required',
            'message' => 'required',
            'otp' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['statusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('mobile', $request->input('mobile'))->get();
                if (count($driverData) > 0) {
                    return response()->json(['status' => 409, 'message' => 'This mobile number allready registered', 'data' => []], 409);
                } else {
                    // $otp = $this->generateNumericCode(4);
                    // $msg = "Your code for otp varification " . $otp;
                    // use wordwrap() if lines are longer than 70 characters
                    // $msg = wordwrap($msg, 70);
                    if (is_numeric($request->input('mobile'))) {
                        $id = DB::table('users_otp')->insertGetId([
                            'otp' => $request->input('otp'),
                            'country_code' => $request->input('country_code'),
                            'phone' => $request->input('mobile'),
                            'email' => $request->input('mobile')
                        ]);
                        require base_path('public/twilio-php-main/src/Twilio/autoload.php');
                        // dd(env('SID'));
                        // dd(env('TWILIO_TOKEN'));
                        // dd(env('TWILIO_FROM'));
                        $sid = env('SID');
                        $token = env('TWILIO_TOKEN');
                        $twilio = new Client($sid,  $token);
                        $message = $twilio->messages
                            ->create(
                                $request->input('country_code') . $request->input('mobile'), // to 
                                array(
                                    "messagingServiceSid" => env('TWILIO_FROM'),
                                    "body" => $request->input('message')
                                )
                            );
                    } else {
                        $id = DB::table('users_otp')->insertGetId([
                            'otp' => $request->input('otp'),
                            'country_code' => $request->input('country_code'),
                            //'email' => $request->input('mobile'),
                            'phone' => $request->input('mobile')
                        ]);
                    }

                    $data = collect(['status' => 200, "message" => "Success", "otp" => $request->input('otp')]);
                    return response()->json($data, 200);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422,  'message' => $e->getMessage()], 409);
            }
        }
    }

    public function verifyOTP(Request $request)
    {
        $rules = [
            'country_code' => 'required',
            'mobile' => 'required',
            'otp' => 'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                if (is_numeric($request->input('mobile'))) {
                    $row = DB::table('users_otp')
                        ->where('country_code', $request->input('country_code'))
                        ->where('otp', $request->input('otp'))
                        ->where('phone', $request->input('mobile'))
                        ->first();
                } else {
                    $row = DB::table('users_otp')
                        ->where('country_code', $request->input('country_code'))
                        ->where('otp', $request->input('otp'))
                        ->first();
                }
                if ($row != null) {
                    $data = collect([
                        "status" => 200,
                        "message" => "otp varified",
                        "data" => []
                    ]);
                    $is_update = DB::table('users_otp')
                        ->where('country_code', $request->input('country_code'))
                        ->where('otp', $request->input('otp'))
                        ->where('phone', $request->input('mobile'))
                        ->delete();
                    return response()->json($data, 200);
                } else {
                    $data = collect([
                        'status' => 409,
                        "message" => "Wrong code",
                        "data" => []
                    ]);
                    return response()->json($data, 409);
                }
            } catch (\Exception $e) {
                //return response()->json(['status' => 409, 'message' => 'Something wrong country code or mobile number not matched'], 409);
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverRegistration(Request $request)
    {
        $rules = [
            'email' => 'required',
            'password' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'statusCode' => 405,
                'status' => 'failed',
                'message' => $validator->messages()
            ], 409);
        } else {

            try {
                $userd = DB::table('driveuser')->where('email', $request->email)->get();

                if (count($userd) == 0) {

                    if ($file = $request->file('crno_image')) {
                        $destinationPath = base_path('public/Media/');
                        $crno_image = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $crno_image);
                    } else {
                        $crno_image = "";
                    }
                    if ($file = $request->file('frontlicensephoto')) {
                        $destinationPath = base_path('public/Media/');
                        $frontlicensephoto = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $frontlicensephoto);
                    } else {
                        $frontlicensephoto = '';
                    }
                    if ($file = $request->file('backlicensephoto')) {
                        $destinationPath = base_path('public/Media/');
                        $backlicensephoto = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $backlicensephoto);
                    } else {
                        $backlicensephoto = '';
                    }
                    if ($file = $request->file('police_clearance_image')) {
                        $destinationPath = base_path('public/Media/');
                        $police_clearance_image = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $police_clearance_image);
                    } else {
                        $police_clearance_image = '';
                    }
                    if ($file = $request->file('vehiclephoto')) {
                        $destinationPath = base_path('public/Media/');
                        $vehiclephoto = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $vehiclephoto);
                    } else {
                        $vehiclephoto = '';
                    }
                    if ($file = $request->file('profilephoto_url')) {
                        $destinationPath = base_path('public/Media/');
                        $profilephoto_url = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $profilephoto_url);
                    } else {
                        $profilephoto_url = 'mani.jpg';
                    }
                    $tasks_controller       = new PushNotificationCommonController;
                    $referralcode           = $tasks_controller->generateReferalCodeDriver();
                    /* QR Code Generate start*/
                    require base_path('public/phpqrcode/qrlib.php');
                    //include('phpqrcode/qrlib.php');

                    $tempDir = base_path('public/Media/QRCode/');


                    $codeContents = $codeContents = $request->input('country_code') . $request->input('mobile');
                    $fileName = $request->input('mobile') . md5($codeContents) . '.png';
                    $pngAbsoluteFilePath = $tempDir . $fileName;
                    $urlRelativeFilePath = $tempDir . $fileName;
                    if (!file_exists($pngAbsoluteFilePath)) {
                        QRcode::png($codeContents, $pngAbsoluteFilePath);
                    }
                    /* QR Code Generate end*/

                    $datass = array(
                        'firstname'             => $request->input('firstname'),
                        'middlename'            => $request->input('middlename'),
                        'lastname'              => $request->input('lastname'),
                        'mobile'                => $request->input('mobile'),
                        'dob'                   => $request->input('dob'),
                        'password'              => Hash::make($request->input('password')),
                        'email'                 => $request->input('email'),
                        'manager_account_no'    => $request->input('manager_account_no'),
                        'g_cash_accont_name'    => $request->input('g_cash_accont_name'),
                        'g_cash_no'             => $request->input('g_cash_no'),
                        'lastupdatedatetime'    => date('Y-m-d H:i:s'),
                        'profilephoto_url'      => $profilephoto_url,
                        'qr_code'               => $fileName,
                        'vehicle_id'            => $request->input('vehicle_id'),
                        'dura_bag_id'           => $request->input('dura_bag_id'),
                        'created_datetime'      => date('Y-m-d H:i:s'),
                        'isactive'              => '1',
                        'isvarified'            => '0',
                        'is_online'             => 1,
                        'referralcode'          => $referralcode,
                        'refered_by'            => '',
                        'isbusinessaccout'      => '0',
                        'latitude'              => $request->input('latitude'),
                        'longitude'             => $request->input('longitude'),
                        'created_at'            => date('Y-m-d H:i:s'),
                        'updated_at'            => date('Y-m-d H:i:s'),
                    );
                    $driver_id = DB::table('driveuser')->insertGetId($datass);
                    $docdata = array(
                        'driver_id' => $driver_id,
                        'cr_no' => $request->input('cr_no'),
                        'crno_image' => $crno_image,
                        'licence_no' => $request->input('licence_no'),
                        'frontlicensephoto' => $frontlicensephoto,
                        'backlicensephoto' => $backlicensephoto,
                        'police_clearance_no' => $request->input('police_clearance_no'),
                        'police_clearance_image' => $police_clearance_image,
                        'vehicle_id' => $request->input('vehicle_id'),
                        'vehiclephoto' => $vehiclephoto,
                        'document_type' => '',
                        'docsExpire' => '',
                        'docs_status' => '',
                        'document_file' => '',
                        'isactive' => '1',
                        'createddate' => date('Y-m-d H:i:s'),
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),
                    );
                    $walletData = array(
                        'driver_id' => $driver_id,
                        'wallet_amount' => '0',
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),
                    );
                    $driverWallet = DB::table('driver_wallet')->insert($walletData);
                    $addDatadoc = DB::table('drivepersonaldoc')->insertGetId($docdata);
                    // $driverData = DB::table('driveuser')->where('id', $driver_id)->first();

                    // $driverDoc = DB::table('drivepersonaldoc')->where('driver_id', $driver_id)->first();
                    // $driverWallet = DB::table('driver_wallet')->where('driver_id', $driver_id)->first();


                    $driverData = DB::table('driveuser')->where('id', $driver_id)->first();
                    if ($driverData->profilephoto_url != "") {
                        $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                    } else {
                        $driverData->profilephoto_url = $driverData->profilephoto_url;
                    }
                    if ($driverData->qr_code != '') {
                        $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                    } else {
                        $driverData->qr_code =  $driverData->qr_code;
                    }

                    $driverDoc = DB::table('drivepersonaldoc')->where('driver_id',  $driver_id)->first();
                    if ($driverDoc->crno_image != '') {
                        $driverDoc->crno_image = URL::to('/') . "/public/Media/" . $driverDoc->crno_image;
                    } else {
                        $driverDoc->crno_image = $driverDoc->crno_image;
                    }
                    if ($driverDoc->frontlicensephoto != '') {
                        $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                    } else {
                        $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                    }
                    if ($driverDoc->backlicensephoto != '') {
                        $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                    } else {
                        $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                    }
                    if ($driverDoc->vehiclephoto != '') {
                        $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                    } else {
                        $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $driver_id)->first();

                    $user = Driver::where('id', '=', $driver_id)->first();
                    $token = Auth::fromUser($user);
                    $tokenData = $this->respondWithToken($token);
                    $finalData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet,
                        'token'              => $this->respondWithToken($token),

                    );
                    $data = collect(["status" => 200, "message" => "Driver registration sucessfully", "data" => $finalData]);
                    //$data = collect(["status" => 200, "status" => "Success", "data" => $driverData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['message' => 'User already registered', 'status' => 405], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);;
            }
        }
    }
    public function driverUpdateProfile(Request $request)
    {
        $rules = [
            'firstname' => 'required',
            'middlename' => 'required',
            'lastname' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $userData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if (!empty($userData)) {

                    if ($file = $request->file('crno_image')) {
                        $destinationPath = base_path('public/Media/');
                        $crno_image = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $crno_image);
                    } else {
                        $crno_image = "";
                    }
                    if ($file = $request->file('frontlicensephoto')) {
                        $destinationPath = base_path('public/Media/');
                        $frontlicensephoto = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $frontlicensephoto);
                    } else {
                        $frontlicensephoto = '';
                    }
                    if ($file = $request->file('backlicensephoto')) {
                        $destinationPath = base_path('public/Media/');
                        $backlicensephoto = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $backlicensephoto);
                    } else {
                        $backlicensephoto = '';
                    }
                    if ($file = $request->file('police_clearance_image')) {
                        $destinationPath = base_path('public/Media/');
                        $police_clearance_image = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $police_clearance_image);
                    } else {
                        $police_clearance_image = '';
                    }
                    if ($file = $request->file('vehiclephoto')) {
                        $destinationPath = base_path('public/Media/');
                        $vehiclephoto = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $vehiclephoto);
                    } else {
                        $vehiclephoto = '';
                    }
                    if ($file = $request->file('profilephoto_url')) {
                        $destinationPath = base_path('public/Media/');
                        $profilephoto_url = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $profilephoto_url);
                    } else {
                        $profilephoto_url = 'mani.jpg';
                    }
                    $tasks_controller       = new PushNotificationCommonController;
                    $referralcode           = $tasks_controller->generateReferalCodeDriver();
                    /* QR Code Generate start*/
                    require base_path('public/phpqrcode/qrlib.php');
                    $tempDir = base_path('public/Media/QRCode/');
                    $codeContents = $codeContents = $request->input('country_code') . $request->input('mobile');
                    $fileName = $request->input('mobile') . md5($codeContents) . '.png';
                    $pngAbsoluteFilePath = $tempDir . $fileName;
                    $urlRelativeFilePath = $tempDir . $fileName;
                    if (!file_exists($pngAbsoluteFilePath)) {
                        QRcode::png($codeContents, $pngAbsoluteFilePath);
                    }
                    /* QR Code Generate end*/
                    $datass = array(
                        'firstname'             => $request->input('firstname'),
                        'middlename'            => $request->input('middlename'),
                        'lastname'              => $request->input('lastname'),
                        'mobile'                => $request->input('mobile'),
                        'dob'                   => $request->input('dob'),
                        'password'              => Hash::make($request->input('password')),
                        'email'                 => $request->input('email'),
                        'manager_account_no'    => $request->input('manager_account_no'),
                        'g_cash_accont_name'    => $request->input('g_cash_accont_name'),
                        'g_cash_no'             => $request->input('g_cash_no'),
                        'lastupdatedatetime'    => date('Y-m-d H:i:s'),
                        'profilephoto_url'      => $profilephoto_url,
                        'qr_code'               => $fileName,
                        'vehicle_id'            => $request->input('vehicle_id'),
                        'dura_bag_id'           => $request->input('dura_bag_id'),
                        'created_datetime'      => date('Y-m-d H:i:s'),
                        'isactive'              => '1',
                        'isvarified'            => '0',
                        'is_online'             => 1,
                        'referralcode'          => $referralcode,
                        'refered_by'            => '',
                        'isbusinessaccout'      => '0',
                        'latitude'              => $request->input('latitude'),
                        'longitude'             => $request->input('longitude'),
                        'created_at'            => date('Y-m-d H:i:s'),
                        'updated_at'            => date('Y-m-d H:i:s'),
                    );
                    $addData = DB::table('driveuser')->where('id', $request->driver_id)->update($datass);
                    $docdata = array(
                        'cr_no' => $request->input('cr_no'),
                        'crno_image' => $crno_image,
                        'licence_no' => $request->input('licence_no'),
                        'frontlicensephoto' => $frontlicensephoto,
                        'backlicensephoto' => $backlicensephoto,
                        'police_clearance_no' => $request->input('police_clearance_no'),
                        'police_clearance_image' => $police_clearance_image,
                        'vehicle_id' => $request->input('vehicle_id'),
                        'vehiclephoto' => $vehiclephoto,
                        'document_type' => '',
                        'docsExpire' => '',
                        'docs_status' => '',
                        'document_file' => '',
                        'isactive' => '1',
                        'createddate' => date('Y-m-d H:i:s'),
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),
                    );

                    $addDatadoc = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update($docdata);


                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                    if ($driverData->profilephoto_url != "") {
                        $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                    } else {
                        $driverData->profilephoto_url = $driverData->profilephoto_url;
                    }
                    if ($driverData->qr_code != '') {
                        $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                    } else {
                        $driverData->qr_code =  $driverData->qr_code;
                    }

                    $driverDoc = DB::table('drivepersonaldoc')->where('driver_id',  $request->driver_id)->first();
                    if ($driverDoc->crno_image != '') {
                        $driverDoc->crno_image = URL::to('/') . "/public/Media/" . $driverDoc->crno_image;
                    } else {
                        $driverDoc->crno_image = $driverDoc->crno_image;
                    }
                    if ($driverDoc->frontlicensephoto != '') {
                        $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                    } else {
                        $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                    }
                    if ($driverDoc->backlicensephoto != '') {
                        $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                    } else {
                        $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                    }
                    if ($driverDoc->vehiclephoto != '') {
                        $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                    } else {
                        $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $request->driver_id)->first();

                    $finalData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet

                    );
                    $data = collect(["status" => 200, "message" => "Driver Update sucessfully", "data" => $finalData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['message' => 'Driver not found', 'status' => 405], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);;
            }
        }
    }
    public function getDriverDetails(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData->profilephoto_url != "") {
                    $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                } else {
                    $driverData->profilephoto_url = $driverData->profilephoto_url;
                }
                if ($driverData->qr_code != '') {
                    $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                } else {
                    $driverData->qr_code =  $driverData->qr_code;
                }

                $driverDoc = DB::table('drivepersonaldoc')->where('driver_id',  $request->driver_id)->first();
                if ($driverDoc->crno_image != '') {
                    $driverDoc->crno_image = URL::to('/') . "/public/Media/" . $driverDoc->crno_image;
                } else {
                    $driverDoc->crno_image = $driverDoc->crno_image;
                }
                if ($driverDoc->frontlicensephoto != '') {
                    $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                } else {
                    $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                }
                if ($driverDoc->backlicensephoto != '') {
                    $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                } else {
                    $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                }
                if ($driverDoc->police_clearance_image != '') {
                    $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                } else {
                    $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                }
                if ($driverDoc->vehiclephoto != '') {
                    $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                } else {
                    $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                }
                if ($driverDoc->police_clearance_image != '') {
                    $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                } else {
                    $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                }
                $driverWallet = DB::table('driver_wallet')->where('driver_id', $request->driver_id)->first();
                // echo "<pre>";
                // print_r($driverData); 
                // die;
                $finalData = array(
                    'driverData'         => $driverData,
                    'driverDoc'          => $driverDoc,
                    'driverWallet'       => $driverWallet
                );
                $data = collect(["status" => 200, "message" => "Data found sucessfully", "data" => $finalData]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);;
            }
        }
    }
    public function driverDutyStatus(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->update(['is_online' => $request->is_online]);
                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                    if ($driverData->profilephoto_url != "") {
                        $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                    } else {
                        $driverData->profilephoto_url = $driverData->profilephoto_url;
                    }
                    if ($driverData->qr_code != '') {
                        $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                    } else {
                        $driverData->qr_code =  $driverData->qr_code;
                    }

                    $driverDoc = DB::table('drivepersonaldoc')->where('driver_id',  $request->driver_id)->first();
                    if ($driverDoc->crno_image != '') {
                        $driverDoc->crno_image = URL::to('/') . "/public/Media/" . $driverDoc->crno_image;
                    } else {
                        $driverDoc->crno_image = $driverDoc->crno_image;
                    }
                    if ($driverDoc->frontlicensephoto != '') {
                        $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                    } else {
                        $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                    }
                    if ($driverDoc->backlicensephoto != '') {
                        $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                    } else {
                        $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                    }
                    if ($driverDoc->vehiclephoto != '') {
                        $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                    } else {
                        $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $request->driver_id)->first();
                    if ($driverData->is_online == '1') {
                        $status = 'Online';
                    } else {
                        $status = 'Offline';
                    }
                    $finalData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );
                    $data = collect(["status" => 200, "message" => "You are " . $status . " sucessfully", "data" => $finalData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverVerifyItems(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'pickup_id' => 'required',
            'driver_action' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    $pickupData = DB::table('durapickupshedule')->where('id', $request->pickup_id)->first();
                    if ($pickupData) {
                        $pickupData = DB::table('durapickupshedule')->where('id', $request->pickup_id)->update([
                            'driver_action' => '1'
                        ]);
                        $data = collect(["status" => 200, "message" => "You are " . $status . " sucessfully", "data" => $finalData]);
                        return response()->json($data, 200);
                    } else {
                        return response()->json(['status' => 422, 'message' => "Order not found"], 409);
                    }
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found"], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }

    public function driverAutoAcceptStatus(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->update(['is_autoaccept' => $request->is_autoaccept]);
                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                    if ($driverData->profilephoto_url != "") {
                        $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                    } else {
                        $driverData->profilephoto_url = $driverData->profilephoto_url;
                    }
                    if ($driverData->qr_code != '') {
                        $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                    } else {
                        $driverData->qr_code =  $driverData->qr_code;
                    }

                    $driverDoc = DB::table('drivepersonaldoc')->where('driver_id',  $request->driver_id)->first();
                    if ($driverDoc->crno_image != '') {
                        $driverDoc->crno_image = URL::to('/') . "/public/Media/" . $driverDoc->crno_image;
                    } else {
                        $driverDoc->crno_image = $driverDoc->crno_image;
                    }
                    if ($driverDoc->frontlicensephoto != '') {
                        $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                    } else {
                        $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                    }
                    if ($driverDoc->backlicensephoto != '') {
                        $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                    } else {
                        $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                    }
                    if ($driverDoc->vehiclephoto != '') {
                        $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                    } else {
                        $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $request->driver_id)->first();
                    if ($driverData->is_autoaccept == '1') {
                        $status = 'AutoAccept On';
                    } else {
                        $status = 'AutoAccept Off';
                    }
                    $finalData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );
                    $data = collect(["status" => 200, "message" => "You are " . $status . " sucessfully", "data" => $finalData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverPickupDecline(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'pickup_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $pickupsheduleData = DB::table('durapickupshedule')
                    ->where('id', $request->pickup_id)
                    ->where('driver_id', $request->driver_id)
                    ->first();
                if ($pickupsheduleData) {
                    $pickupdeclineData = DB::table('driverdecline')
                        ->where('pickup_id', $request->pickup_id)
                        ->where('driver_id', $request->driver_id)
                        ->first();
                    if ($pickupdeclineData) {
                        $data = collect(["status" => 200, "message" => "You have allready decline"]);
                        return response()->json($data, 200);
                    } else {
                        $pickupsheduleData = DB::table('driverdecline')
                            ->insert([
                                'pickup_id' => $request->pickup_id,
                                'driver_id' => $request->driver_id
                            ]);
                        $pickupshedule = DB::table('durapickupshedule')
                            ->where('id', $request->pickup_id)
                            ->where('driver_id', $request->driver_id)
                            ->update([
                                'driver_id' => 0,
                                'status' => 1
                            ]);
                        $data = collect(["status" => 200, "message" => "You decline sucessfully", "data" => $pickupsheduleData]);
                        return response()->json($data, 200);
                    }
                } else {
                    $data = collect(["status" => 200, "message" => "You can'nt decline"]);
                    return response()->json($data, 200);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverAcceptPickup(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'pickup_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $pickupsheduleData = DB::table('durapickupshedule')
                    ->where('id', $request->pickup_id)
                    ->where('driver_id', $request->driver_id)
                    ->first();
                if ($pickupsheduleData) {
                    $pickupshedule = DB::table('durapickupshedule')
                        ->where('id', $request->pickup_id)
                        ->where('driver_id', $request->driver_id)
                        ->update([
                            'status' => 2
                        ]);
                    $data = collect(["status" => 200, "message" => "You Accept sucessfully", "data" => $pickupsheduleData]);
                    return response()->json($data, 200);
                } else {
                    $data = collect(["status" => 200, "message" => "You can'nt Accept"]);
                    return response()->json($data, 200);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function getDriverNotification(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    $notificationData = DB::table('notification')->where('user_id', $request->driver_id)->first();
                    $data = collect(["status" => 200, "message" => "Data found sucessfully", "data" => $notificationData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverCurrentLocation(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->update([
                        'latitude' => $request->latitude,
                        'longitude' => $request->longitude,
                    ]);
                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                    if ($driverData->profilephoto_url != "") {
                        $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                    } else {
                        $driverData->profilephoto_url = $driverData->profilephoto_url;
                    }
                    if ($driverData->qr_code != '') {
                        $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                    } else {
                        $driverData->qr_code =  $driverData->qr_code;
                    }

                    $driverDoc = DB::table('drivepersonaldoc')->where('driver_id',  $request->driver_id)->first();
                    if ($driverDoc->crno_image != '') {
                        $driverDoc->crno_image = URL::to('/') . "/public/Media/" . $driverDoc->crno_image;
                    } else {
                        $driverDoc->crno_image = $driverDoc->crno_image;
                    }
                    if ($driverDoc->frontlicensephoto != '') {
                        $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                    } else {
                        $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                    }
                    if ($driverDoc->backlicensephoto != '') {
                        $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                    } else {
                        $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                    }
                    if ($driverDoc->vehiclephoto != '') {
                        $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                    } else {
                        $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $request->driver_id)->first();;
                    $finalData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );
                    $data = collect(["status" => 200, "message" => "Updated sucessfully", "data" => $finalData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverServiceArea(Request $request)
    {

        $rules = [
            'country_code' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $countryData = DB::table('country')
                    ->where('phonecode', $request->input('country_code'))
                    ->first();

                $areaData = DB::table('service_area')
                    ->where('country', $countryData->country_name)
                    ->get();

                $combineData = array(
                    'areaData'         => $areaData,
                );
                $data = collect(["status" => 200, "message" => "Success", "data" => $combineData]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);;
            }
        }
    }
    public function driverLogin(Request $request)
    {
        $rules = [
            'country_code' => 'required',
            'mobile' => 'required',
            'password' => 'required',
            'service_id' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422,  'message' => $validator->messages()], 409);
        } else {
            try {
                $mobile = $request->input('mobile');
                $password = $request->input('password');
                $user = Driver::where('mobile', '=', $mobile)->first();
                if (!$user) {
                    return response()->json(['status' => 422, 'message' => 'Login Fail, please check mobile'], 409);
                }
                if (!Hash::check($password, $user->password)) {
                    return response()->json(['status' => 422, 'message' => 'Login Fail, pls check password'], 409);
                }
                //return response()->json(['success' => true, 'message' => 'success', 'data' => $user]);
                $addDatadoc = DB::table('driveuser')->where('id', $user->id)->update([
                    'latitude' => $request->input('latitude'),
                    'longitude' => $request->input('longitude'),
                    'lastupdatedatetime' => date('Y-m-d H:i:s'),
                ]);
                $driverData = DB::table('driveuser')->where('id', $user->id)->first();
                if ($driverData->profilephoto_url != "") {
                    $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                } else {
                    $driverData->profilephoto_url = $driverData->profilephoto_url;
                }
                if ($driverData->qr_code != '') {
                    $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                } else {
                    $driverData->qr_code =  $driverData->qr_code;
                }

                $driverDoc = DB::table('drivepersonaldoc')->where('driver_id', $user->id)->first();
                if ($driverDoc->crno_image != '') {
                    $driverDoc->crno_image = URL::to('/') . "/public/Media/" . $driverDoc->crno_image;
                } else {
                    $driverDoc->crno_image = $driverDoc->crno_image;
                }
                if ($driverDoc->frontlicensephoto != '') {
                    $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                } else {
                    $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                }
                if ($driverDoc->backlicensephoto != '') {
                    $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                } else {
                    $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                }
                if ($driverDoc->police_clearance_image != '') {
                    $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                } else {
                    $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                }
                if ($driverDoc->vehiclephoto != '') {
                    $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                } else {
                    $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                }
                if ($driverDoc->police_clearance_image != '') {
                    $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                } else {
                    $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                }
                $driverWallet = DB::table('driver_wallet')->where('driver_id', $user->id)->first();
                $token = Auth::fromUser($user);
                $tokenData = $this->respondWithToken($token);
                $combineData = array(
                    'driverData'        => $driverData,
                    'driverDoc'         => $driverDoc,
                    'driverWallet'      => $driverWallet,
                    'driverRating'      => '4',
                    'todaysTotalTrip'   => '0',
                    'dutyStatus'        => $driverData->is_online,
                    'autoAcceptOrder'   => false,
                    'token'              => $tokenData,
                );
                $data = collect(["status" => 200, "message" => "Success", "data" => $combineData]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverUpdatePassword(Request $request)
    {

        $rules = [
            'country_code' => 'required',
            'mobile' => 'required',
            'new_password' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422,  'message' => $validator->messages()], 409);
        } else {
            try {
                $driverData = DB::table('driveuser')
                    ->where('mobile', $request->input('mobile'))
                    ->first();
                if (count($driverData) > 0) {
                    $datass = array(
                        'password' => Hash::make($request->input('new_password')),
                        'updated_at' => date('Y-m-d H:i:s'),
                    );
                    $updateData = DB::table('driveuser')->where('mobile', $request->input('mobile'))->update($datass);

                    $driverData = DB::table('driveuser')->where('id', $driverData->id)->first();
                    if ($driverData->profilephoto_url != "") {
                        $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                    } else {
                        $driverData->profilephoto_url = $driverData->profilephoto_url;
                    }
                    if ($driverData->qr_code != '') {
                        $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                    } else {
                        $driverData->qr_code =  $driverData->qr_code;
                    }

                    $driverDoc = DB::table('drivepersonaldoc')->where('driver_id', $driverData->id)->first();
                    if ($driverDoc->crno_image != '') {
                        $driverDoc->crno_image = URL::to('/') . "/public/Media/" . $driverDoc->crno_image;
                    } else {
                        $driverDoc->crno_image = $driverDoc->crno_image;
                    }
                    if ($driverDoc->frontlicensephoto != '') {
                        $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                    } else {
                        $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                    }
                    if ($driverDoc->backlicensephoto != '') {
                        $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                    } else {
                        $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                    }
                    if ($driverDoc->vehiclephoto != '') {
                        $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                    } else {
                        $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $driverData->id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );
                    $data = collect(["status" => 200, "message" => "Success", "data" => $combineData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Mobile not fond", "data" => []], 409);;
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);;
            }
        }
    }
    public function driverLicenseUpload(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'front_licenseImage' => 'required',
            'back_licenseImage' => 'required',
            'license_no' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    if ($file = $request->file('front_licenseImage')) {
                        $destinationPath = base_path('public/Media/');
                        $front_licenseImage = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $front_licenseImage);
                    } else {
                        $front_licenseImage = '';
                    }
                    if ($file = $request->file('back_licenseImage')) {
                        $destinationPath = base_path('public/Media/');
                        $back_licenseImage = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $back_licenseImage);
                    } else {
                        $back_licenseImage = '';
                    }
                    $drivepersonaldocData = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update([
                        'licence_no' => $request->has('license_no') ? $request->license_no : "",
                        'frontlicensephoto' => $front_licenseImage,
                        'backlicensephoto' => $back_licenseImage,
                        'updated_at' => date("Y-m-d H:i:s"),
                    ]);

                    $drivepersonaldocData = DB::table('driveuser')->where('id', $request->driver_id)->update([
                        'latitude' => $request->has('latitude') ? $request->latitude : "",
                        'longitude' => $request->has('longitude') ? $request->longitude : "",
                        'updated_at' => date("Y-m-d H:i:s"),
                    ]);

                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                    if ($driverData->profilephoto_url != "") {
                        $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                    } else {
                        $driverData->profilephoto_url = $driverData->profilephoto_url;
                    }
                    if ($driverData->qr_code != '') {
                        $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                    } else {
                        $driverData->qr_code =  $driverData->qr_code;
                    }

                    $driverDoc = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->first();
                    if ($driverDoc->frontlicensephoto != '') {
                        $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                    } else {
                        $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                    }
                    if ($driverDoc->backlicensephoto != '') {
                        $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                    } else {
                        $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                    }
                    if ($driverDoc->vehiclephoto != '') {
                        $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                    } else {
                        $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $request->driver_id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );


                    $data = collect(["status" => 200, "message" => "Data found sucessfully", "data" => $combineData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }

    public function driverPoliceVerifcationUpload(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'police_clearance_image' => 'required',
            'police_clearance_no' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    if ($file = $request->file('police_clearance_image')) {
                        $destinationPath = base_path('public/Media/');
                        $police_clearance_image = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $police_clearance_image);
                    } else {
                        $police_clearance_image = '';
                    }

                    $drivepersonaldocData = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update([
                        'police_clearance_no' => $request->has('police_clearance_no') ? $request->police_clearance_no : "",
                        'police_clearance_image' => $police_clearance_image,
                        'updated_at' => date("Y-m-d H:i:s"),
                    ]);

                    $drivepersonaldocData = DB::table('driveuser')->where('id', $request->driver_id)->update([
                        'latitude' => $request->has('latitude') ? $request->latitude : "",
                        'longitude' => $request->has('longitude') ? $request->longitude : "",
                        'updated_at' => date("Y-m-d H:i:s"),
                    ]);

                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                    if ($driverData->profilephoto_url != "") {
                        $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                    } else {
                        $driverData->profilephoto_url = $driverData->profilephoto_url;
                    }
                    if ($driverData->qr_code != '') {
                        $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                    } else {
                        $driverData->qr_code =  $driverData->qr_code;
                    }

                    $driverDoc = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->first();
                    if ($driverDoc->frontlicensephoto != '') {
                        $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                    } else {
                        $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                    }
                    if ($driverDoc->backlicensephoto != '') {
                        $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                    } else {
                        $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                    }
                    if ($driverDoc->vehiclephoto != '') {
                        $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                    } else {
                        $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $request->driver_id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );


                    $data = collect(["status" => 200, "message" => "Data found sucessfully", "data" => $combineData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }

    public function driverClearanceUpload(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'crno_image' => 'required',
            'cr_no' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    if ($file = $request->file('crno_image')) {
                        $destinationPath = base_path('public/Media/');
                        $crno_image = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $crno_image);
                    } else {
                        $crno_image = '';
                    }

                    $drivepersonaldocData = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update([
                        'cr_no' => $request->has('cr_no') ? $request->cr_no : "",
                        'crno_image' => $crno_image,
                        'updated_at' => date("Y-m-d H:i:s"),
                    ]);

                    $drivepersonaldocData = DB::table('driveuser')->where('id', $request->driver_id)->update([
                        'latitude' => $request->has('latitude') ? $request->latitude : "",
                        'longitude' => $request->has('longitude') ? $request->longitude : "",
                        'updated_at' => date("Y-m-d H:i:s"),
                    ]);

                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                    if ($driverData->profilephoto_url != "") {
                        $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                    } else {
                        $driverData->profilephoto_url = $driverData->profilephoto_url;
                    }
                    if ($driverData->qr_code != '') {
                        $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                    } else {
                        $driverData->qr_code =  $driverData->qr_code;
                    }

                    $driverDoc = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->first();
                    if ($driverDoc->crno_image != '') {
                        $driverDoc->crno_image = URL::to('/') . "/public/Media/" . $driverDoc->crno_image;
                    } else {
                        $driverDoc->crno_image = $driverDoc->crno_image;
                    }
                    if ($driverDoc->frontlicensephoto != '') {
                        $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                    } else {
                        $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                    }
                    if ($driverDoc->backlicensephoto != '') {
                        $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                    } else {
                        $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                    }
                    if ($driverDoc->vehiclephoto != '') {
                        $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                    } else {
                        $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $request->driver_id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );


                    $data = collect(["status" => 200, "message" => "Data found sucessfully", "data" => $combineData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }

    public function driverVehicleUpload(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'vehiclephoto' => 'required',
            'vehicle_name' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    if ($file = $request->file('vehiclephoto')) {
                        $destinationPath = base_path('public/Media/');
                        $vehiclephoto = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $vehiclephoto);
                    } else {
                        $vehiclephoto = '';
                    }
                    $drivepersonaldocData = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update([
                        'vehicle_name' => $request->has('vehicle_name') ? $request->vehicle_name : "",
                        'vehiclephoto' => $vehiclephoto,
                        'updated_at' => date("Y-m-d H:i:s"),
                    ]);
                    $drivepersonaldocData = DB::table('driveuser')->where('id', $request->driver_id)->update([
                        'latitude' => $request->has('latitude') ? $request->latitude : "",
                        'longitude' => $request->has('longitude') ? $request->longitude : "",
                        'updated_at' => date("Y-m-d H:i:s"),
                    ]);

                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                    if ($driverData->profilephoto_url != "") {
                        $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                    } else {
                        $driverData->profilephoto_url = $driverData->profilephoto_url;
                    }
                    if ($driverData->qr_code != '') {
                        $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                    } else {
                        $driverData->qr_code =  $driverData->qr_code;
                    }

                    $driverDoc = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->first();
                    if ($driverDoc->crno_image != '') {
                        $driverDoc->crno_image = URL::to('/') . "/public/Media/" . $driverDoc->crno_image;
                    } else {
                        $driverDoc->crno_image = $driverDoc->crno_image;
                    }
                    if ($driverDoc->frontlicensephoto != '') {
                        $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                    } else {
                        $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                    }
                    if ($driverDoc->backlicensephoto != '') {
                        $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                    } else {
                        $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                    }
                    if ($driverDoc->vehiclephoto != '') {
                        $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                    } else {
                        $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $request->driver_id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );


                    $data = collect(["status" => 200, "message" => "Data found sucessfully", "data" => $combineData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }

    public function driverProfilePicUpload(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'profilephoto_url' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    if ($file = $request->file('profilephoto_url')) {
                        $destinationPath = base_path('public/Media/');
                        $profilephoto_url = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $profilephoto_url);
                    } else {
                        $profilephoto_url = '';
                    }
                    $drivepersonaldocData = DB::table('driveuser')->where('id', $request->driver_id)->update([
                        'profilephoto_url' => $profilephoto_url,
                        'latitude' => $request->has('latitude') ? $request->latitude : "",
                        'longitude' => $request->has('longitude') ? $request->longitude : "",
                        'updated_at' => date("Y-m-d H:i:s"),
                    ]);

                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                    if ($driverData->profilephoto_url != "") {
                        $driverData->profilephoto_url = URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                    } else {
                        $driverData->profilephoto_url = $driverData->profilephoto_url;
                    }
                    if ($driverData->qr_code != '') {
                        $driverData->qr_code = URL::to('/') . "/public/Media/QRCode/" . $driverData->qr_code;
                    } else {
                        $driverData->qr_code =  $driverData->qr_code;
                    }

                    $driverDoc = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->first();
                    if ($driverDoc->crno_image != '') {
                        $driverDoc->crno_image = URL::to('/') . "/public/Media/" . $driverDoc->crno_image;
                    } else {
                        $driverDoc->crno_image = $driverDoc->crno_image;
                    }
                    if ($driverDoc->frontlicensephoto != '') {
                        $driverDoc->frontlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->frontlicensephoto;
                    } else {
                        $driverDoc->frontlicensephoto = $driverDoc->frontlicensephoto;
                    }
                    if ($driverDoc->backlicensephoto != '') {
                        $driverDoc->backlicensephoto = URL::to('/') . "/public/Media/" . $driverDoc->backlicensephoto;
                    } else {
                        $driverDoc->backlicensephoto = $driverDoc->backlicensephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image = $driverDoc->police_clearance_image;
                    }
                    if ($driverDoc->vehiclephoto != '') {
                        $driverDoc->vehiclephoto = URL::to('/') . "/public/Media/" . $driverDoc->vehiclephoto;
                    } else {
                        $driverDoc->vehiclephoto =  $driverDoc->vehiclephoto;
                    }
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $request->driver_id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );


                    $data = collect(["status" => 200, "message" => "Data found sucessfully", "data" => $combineData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function generateNumericCode($n)
    {
        $generator = "1234567890";
        $result = "";
        for ($i = 1; $i <= $n; $i++) {
            $result .= substr($generator, (rand() % (strlen($generator))), 1);
        }
        // Return result
        return $result;
    }
}
