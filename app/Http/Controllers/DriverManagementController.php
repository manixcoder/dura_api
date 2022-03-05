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
    public function __construct(){
        date_default_timezone_set("Asia/Kolkata");
    }
    public function generatedriverRefrallCode(){
        $driverData = DB::table('driveuser')->get();
        foreach($driverData as $driver){
           $tasks_controller           = new PushNotificationCommonController;
           $referalCode                = $tasks_controller->generateDriverReferralCode($driver->id);   
        }
    }

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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
        } else {
            try {
                if($request->is_forgot ==='1'){
                    if (is_numeric($request->input('mobile'))) {
                        $id = DB::table('users_otp')->insertGetId([
                            'otp' => $request->input('otp'),
                            'country_code' => $request->input('country_code'),
                            'phone' => $request->input('mobile'),
                            'email' => $request->input('mobile')
                        ]);
                        require base_path('public/twilio-php-main/src/Twilio/autoload.php');
                        $sid = env('SID');
                        $token = env('TWILIO_TOKEN');
                        $twilio = new Client(env('SID'),  env('TWILIO_TOKEN'));
                        $message = $twilio->messages->create(
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
                }else{
                $driverData = DB::table('driveuser')->where('mobile', $request->input('mobile'))->get();
                if (count($driverData) > 0) {
                    return response()->json(['status' => 409, 'message' => 'This mobile number is already registered', 'data' => []], 409);
                } else {
                    
                    if (is_numeric($request->input('mobile'))) {
                        $id = DB::table('users_otp')->insertGetId([
                            'otp' => $request->input('otp'),
                            'country_code' => $request->input('country_code'),
                            'phone' => $request->input('mobile'),
                            'email' => $request->input('mobile')
                        ]);
                        require base_path('public/twilio-php-main/src/Twilio/autoload.php');
                        $sid = env('SID');
                        $token = env('TWILIO_TOKEN');
                        $twilio = new Client(env('SID'),  env('TWILIO_TOKEN'));
                        $message = $twilio->messages->create(
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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
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
                    $driverData = DB::table('driveuser')->where('mobile', $request->input('mobile'))->where('country_code', $request->input('country_code'))->first();
                    $data = collect([
                        "status" => 200,
                        "message" => "otp varified",
                        "data" => $driverData
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
                'status' => 405,
                'message' => $validator->messages()
            ], 409);
        } else {

            try {
                $userd = DB::table('driveuser')->where('email', $request->email)->get();
                if (count($userd) == 0) {
                    $mobileData = DB::table('driveuser')->where('mobile', $request->mobile)->get();
                if (count($mobileData) == 0) {

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
                        'dob'                   => $request->has('dob') ? $request->dob : "0000-00-00",
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
                        'country_code'          => $request->input('country_code'),
                        'device_type'           => $request->input('device_type'),
                        'device_id'             => $request->input('device_id'),
                        'is_online'             => 1,
                        'refered_by'            => '',
                        'isbusinessaccout'      => '0',
                        'latitude'              => $request->input('latitude'),
                        'longitude'             => $request->input('longitude'),
                        'created_at'            => date('Y-m-d H:i:s'),
                        'updated_at'            => date('Y-m-d H:i:s'),
                    );
                    $driver_id = DB::table('driveuser')->insertGetId($datass);
                    
                    $tasks_controller           = new PushNotificationCommonController;
                    $referalCode                = $tasks_controller->generateDriverReferralCode($driver_id); 
                    $driverData = DB::table('driveuser')->where('id',$driver_id)->update([
                        'referralcode'=>$referalCode
                        ]);
                        
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
                        'amount' => '0',
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),
                    );
                    $driverWallet               = DB::table('driver_wallet_recharge')->insert($walletData);
                    $addDatadoc                 = DB::table('drivepersonaldoc')->insertGetId($docdata);
                   
                        
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
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $driver_id)->first();
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
                    $data = collect(["status" => 405, "message" => "Mobile already registered"]);
                    return response()->json($data, 409);
                    //return response()->json(['message' => 'Mobile already registered', 'status' => 405], 409);
                }   
                } else {
                    $data = collect(["status" => 405, "message" => "Email already registered"]);
                    return response()->json($data, 409);
                   // return response()->json(['message' => 'Email already registered', 'status' => 405], 409);
                }
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);;
            }
        }
    }
   
    public function driverUpdateProfile(Request $request, Driver $driver)
    {
        $rules = [
            'firstname' => 'required',
            //'middlename' => 'required',
            'lastname' => 'required',
            //'email' => 'email|unique:driveuser,email,'. $driver->id .''
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $userData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if (!empty($userData)) {
                    if ($file = $request->file('profilephoto_url')) {
                        $destinationPath = base_path('public/Media/');
                        $profilephoto_url = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $profilephoto_url);
                    } else {
                        $profilephoto_url = $userData->profilephoto_url;
                    }
                    $datass = array(
                        'firstname'             => $request->has('firstname') ? $request->firstname : $userData->firstname ,
                        'middlename'            => $request->has('middlename') ? $request->middlename : $userData->middlename,
                        'lastname'              => $request->has('lastname') ? $request->lastname : $userData->lastname,
                        'dob'                   => $request->has('dob') ? $request->dob : $userData->dob,
                        //'password'              => Hash::make($request->input('password')),
                        'g_cash_accont_name'    => $request->has('g_cash_accont_name') ? $request->g_cash_accont_name : $userData->g_cash_accont_name,
                        'g_cash_no'             => $request->has('g_cash_no') ? $request->g_cash_no : $userData->g_cash_no,
                        'lastupdatedatetime'    => date('Y-m-d H:i:s'),
                        'vehicle_id'            => $request->has('vehicle_id') ? $request->vehicle_id : $userData->vehicle_id,
                        'dura_bag_id'           => $request->has('dura_bag_id') ? $request->dura_bag_id : $userData->dura_bag_id,
                        'is_online'             => $request->has('is_online') ? $request->is_online : $userData->is_online,
                        'refered_by'            => $request->has('refered_by') ? $request->refered_by : $userData->refered_by,
                        'isbusinessaccout'      => $request->has('isbusinessaccout') ? $request->isbusinessaccout : $userData->isbusinessaccout,
                        'manager_account_no'    => $request->has('manager_account_no') ? $request->manager_account_no : $userData->manager_account_no,
                        'profilephoto_url'      => $profilephoto_url,
                        'google_link'           => $request->has('google_link') ? $request->google_link : $userData->google_link,
                        'facebook_link'         => $request->has('facebook_link') ? $request->facebook_link : $userData->facebook_link,
                        'service_area_id'       => $request->has('service_area_id') ? $request->service_area_id : $userData->service_area_id,
                        'latitude'              => $request->input('latitude'),
                        'longitude'             => $request->input('longitude'),
                        'created_at'            => date('Y-m-d H:i:s'),
                        'updated_at'            => date('Y-m-d H:i:s'),
                    );
                    $addData = DB::table('driveuser')->where('id', $request->driver_id)->update($datass);
                    // $docdata = array(
                    //     'cr_no' => $request->input('cr_no'),
                    //     //'crno_image' => $crno_image,
                    //     'licence_no' => $request->input('licence_no'),
                    //     //'frontlicensephoto' => $frontlicensephoto,
                    //     //'backlicensephoto' => $backlicensephoto,
                    //     'police_clearance_no' => $request->input('police_clearance_no'),
                    //     //'police_clearance_image' => $police_clearance_image,
                    //     'vehicle_id' => $request->input('vehicle_id'),
                    //     //'vehiclephoto' => $vehiclephoto,
                    //     'document_type' => '',
                    //     'docsExpire' => '',
                    //     'docs_status' => '',
                    //     'document_file' => '',
                    //     'isactive' => '1',
                    //     'createddate' => date('Y-m-d H:i:s'),
                    //     'created_at' => date('Y-m-d H:i:s'),
                    //     'updated_at' => date('Y-m-d H:i:s'),
                    // );
                    // $addDatadoc = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update($docdata);


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
                    // if ($driverDoc->police_clearance_image != '') {
                    //     $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    // } else {
                    //     $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    // }
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();

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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                // dd($driverData);
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
                //dd($driverDoc);
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
                
                $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
                
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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
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
                    
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
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
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
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
                    
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
        } else {
            try {
                $pickupsheduleData = DB::table('durapickupshedule')
                ->where('id', $request->pickup_id)
                //->where('driver_id', $request->driver_id)
                ->first();
                if ($pickupsheduleData) {
                    $pickupdeclineData = DB::table('driver_pick_up_details')
                    ->where('pickup_id', $request->pickup_id)
                    ->where('driver_id', $request->driver_id)
                    ->first();
                    if ($pickupdeclineData) {
                        $pickupsheduleData = DB::table('driver_pick_up_details')
                        ->where('pickup_id', $request->pickup_id)
                        ->where('driver_id', $request->driver_id)
                        ->update([
                            'pick_up_status' => 2,
                        ]);
                        $pickupshedule = DB::table('durapickupshedule')
                        ->where('id', $request->pickup_id)
                        //->where('driver_id', $request->driver_id)
                        ->update([
                            'driver_id' => 0,
                            'status' => 1
                        ]);
                        $orderData = DB::table('durapickupshedule')
                        ->where('id', $request->pickup_id)
                        ->first();
                        $getUsers      =  DB::table('users')
                        ->where('id', $orderData->user_id)
                        ->first();
                        $registatoin_ids = $getUsers->device_id;
                        //$message = $orderData;
                        $message = array(
                            "pushmessage" => $orderData,
                            "notification_type"=>"Deccline"
                            );
                        $notification =array(
                            'title'=> "Driver Deccline Your Order",
                            'sound'=> "default",
                            'body' => "Deccline Order",
                        );
                        $tasks_controller = new PushNotificationCommonController;
                        $result = $tasks_controller->send_notification($registatoin_ids, $message,$notification);
                        
                        $message= "You have decline pickup successfully with Duradrive at " . date("F j, Y, g:i A");
                        $ext = 'Decline Pickup';
                        $tasks_controller->driverNotification($request->driver_id, $message, $ext);
                        $data = collect(["status" => 200, "message" => "You decline sucessfully", "data" => $pickupsheduleData]);
                        return response()->json($data, 200);
                    } else {
                        $data = collect([
                            "status" => 200, 
                            "message" => "You can'nt decline"
                        ]);
                        return response()->json($data, 200);
                }
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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
        } else {
            try {
                $pickupsheduleData = DB::table('durapickupshedule')
                    ->where('id', $request->pickup_id)
                    //->where('driver_id', $request->driver_id)
                    ->first();
                 
                if ($pickupsheduleData) {
                    
                    $pickupshedule = DB::table('durapickupshedule')
                    ->where('id', $request->pickup_id)
                   // ->where('driver_id', $request->driver_id)
                    ->update([
                        'driver_id'=>$request->driver_id,
                        'status' => 2
                    ]);
                    $acceptData = DB::table('driver_pick_up_details')
                    ->where('pickup_id', $request->pickup_id)
                    ->where('driver_id', $request->driver_id)
                    ->get();
                    if($acceptData->isEmpty()){
                        $pickupsheduleData = DB::table('driver_pick_up_details')
                            ->insert([
                                'pickup_id' => $request->pickup_id,
                                'driver_id' => $request->driver_id,
                                'pick_up_status'=> '1'
                            ]);
                    } 
                $orderData = DB::table('durapickupshedule')->where('id', $request->pickup_id)->first();
                $getUsers      =  DB::table('users')->where('id', $orderData->user_id)->first();
                $registatoin_ids = $getUsers->device_id;
                $message = array(
                    "pushmessage" => array('data'=>$orderData),
                    "notification_type"=>"accepted"
                );
                $notification =array(
                         'title'=> "Driver accept Your Order",
                         'sound'=> "default",
                         'body' => "Accepted Order",
                     );
                $tasks_controller = new PushNotificationCommonController;
                $result = $tasks_controller->user_send_notification($registatoin_ids, $message,$notification);
                
                $message= "You have accept pickup successfully with Duradrive at " . date("F j, Y, g:i A");
                $ext = 'Accept Pickup';
                $tasks_controller->driverNotification($request->driver_id, $message, $ext);
                
                $data = collect(["status" => 200, "message" => "You Accept sucessfully", "data" => $pickupsheduleData]);
                return response()->json($data, 200);
                } else {
                    $data = collect([
                        "status" => 200, 
                        "message" => "You can'nt Accept"
                        ]);
                    return response()->json($data, 200);
                }
            } catch (\Exception $e) {
                dd($e);
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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
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
                    
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();;
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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
        } else {
            try {
                $countryData = DB::table('country')
                    ->where('phonecode', $request->input('country_code'))
                    ->first();
                if($request->input('country_code') =='63'){
                   $areaData = DB::table('service_area')
                    ->where('country', 'PHILIPPINES')
                    ->get(); 
                }else{
                    $areaData = DB::table('service_area')
                    ->where('country', 'INDIA')
                    ->get();
                }
                

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
                $country_code = $request->input('country_code');
                $user = Driver::where('mobile', '=', $mobile)->first();
                if (!$user) {
                    return response()->json(['status' => 422, 'message' => 'Login Fail, please check mobile'], 409);
                }
                if (!Hash::check($password, $user->password)) {
                    return response()->json(['status' => 422, 'message' => 'Login Fail, pls check password'], 409);
                }
                $countryCodeCheck = Driver::where('country_code', '=', $country_code)->where('mobile', '=', $mobile)->first();
                if(!$countryCodeCheck){
                   return response()->json(['status' => 422, 'message' => 'Login Fail, pls check country code'], 409); 
                }
                
                $addDatadoc = DB::table('driveuser')->where('id', $user->id)->update([
                    'service_area_id'       => $request->input('service_id'),
                    'device_type'           => $request->input('device_type'),
                    'device_id'             => $request->input('device_id'),
                    'latitude'              => $request->input('latitude'),
                    'longitude'             => $request->input('longitude'),
                    'lastupdatedatetime'    => date('Y-m-d H:i:s'),
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
               
                $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $user->id)->first();
                $driverRatingData = DB::table('driveuserrating')->where('driverid', $user->id)->first();
                $avg_stars = DB::table('driveuserrating')->where('driverid', $user->id)->avg('rating');
                $driverBankAccounts = DB::table('driver_bank_accounts')->where('driver_id', $user->id)->get();
                $token = Auth::fromUser($user);
                $tokenData = $this->respondWithToken($token);
                $combineData = array(
                    'driverData'        => $driverData,
                    'driverDoc'         => $driverDoc,
                    'driverWallet'      => $driverWallet,
                    'driverRating'      => $avg_stars,
                    'todaysTotalTrip'   => '0',
                    'bank_accounts'     => $driverBankAccounts,
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
            'driver_id' => 'required',
            'new_password' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422,  'message' => $validator->messages()], 409);
        } else {
            try {
                
                $driverData = DB::table('driveuser')
                    ->where('id', $request->input('driver_id'))
                    ->first();
                    $password = $request->input('old_password');
                   if (!Hash::check($request->input('old_password'), $driverData->password)) {
                       return response()->json(['status' => 422, 'message' => 'Old password not matched'], 409);
                   }
                  
                if ($driverData) {
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
                    
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $driverData->id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        //'driverDoc'          => $driverDoc,
                        //'driverWallet'       => $driverWallet
                    );
                    $data = collect(["status" => 200, "message" => "Success", "data" => $combineData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Mobile not fond", "data" => []], 409);;
                }
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);;
            }
        }
    }
    public function driverLicenseUpload(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                $drivepersonaldocData = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->first();
                if ($driverData) {
                    if ($file = $request->file('front_licenseImage')) {
                        $destinationPath = base_path('public/Media/');
                        $front_licenseImage = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $front_licenseImage);
                    } else {
                        $front_licenseImage = $drivepersonaldocData->frontlicensephoto;
                    }
                    if ($file = $request->file('back_licenseImage')) {
                        $destinationPath = base_path('public/Media/');
                        $back_licenseImage = uniqid('file') . "-" . $file->getClientOriginalName();
                        $path = $file->move($destinationPath, $back_licenseImage);
                    } else {
                        $back_licenseImage = $drivepersonaldocData->backlicensephoto;
                    }
                    $drivepersonaldocData = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update([
                        'licence_no'        => $request->has('license_no') ? $request->license_no : "",
                        'frontlicensephoto' => $front_licenseImage,
                        'backlicensephoto'  => $back_licenseImage,
                        'updated_at'        => date("Y-m-d H:i:s"),
                    ]);
                    $drivepersonaldocData = DB::table('driveuser')
                        ->where('id', $request->driver_id)->update([
                            'latitude'      => $request->has('latitude') ? $request->latitude : "",
                            'longitude'     => $request->has('longitude') ? $request->longitude : "",
                            'updated_at'    => date("Y-m-d H:i:s"),
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
                   
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
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
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
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
                    
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
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
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
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
                    
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
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
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
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
                    
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
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
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
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
                    
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
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

    public function driverPersonalInfoUpload(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    $driverPersonalInfoData = DB::table('driveuser')
                        ->where('id', $request->driver_id)->update([
                            'firstname'     => $request->has('firstname') ? $request->firstname : "",
                            'middlename'    => $request->has('middlename') ? $request->middlename : "",
                            'lastname'      => $request->has('lastname') ? $request->lastname : "",
                            'manger_id'     => $request->has('manger_id') ? $request->manger_id : "",
                            'dob'           => $request->has('dob') ? $request->dob : "",
                            //'referralcode'  => $request->has('referralcode') ? $request->referralcode : "",
                            'latitude'      => $request->has('latitude') ? $request->latitude : "",
                            'longitude'     => $request->has('longitude') ? $request->longitude : "",
                            'updated_at'    => date("Y-m-d H:i:s"),
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
                    
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );
                    $data = collect(["status" => 200, "message" => "Updated sucessfully", "data" => $combineData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }


    public function driverGCashdetailUpload(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    // if ($file = $request->file('profilephoto_url')) {
                    //     $destinationPath = base_path('public/Media/');
                    //     $profilephoto_url = uniqid('file') . "-" . $file->getClientOriginalName();
                    //     $path = $file->move($destinationPath, $profilephoto_url);
                    // } else {
                    //     $profilephoto_url = $driverData->profilephoto_url;
                    // }
                    $driverPersonalInfoData = DB::table('driveuser')
                        ->where('id', $request->driver_id)->update([
                           // 'profilephoto_url'     => $profilephoto_url,
                            'g_cash_no'    => $request->has('g_cash_no') ? $request->g_cash_no : "",
                            'g_cash_accont_name'      => $request->has('g_cash_accont_name') ? $request->g_cash_accont_name : "",
                            'latitude'      => $request->has('latitude') ? $request->latitude : "",
                            'longitude'     => $request->has('longitude') ? $request->longitude : "",
                            'updated_at'    => date("Y-m-d H:i:s"),
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
                   
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );
                    $data = collect(["status" => 200, "message" => "Updated sucessfully", "data" => $combineData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }

    public function driverDurabagIDUpload(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    
                    $driverPersonalInfoData = DB::table('driveuser')
                        ->where('id', $request->driver_id)->update([
                            'dura_bag_id'    => $request->has('dura_bag_id') ? $request->dura_bag_id : "",
                            'latitude'      => $request->has('latitude') ? $request->latitude : "",
                            'longitude'     => $request->has('longitude') ? $request->longitude : "",
                            'updated_at'    => date("Y-m-d H:i:s"),
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
                   
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );
                    $data = collect(["status" => 200, "message" => "Updated sucessfully", "data" => $combineData]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['status' => 422, 'message' => "Driver not found", "data" => null], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverPickupDetails(Request $request){
        
        $rules = [
            'driver_id' => 'required',
            'pickup_id'=> 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    $driverPersonalInfoData = DB::table('driveuser')
                        ->where('id', $request->driver_id)->update([
                            'latitude'      => $request->has('latitude') ? $request->latitude : "",
                            'longitude'     => $request->has('longitude') ? $request->longitude : "",
                            'updated_at'    => date("Y-m-d H:i:s"),
                        ]);
                    
                }
                $pickupData = DB::table('durapickupshedule')->where('id', $request->pickup_id)->first();
                if($pickupData->is_stop =='1'){
                    $stopData = DB::table('pickup_stoplocation')->where('pickup_id', $request->pickup_id)->get();
                }else{
                    $stopData= [];
                }
                $servicesData = DB::table('durapickup_services')->where('pickup_id', $request->pickup_id)->get();
                // echo "<pre>";
                // print_r($pickupData->is_stop);
                // die;
                $combineData = array(
                        'pickupData'            => $pickupData,
                        'stopData'              => $stopData,
                        'servicesData'          => $servicesData
                    );
                $data = collect(["status" => 200, "message" => "Updated sucessfully", "data" => $combineData]);
                return response()->json($data, 200);
                
                
                
            }catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
    }
    }
   public function driverdocUpload(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            // 'doc_type' => 'required',
            // 'image_type' => 'required',
            // 'image' => 'required',
            // 'docs_no' => 'required',
            // 'vehicle_name' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    if ($request->doc_type == 'licence') {
                        if ($request->image_type == 'front') {
                            if ($file = $request->file('image')) {
                                $destinationPath = base_path('public/Media/');
                                $image = uniqid('file') . "-" . $file->getClientOriginalName();
                                $path = $file->move($destinationPath, $image);
                                $driverDocs = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update([
                                    'frontlicensephoto' => $image,
                                    'licence_no'=>$request->docs_no,
                                    'updated_at' => date("Y-m-d H:i:s"),
                                ]);
                            }
                        } else if ($request->image_type == 'back') {
                            if ($file = $request->file('image')) {
                                $destinationPath = base_path('public/Media/');
                                $image = uniqid('file') . "-" . $file->getClientOriginalName();
                                $path = $file->move($destinationPath, $image);
                                $driverDocs = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update([
                                    'backlicensephoto' => $image,
                                    'licence_no'=>$request->docs_no,
                                    'updated_at' => date("Y-m-d H:i:s"),
                                ]);
                            }
                        } else {
                            if ($file = $request->file('image')) {
                                $destinationPath = base_path('public/Media/');
                                $image = uniqid('file') . "-" . $file->getClientOriginalName();
                                $path = $file->move($destinationPath, $image);
                                $driverDocs = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update([
                                    'backlicensephoto' => $image,
                                    'updated_at' => date("Y-m-d H:i:s"),
                                ]);
                            }
                        }
                    } else if ($request->doc_type == 'police') {
                        if ($request->image_type == 'single') {
                            if ($file = $request->file('image')) {
                                $destinationPath = base_path('public/Media/');
                                $image = uniqid('file') . "-" . $file->getClientOriginalName();
                                $path = $file->move($destinationPath, $image);
                                $driverDocs = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update([
                                    'police_clearance_image' => $image,
                                    'police_clearance_no'=>$request->docs_no,
                                    'updated_at' => date("Y-m-d H:i:s"),
                                ]);
                            }
                        }
                    } else if ($request->doc_type == 'cr') {
                        if ($request->image_type == 'single') {
                            if ($file = $request->file('image')) {
                                $destinationPath = base_path('public/Media/');
                                $image = uniqid('file') . "-" . $file->getClientOriginalName();
                                $path = $file->move($destinationPath, $image);
                                $driverDocs = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update([
                                    'crno_image' => $image,
                                    'cr_no'=>$request->docs_no,
                                    'updated_at' => date("Y-m-d H:i:s"),
                                ]);
                            }
                        }
                    } else if ($request->doc_type == 'vehicle') {
                        if ($request->image_type == 'single') {
                            if ($file = $request->file('image')) {
                                $destinationPath = base_path('public/Media/');
                                $image = uniqid('file') . "-" . $file->getClientOriginalName();
                                $path = $file->move($destinationPath, $image);
                                $driverDocs = DB::table('drivepersonaldoc')->where('driver_id', $request->driver_id)->update([
                                    'vehiclephoto' => $image,
                                    'vehicle_name'=>$request->vehicle_name,
                                    'updated_at' => date("Y-m-d H:i:s"),
                                ]);
                            }
                        }
                    } else {

                    }

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
                    // if ($driverDoc->police_clearance_image != '') {
                    //     $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    // } else {
                    //     $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    // }
                    $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        'driverDoc'          => $driverDoc,
                        'driverWallet'       => $driverWallet
                    );
                    $data = collect(["status" => 200, "message" => "Updated sucessfully", "data" => $combineData]);
                    return response()->json($data, 200);
                }
            } catch (\Exception $e) {
               // dd($e);
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    
    public function driverAddBankDetails(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
            'bank_name' => 'required',
            'bank_account' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                if ($driverData) {
                    $driverWallet = DB::table('driver_bank_accounts')->insert([
                        'driver_id'=>$request->driver_id,
                        'bank_name'=> $request->has('bank_name') ? $request->bank_name : "",
                        'bank_account'=>$request->has('bank_account') ? $request->bank_account : "",
                        ]);
                     $driverWallet = DB::table('driver_wallet_recharge')->where('driver_id', $request->driver_id)->first();
                     $driverBankAccounts = DB::table('driver_bank_accounts')->where('driver_id', $request->driver_id)->get();
                    $combineData = array(
                        'driverData'         => $driverData,
                       // 'driverDoc'          => $driverDoc,
                       // 'driverWallet'       => $driverWallet,
                        'bank_accounts'     => $driverBankAccounts,
                    );
                    $data = collect(["status" => 200, "message" => "Updated sucessfully", "data" => $combineData]);
                    return response()->json($data, 200);
                }
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverRatingDetails(Request $request)
    {
        $rules = [
            'driver_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
               $driverRating = DB::table('driveuserrating as rat')
                                ->join('users as u', 'rat.userid', '=', 'u.id')
                    			->where('rat.orderid','=',5)
                    			->select('rat.*', 'u.*')
                    			->get();
                $combineData = array(
                    'driverRating'         => $driverRating,
                    //'driverDoc'          => $driverDoc,
                    //'driverWallet'       => $driverWallet
                );
                $data = collect(["status" => 200, "message" => "Updated sucessfully", "data" => $combineData]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverOrderListToday(Request $request){
         $rules = [
            'driver_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $date = date("Y-m-d");
                $pick_up_details = DB::table('driver_pick_up_details as pd') 
                                ->join('durapickupshedule as ds', 'pd.pickup_id', '=', 'ds.id')
                    			->where('pd.driver_id','=',$request->driver_id)
                    		    ->whereDate('ds.pdate', $date)
                    			->orderBy('pd.id', 'DESC')
                    			->select('ds.*', 'pd.pick_up_status','pd.id as p_id')
                    			->get();
                if(count($pick_up_details) > 0){
                    $totalEarning =0; 
                foreach($pick_up_details as $IsPresent) {	
                    if ($IsPresent) {
                        $services = DB::table('durapickup_services as ds')
                        ->join('pricecard as pc', 'ds.service_id', '=', 'pc.id')
                        ->where('ds.pickup_id', $IsPresent->id)
                        ->select('pc.id', 'pc.services', 'pc.servicefee')
                        ->get();
                        $getpickup  = DB::table('durapickupshedule')->where('id', $IsPresent->id)->first();
                        if ($IsPresent->coupon != null) {
                            $rowget = DB::table('promocode')->where('name', $IsPresent->coupon)->count();
                            if ($rowget > 0) {
                                $row = DB::table('promocode')->where('name', $IsPresent->coupon)->first();
                                $coupon    =  array(
                                'id'            => @$row->id,
                                'couponname'    => @$row->name,
                                'discount'      => @$row->discount,
                                'description'   => @$row->application,
                                'currency'      => '₱'
                                );
                            }
                    }
                    $getusers     =  DB::table('users')->where('id', $request->user_id)->first();
                    if ($getpickup->vehicle_id != "") {
                        $getvehicle     =  DB::table('vehicle')->where('id', $getpickup->vehicle_id)->where('service', 1)->first();
                        $getdriver      =  DB::table('driveuser')->where('id', $getpickup->driver_id)->first();/*$getpickup->driver_id*/
                        $searchdriver   =  DB::table('search_driver')->orderBy('id', 'desc')->first();

                        $origin         = $getpickup->pickuplat . "," . $getpickup->pickuplon;
                        $destination    = $getpickup->destinationlat . "," . $getpickup->destinationlon;
                        $api            = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=".$origin."&destinations=".$destination."&key=".env("GOOGLE_KEY")."");
                        $dataapis       = json_decode($api);
                        
                        $times = @$dataapis->rows[0]->elements[0]->duration->value;
                       
                       
                        /*distance by google api start */ 
                        $tasks_controller = new PushNotificationCommonController;
                        $distance = $tasks_controller->multipleStopDistance($IsPresent->id);
                       
                        /*distance by google api end */ 
                        $totalprice =round((int)$distance * (int)$getvehicle->kmfare, 1);
                        //$totalprice = $distance * $getvehicle->kmfare + $getvehicle->basefare;

                        if ($IsPresent->type != 'later') {
                            $drivername = @$getdriver->firstname . " " . @$getdriver->lastname;
                            $driverphoto = URL::to('/') . "/public/Media/" . @$getdriver->profilephoto_url;
                            //'drivermobile'      => $getdriver->mobile,
                            $vehicle    = @$getvehicle->vehicle_type;
                        } else {
                            $drivername = 'No Driver found';
                            $vehicle    = 'No Photo Found';
                        }
                        if ($getpickup->tip != '') {
                            $tip = $getpickup->tip;
                        } else {
                            $tip = '0';
                        }
                        $totalPrices = round($getpickup->finalprice, 1);
                        $stopcount = DB::table('pickup_stoplocation')->where('pickup_id', $IsPresent->id)->count();
                        /* multiple stop data start*/ 

                        $getpickup  = DB::table('durapickupshedule')->where('id', $IsPresent->id)->orderby('id', 'desc')->first();
                        $origin = $getpickup->pickuplat . "," . $getpickup->pickuplon;
                        $destination = $getpickup->destinationlat . "," . $getpickup->destinationlon;
                        $stopcount = DB::table('pickup_stoplocation')->where('pickup_id', $getpickup->id)->count();
                       
                        if ($stopcount > 0) {
                            $stopget = DB::table('pickup_stoplocation')->where('pickup_id', $getpickup->id)->get();
                            $stoplocation = array();
                            $stoplocations = '';
                            foreach ($stopget as $getstop) {
                                $stoplocation[]     = array(
                                    'stop_address1' => $getstop->stop_address1,
                                    'stop_address2' => $getstop->stop_address2,
                                    'stop_name'     => $getstop->stop_name,
                                    'stop_mobile'   => $getstop->stop_mobile,
                                    'stoplat'       => $getstop->stoplat,
                                    'stoplon'       => $getstop->stoplon
                                );
                                $location = "/" . $getstop->stoplat . "," . $getstop->stoplon;
                                $stoplocations .= $location;
                            }
                            $driverlocationlink = 'https://www.google.com/maps/dir/' . $origin . $stoplocations . '/' . $destination;
                            
                        } else {
                            $driverlocationlink = 'https://www.google.com/maps/dir/' . $origin . '/' . $destination;
                           
                        }
                        
                        $kmprice =round((int)$distance * (int)$getvehicle->kmfare, 1);
                        $completePrice =  array(
                            'distance'      => $distance,
                            'kmprice'       => $kmprice,
                            'basefare'      => $getvehicle->basefare,
                            'total'         => $totalPrices,
                            'tip'           => $tip,
                            'per_km'        => $getvehicle->kmfare,
                            'services'      => @$services,
                            'currency'      => '₱',
                            'surcharge'     => 10
                        );
                        $tasks_controller = new PushNotificationCommonController;
                        $completePrice = $tasks_controller->orderPriceBreakdown($getpickup->id);
                        $totalEarning = $totalEarning + $getpickup->finalprice;
                        $finalData[]  = array(
                            'servicetype'           => 'Dura Express',
                            'pickup_id'             => $getpickup->id,
                            'verification_code'     => $getpickup->verification_code,
                            'order_no'              => $getpickup->order_no,
                            'pickup'                => $getpickup->pickup_address1 . $getpickup->pickup_address2,
                            'stoplocation'          => $getpickup->stop_address1 . $getpickup->stop_address2,
                            'dropoff'               => $getpickup->destination_address1 . $getpickup->destination_address2,
                            'wheretoname'           => $getpickup->destination_name,
                            'wheretomobile'         => $getpickup->destination_mobile,
                            'distance'              => $distance,
                            'time'                  => @$times,
                            'pickup_name'           => $getpickup->pickup_name,
                            'pickuplat'             => $getpickup->pickuplat,
                            'pickuplon'             => $getpickup->pickuplon,
                            'destinationlat'        => $getpickup->destinationlat,
                            'destinationlon'        => $getpickup->destinationlon,
                            'pickup_mobile'         => $getpickup->pickup_mobile,
                            'destination_mobile'    => $getpickup->destination_mobile,
                            'price'                 => $completePrice,
                            'drivername'            => @$drivername,
                            'driverphoto'           => @$driverphoto,
                            'drivermobile'          => @$getdriver->mobile,
                            'driverdescription'     => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s',
                            'vehicle'               => $getvehicle->vehicle_type,
                            'username'              => @$getusers->first_name . " " . @$getusers->last_name,
                            'usermobile'            => @$getusers->phone,
                            'vehicleno'             => 'UP16Y1719',
                            'verification_code'     => $getpickup->verification_code,
                            'status'                => @$getpickup->status,
                            'orderdate'             => date('F jS Y \a\t h:i:s A', strtotime($getpickup->pdate)),
                            'driverlocationlink'    => $driverlocationlink,
                            'coupon'                => @$coupon,
                            'stopdata'              => @$stoplocation,
                            'pick_up_status'        => $IsPresent->pick_up_status,
                            'driver_action'         => $IsPresent->driver_action,
                        );
                    }
                }
                }
                
                $rateingData  = DB::table('driveuserrating')->where('driverid', $request->driver_id)->orderby('id', 'desc')->get('rating');
                if(count($rateingData)>0){
                    $dRata=0;
                    foreach($rateingData as $rate){
                        $dRata=$dRata+$rate->rating;
                    }
                    
                    $rateing=$dRata/count($rateingData);
                }else{
                    $rateing='3.5';
                }
                
                //dd($rateingData);
                $combineData = array(
                    'pickUpDetails'  => $finalData,
                    'todayTripCount' => count($finalData),
                    'rating'         => $rateing,
                    'currency'       => "₱",
                    'Earning'        => $totalEarning
                );
                $data = collect(["status" => 200, "message" => "data found sucessfully", "data" => $combineData]);
                return response()->json($data, 200);
            }else{
                $data = collect(["status" => 200, "message" => "data found not found ", "data" => $combineData = array(
                    'pickUpDetails'  => [],
                    'todayTripCount' => 0,
                    'rating'         => '0',
                    'currency'       => "₱",
                    'Earning'        => '0'
                )]);
                return response()->json($data, 200);
            }
                
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverOrderList(Request $request){
         $rules = [
            'driver_id' => 'required',
            'filter_type' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'status' => 422, 
                'message' => $validator->messages()
                ], 
                200
                );
        } else {
            try {
                //dd($request->all());
                /*
                1. All
                2. Today
                3. Yesterday
                4. LastOneMonth
                */
                
               $offset = ($request->page_id - 1) * $request->totalcount;
                    
                if($request->filter_type ==='Today'){
                    $date = date("Y-m-d");
                    // $pick_up_details = DB::table('driver_pick_up_details as pd') 
                    //             ->join('durapickupshedule as ds', 'pd.pickup_id', '=', 'ds.id')
                    // 			->where('pd.driver_id','=',$request->driver_id)
                    // 			->whereDate('ds.pdate', $data)
                    // 			->orderBy('pd.id', 'DESC')
                    // 			->select('ds.*', 'pd.pick_up_status','pd.id as p_id')
                    // 			->get();
                    //$pick_up_details = DB::select("SELECT ds.*,pd.pick_up_status,pd.id as p_id FROM driver_pick_up_details pd JOIN durapickupshedule ds ON pd.driver_id=".$request->driver_id. " AND pd.pickup_id=ds.id AND ds.pdate >= $date ORDER BY pd.id DESC limit ".$offset. ",". $request->totalcount);
                    $pick_up_details = DB::select("SELECT ds.*,pd.pick_up_status,pd.id as p_id FROM driver_pick_up_details pd JOIN durapickupshedule ds ON pd.driver_id=".$request->driver_id. " AND pd.pickup_id=ds.id where ds.pdate = $date ORDER BY pd.id DESC limit ".$offset. ",". $request->totalcount);
                    //dd($pick_up_details);
                    
                }elseif($request->filter_type ==='Yesterday'){
                    $date = date('Y-m-d',strtotime("-1 days"));
                    // $pick_up_details = DB::table('driver_pick_up_details as pd') 
                    //             ->join('durapickupshedule as ds', 'pd.pickup_id', '=', 'ds.id')
                    // 			->where('pd.driver_id','=',$request->driver_id)
                    // 			->whereDate('ds.pdate',$date)
                    // 			->orderBy('pd.id', 'DESC')
                    // 			->select('ds.*', 'pd.pick_up_status','pd.id as p_id')
                    // 			->get();
                    $pick_up_details = DB::select("SELECT ds.*,pd.pick_up_status,pd.id as p_id FROM driver_pick_up_details pd JOIN durapickupshedule ds ON pd.driver_id=".$request->driver_id. " AND pd.pickup_id=ds.id AND ds.pdate >= $date ORDER BY pd.id DESC limit ".$offset. ",". $request->totalcount);
              
                }elseif($request->filter_type ==='LastOneMonth'){
                    $fdata = date("Y-m-d");
                    $tdata = date('Y-m-d',strtotime("-30 days"));
                    // $pick_up_details = DB::table('driver_pick_up_details as pd') 
                    //             ->join('durapickupshedule as ds', 'pd.pickup_id', '=', 'ds.id')
                    // 			->where('pd.driver_id','=',$request->driver_id)
                    // 			->whereBetween('ds.pdate', [$fdata, $tdata])
                    // 			->orderBy('pd.id', 'DESC')
                    // 			->select('ds.*', 'pd.pick_up_status','pd.id as p_id')
                    // 			->get();
                    //SELECT * FROM driver_pick_up_details pd JOIN durapickupshedule ds ON pd.driver_id=196 AND pd.pickup_id=ds.id where ds.pdate >= "2021-12-12" and ds.pdate <= '2021-12-13'  ORDER BY pd.id DESC limit 0,3
                    $pick_up_details = DB::select("SELECT ds.*,pd.pick_up_status,pd.id as p_id FROM driver_pick_up_details pd JOIN durapickupshedule ds ON pd.driver_id=". $request->driver_id ." AND pd.pickup_id=ds.id WHERE ds.pdate BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW() ORDER BY pd.id DESC limit ".$offset. ",". $request->totalcount);
              
                }else{
                    //   $pick_up_details = DB::table('driver_pick_up_details as pd') 
                    //                 ->join('durapickupshedule as ds', 'pd.pickup_id', '=', 'ds.id')
                    //     			->where('pd.driver_id','=',$request->driver_id)
                    //     			->orderBy('pd.id', 'DESC')
                    //     			->select('ds.*', 'pd.pick_up_status','pd.id as p_id')
                    //     			->get();
                    $pick_up_details = DB::select("SELECT ds.*,pd.pick_up_status,pd.id as p_id FROM driver_pick_up_details pd JOIN durapickupshedule ds ON pd.driver_id=".$request->driver_id. " AND pd.pickup_id=ds.id  ORDER BY pd.id DESC limit ".$offset. ",". $request->totalcount);
                    
                }
                if(count($pick_up_details) > 0){
                    $totalEarning =0;
                    foreach($pick_up_details as $IsPresent) {
                        //$IsPresent = DB::table('durapickupshedule')->where('user_id', $request->user_id)->where('vehicle_id', '!=', null)->orderby('id', 'desc')->first();
                        if ($IsPresent) {
                            $services = DB::table('durapickup_services as ds')
                            ->join('pricecard as pc', 'ds.service_id', '=', 'pc.id')
                            ->where('ds.pickup_id', $IsPresent->id)
                            ->select('pc.id', 'pc.services', 'pc.servicefee')
                            ->get();
                            $getpickup  = DB::table('durapickupshedule')->where('id', $IsPresent->id)->first();
                            if ($IsPresent->coupon != null) {
                                $rowget = DB::table('promocode')->where('name', $IsPresent->coupon)->count();
                                if ($rowget > 0) {
                                    $row = DB::table('promocode')->where('name', $IsPresent->coupon)->first();
                                    $coupon    =  array(
                                        'id'            => @$row->id,
                                        'couponname'    => @$row->name,
                                        'discount'      => @$row->discount,
                                'description'   => @$row->application,
                                'currency'      => '₱'
                                );
                            }
                    }
                    $getusers     =  DB::table('users')->where('id', $request->user_id)->first();
                    if ($getpickup->vehicle_id != "") {
                        $getvehicle     =  DB::table('vehicle')->where('id', $getpickup->vehicle_id)->where('service', 1)->first();
                        $getdriver      =  DB::table('driveuser')->where('id', $getpickup->driver_id)->first();
                        $origin         = $getpickup->pickuplat . "," . $getpickup->pickuplon;
                        $destination    = $getpickup->destinationlat . "," . $getpickup->destinationlon;
                        $api            = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=".$origin."&destinations=".$destination."&key=".env("GOOGLE_KEY")."");
                        $dataapis       = json_decode($api);
                        $times          = @$dataapis->rows[0]->elements[0]->duration->value;
                        /*distance by google api start */ 
                        $tasks_controller = new PushNotificationCommonController;
                        $distance = $tasks_controller->multipleStopDistance($IsPresent->id);
                        /*distance by google api end */ 
                        $totalprice = round((int)$distance * (int)$getvehicle->kmfare, 1);
                        //$totalprice = $distance * $getvehicle->kmfare + $getvehicle->basefare;
                        if ($IsPresent->type != 'later') {
                            $drivername = @$getdriver->firstname . " " . @$getdriver->lastname;
                            $driverphoto = URL::to('/') . "/public/Media/" . @$getdriver->profilephoto_url;
                            //'drivermobile'      => $getdriver->mobile,
                            $vehicle    = @$getvehicle->vehicle_type;
                        } else {
                            $drivername = 'No Driver found';
                            $vehicle    = 'No Photo Found';
                        }
                        if ($getpickup->tip != '') {
                            $tip = $getpickup->tip;
                        } else {
                            $tip = '0';
                        }
                        $totalPrices = round($getpickup->finalprice, 1);
                        $stopcount = DB::table('pickup_stoplocation')->where('pickup_id', $IsPresent->id)->count();
                        /* multiple stop data start*/ 
                        $getpickup  = DB::table('durapickupshedule')->where('id', $IsPresent->id)->orderby('id', 'desc')->first();
                        $origin = $getpickup->pickuplat . "," . $getpickup->pickuplon;
                        $destination = $getpickup->destinationlat . "," . $getpickup->destinationlon;
                        $stopcount = DB::table('pickup_stoplocation')->where('pickup_id', $getpickup->id)->count();
                        if ($stopcount > 0) {
                            $stopget = DB::table('pickup_stoplocation')->where('pickup_id', $getpickup->id)->get();
                            $stoplocation = array();
                            $stoplocations = '';
                            foreach ($stopget as $getstop) {
                                $stoplocation[]     = array(
                                    'stop_address1' => $getstop->stop_address1,
                                    'stop_address2' => $getstop->stop_address2,
                                    'stop_name'     => $getstop->stop_name,
                                    'stop_mobile'   => $getstop->stop_mobile,
                                    'stoplat'       => $getstop->stoplat,
                                    'stoplon'       => $getstop->stoplon
                                );
                                $location = "/" . $getstop->stoplat . "," . $getstop->stoplon;
                                $stoplocations .= $location;
                            }
                            $driverlocationlink = 'https://www.google.com/maps/dir/' . $origin . $stoplocations . '/' . $destination;
                            
                        } else {
                            $driverlocationlink = 'https://www.google.com/maps/dir/' . $origin . '/' . $destination;
                           
                        }
                        $kmprice =round((int)$distance * (int)$getvehicle->kmfare, 1);
                        $completePrice =  array(
                            'distance'      => $distance,
                            'kmprice'       => $kmprice,
                            'basefare'      => $getvehicle->basefare,
                            'total'         => $totalPrices,
                            'tip'           => $tip,
                            'per_km'        => $getvehicle->kmfare,
                            'services'      => @$services,
                            'currency'      => '₱',
                            'surcharge'     => 10
                        );
                        $tasks_controller = new PushNotificationCommonController;
                        $completePrice = $tasks_controller->orderPriceBreakdown($getpickup->id);
                         $totalEarning = $totalEarning + $getpickup->finalprice;
                        $finalData[]  = array(
                            'servicetype'           => 'Dura Express',
                            'pickup_id'             => $getpickup->id,
                            'verification_code'     => $getpickup->verification_code,
                            'order_no'              => $getpickup->order_no,
                            'pickup'                => $getpickup->pickup_address1 . $getpickup->pickup_address2,
                            'stoplocation'          => $getpickup->stop_address1 . $getpickup->stop_address2,
                            'dropoff'               => $getpickup->destination_address1 . $getpickup->destination_address2,
                            'wheretoname'           => $getpickup->destination_name,
                            'wheretomobile'         => $getpickup->destination_mobile,
                            'distance'              => $distance,
                            'time'                  => @$times,
                            'pickup_name'           => $getpickup->pickup_name,
                            'pickuplat'             => $getpickup->pickuplat,
                            'pickuplon'             => $getpickup->pickuplon,
                            'destinationlat'        => $getpickup->destinationlat,
                            'destinationlon'        => $getpickup->destinationlon,
                            'pickup_mobile'         => $getpickup->pickup_mobile,
                            'destination_mobile'    => $getpickup->destination_mobile,
                            'price'                 => $completePrice,
                            'drivername'            => @$drivername,
                            'driverphoto'           => @$driverphoto,
                            'drivermobile'          => @$getdriver->mobile,
                            'driverdescription'     => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s',
                            'vehicle'               => $getvehicle->vehicle_type,
                            'username'              => @$getusers->first_name . " " . @$getusers->last_name,
                            'usermobile'            => @$getusers->phone,
                            'vehicleno'             => 'UP16Y1719',
                            'verification_code'     => $getpickup->verification_code,
                            'status'                => @$getpickup->status,
                            'orderdate'             => date('F jS Y \a\t h:i:s A', strtotime($getpickup->pdate)),
                            'driverlocationlink'    => $driverlocationlink,
                            'coupon'                => @$coupon,
                            'stopdata'              => @$stoplocation,
                            'pick_up_status'        => $IsPresent->pick_up_status,
                            'driver_action'         => $IsPresent->driver_action,
                        );
                    }
                }
                }
                // echo "<pre>";
                // print_r($pick_up_details);
                // die;
                $combineData = array(
                    'pickUpDetails'  => $finalData,
                    'todayTripCount' => count($finalData),
                    'rating'         => '4.5',
                    'currency'       => "₱",
                    'Earning'        => $totalEarning
                );
                $data = collect(["status" => 200, "message" => "data found sucessfully", "data" => $combineData]);
                return response()->json($data, 200);
                }else{
                    $data = collect(["status" => 200, "message" => "data not found","data" =>array(
                    'pickUpDetails'  => [],
                    'todayTripCount' => '0',
                    'rating'         => '0',
                    'currency'       => "₱",
                    'Earning'        => '0'
                )]);
                    return response()->json($data, 200);
                }
                
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverPushNotification(Request $request)
    {
        $rules = [
            'pickup_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $orderData = DB::table('durapickupshedule')->where('id', $request->pickup_id)->first();
                $tasks_controller = new PushNotificationCommonController;
                $orderDatas = $tasks_controller->getPickupDetails($request->pickup_id);
                $getdriver      =  DB::table('driveuser')->where('id', $orderData->driver_id)->first();
                $registatoin_ids = $getdriver->device_id;
                // echo "<pre>";
                // print_r($orderDatas);
                // die;
                // $orderDatas = array('data'=>$orderDatas);
                $message = array(
                    "pushmessage" => array('data'=>$orderDatas),
                    "notification_type"=>"order"
                );
                $notification =array(
                         'title'=> "New booking created",
                         'sound'=> "default",
                         'body' => "Accept Order",
                     );
                $result = $this->send_notification($registatoin_ids, $message,$notification);
                $dd=json_decode($result);
                print_r($result );
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverSupport(Request $request){
        $rules = [
            'driver_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData      =  DB::table('driveuser')->where('id', $request->driver_id)->first();
                if($driverData){
                    $support = DB::table('driver_support')->insert([
                        'driver_id'=>$request->has('driver_id') ? $request->driver_id : "",
                        'issue_title'=>$request->has('issue_title') ? $request->issue_title : "",
                        'description'=>$request->has('description') ? $request->description : "",
                    ]);
                    $data = collect(["status" => 200, "message" => "Query submited sucessfully"]);
                    return response()->json($data, 200);
                }else{
                    return response()->json(['status' => 422, 'message' => 'Driver not found'], 409);
                }
                }catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverNewPassword(Request $request){
        $rules = [
            'country_code' => 'required',
            'mobile'=> 'required',
            'new_password' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData      =  DB::table('driveuser')
                ->where('country_code', $request->country_code)
                ->where('mobile', $request->mobile)
                ->first();
                if($driverData){
                    $driverData      =  DB::table('driveuser')
                    ->where('country_code', $request->country_code)
                    ->where('mobile', $request->mobile)->update([
                        'password'=>Hash::make($request->input('new_password'))
                        ]);
                    $data = collect(["status" => 200, "message" => "Password updated sucessfully"]);
                    return response()->json($data, 200);
                    
                }else{
                     return response()->json(['status' => 422, 'message' => 'Driver not found'], 409);
                }
                
            }catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverDeleteBankDetails(Request $request){
      $rules = [
            'driver_id' => 'required',
            'bank_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData      =  DB::table('driveuser')->where('id', $request->driver_id)->first();
                if($driverData){
                    $bank_accounts      =  DB::table('driver_bank_accounts')->where('id', $request->bank_id)->first();
                    if($bank_accounts){
                       $driverData      =  DB::table('driver_bank_accounts')->where('id', $request->bank_id)->delete();
                    $data = collect(["status" => 200, "message" => "Account deleted sucessfully"]);
                    return response()->json($data, 200); 
                    }else{
                        return response()->json(['status' => 422, 'message' => 'account not found'], 409);
                    }
                }else{
                     return response()->json(['status' => 422, 'message' => 'Driver not found'], 409);
                }
                
            }catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }  
    }
    public function driverRating(Request $request){
        $rules = [
            'driver_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData      =  DB::table('driveuser')->where('id', $request->driver_id)->first();
                if($driverData){
                    $driverRating      =  DB::table('driveuserrating as dr')
                    ->join('users as u', 'dr.userid', '=', 'u.id')
                    ->where('dr.driverid', $request->driver_id)
                    ->get();
                    $ratingD=array();
                    foreach($driverRating as $rating){
                        $rating->profile_image =URL::to('/') . "/public/Media/" . $driverData->profilephoto_url;
                        $ratingD[]=$rating;
                    }
                     $combineData = array(
                        'ratingData'         => $ratingD,
                        //'driverDoc'          => $driverDoc,
                        //'driverWallet'       => $driverWallet
                    );
                    $data = collect(["status" => 200, "message" => "Data found sucessfully", "data" => $ratingD]);
                    return response()->json($data, 200);
                }else{
                    return response()->json(['status' => 422, 'message' => 'Driver not found'], 409);
                }
                }catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverReferral(Request $request){
      $rules = [
            'referral_code' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData      =  DB::table('driveuser')->where('referralcode', $request->referral_code)->first();
                
                if($driverData){
                    $driverData      =  DB::table('driver_referralcode')
                    ->where('refereal_code', $request->referral_code)
                    ->first();
                    $data = collect([
                        "status" => 200, 
                        "message" => "Data found sucessfully", 
                        "data" => $driverData
                        ]);
                    return response()->json($data, 200);
                }else{
                    return response()->json(['status' => 422, 'message' => 'Refereal code not found'], 200);
                }
                
            }catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverReachedPickupLocation(Request $request){
           
        $rules = [
            'pickup_id' => 'required',
            'driver_id' => 'required',
            'driver_action' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'status' => 422, 
                'message' => $validator->messages()
                ], 200);
        } else {
            try {
                $totalcommition ='0';
                $verificationData = DB::table('durapickupshedule')
                ->where('id','=', $request->pickup_id)
                ->where('driver_id','=', $request->driver_id)
                ->update([
                   'driver_action'=> $request->driver_action,
                   'drivernote'=>$request->drivernote
                   ]);
                if($request->driver_action ==6) {
                    //dd($request->all());
                    $verificationData = DB::table('durapickupshedule')
                     ->where('id','=', $request->pickup_id)
                     ->where('driver_id','=', $request->driver_id)
                     ->update([
                         'status'=> '3',
                    ]);
                    
                    
                    $driverData = DB::table('driveuser')->where('id', $request->driver_id)->first();
                    if($driverData->service_area_id){
                        $serviceAreaData = DB::table('units_measurement')->where('service_area', $driverData->service_area_id)->get();
                        
                        if(count($serviceAreaData) > 0){
                            $totalcommition =$serviceAreaData[0]->baseco + $serviceAreaData[0]->stopco + $serviceAreaData[0]->serviceco;
                        }else{
                            $totalcommition = 0;
                        }
                        $walletRecharge = DB::table('driver_wallet_recharge')
                        ->where('driver_id', $request->driver_id)
                        ->where('transactiontype','!=','cash')
                        ->orderBy('id', 'desc')
                        ->first();
                        if($totalcommition != 0){
                            $getamount = DB::table('driver_wallet_recharge')
                            ->where('transactiontype','!=','cash')
                            ->where('driver_id', $request->driver_id)
                            ->orderBy('id','desc')
                            ->first();
                            if(!empty($getamount))
                            {
                                $price = $getamount->amount - $totalcommition;
                                $change_amount = $totalcommition; 
                            }
                            $finalData =  array(
                                'transactionid'     => 'admin_'.$this->generateRandomString(),
                                'transactiontype'   => 'g-cash',
                                'driver_id'         => $request->driver_id,
                                'amount'            => $price,
                                'description'       => 'Commission deduction',
                                'phone'             => '0',
                                'method'            => 'debit',
                                'change_amount'     => $change_amount,
                                'created_at'        => date('Y-m-d H:i:s')
                                );
                                $item   = DB::table('driver_wallet_recharge')
                                ->insertGetId($finalData);
                        }else{
                            $totalcommition ='0';
                        }
                    }
                }
                if($request->driver_action == 3) {
                    //dd("hello");
                     $verificationData = DB::table('durapickupshedule')
                     ->where('id','=', $request->pickup_id)
                     ->where('driver_id','=', $request->driver_id)
                     ->update([
                         'status'=> '4',
                    ]);
                    
                    $verificationData = DB::table('driver_pick_up_details')
                     ->where('pickup_id','=', $request->pickup_id)
                     ->where('driver_id','=', $request->driver_id)
                     ->update([
                         'pick_up_status'=> '2',
                    ]);
                }
                $data = collect([
                    "status" => 200, 
                    "message" => "Data found sucessfully",
                    'data'=>$totalcommition
                    ]);
                return response()->json($data, 200);
            }catch (\Exception $e) {
                // dd($e->getMessage());
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
   
    public function driverbankList(Request $request){
       $rules = [
            'driver_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
              $driverBank = DB::table('driver_bank_accounts')->where('driver_id', $request->driver_id)->get();
                $data = collect(["status" => 200, "message" => "Data found sucessfully",'data'=>$driverBank]);
                return response()->json($data, 200);  
            }catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverVerifyCode(Request $request){
        $rules = [
            'driver_id' => 'required',
            'verification_code' => 'required',
            'pickup_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $sqlQuery = "select * from durapickupshedule where id = ".$request->pickup_id." and driver_id = ".$request->driver_id." and verification_code = '".$request->verification_code."' limit 1";
                $verificationData = DB::select(DB::raw($sqlQuery));
                //   $code= $request->verification_code;
                //     $verificationData = DB::table('durapickupshedule1')
                //     ->where('id','=', $request->pickup_id)
                //     ->where('driver_id','=', $request->driver_id)
                //     ->where('verification_code',$code)
                //   ->first();
    
            if($verificationData){
                $data = collect(["status" => 200, "message" => "Data found sucessfully",'data'=> $request->verification_code]);
                return response()->json($data, 200);
            }else{
              $data = collect(["status" => 422, "message" => "Data not found"]);
                return response()->json($data, 200);  
            }
            }catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function driverUpdateStopAddress(Request $request){
       $rules = [
            'driver_id' => 'required',
            'notification_message' => 'required',
            'pickup_id' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
               $orderData = DB::table('durapickupshedule')->where('id','=', $request->pickup_id)->first();
               $getUsers      =  DB::table('users')->where('id', $orderData->user_id)->first();
               if($orderData){
                   $message = array(
                    "pushmessage" => array('data'=>$orderData),
                    "notification_type"=>"accepted"
                );
                $notification =array(
                         'title'=> "Driver accept Your Order",
                         'sound'=> "default",
                         'body' => "Accepted Order",
                     );
                $tasks_controller = new PushNotificationCommonController;
                $result = $tasks_controller->user_send_notification($getUsers->device_id, $message,$notification);
                $data = collect(["status" => 200, "message" => "Stop address updated sucessfully"]);
                return response()->json($data, 200);
               }else{
                   return response()->json([
                       'status' => 422, 
                       'message' => "Error in updating the stop address"
                   ], 409);
               }
                
                
            }catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function send_notification($registatoin_ids, $message,$notification)
    {
        $apiKey = env('Server_key');
        //$url = 'https://android.googleapis.com/gcm/send';
        $url = 'https://fcm.googleapis.com/fcm/send';
        $fields = array(
            'registration_ids' => array($registatoin_ids),
            'data' => $message,
            'notification'=>$notification
        );
        $headers = array(
            // 'Authorization: key=' . "",
		      'Authorization: key=' . $apiKey,'Content-Type: application/json'
		      );
		      //echo "<pre>";
		      //print_r(json_encode($fields));
		      //die;
		      // Open connection
		      $ch = curl_init();
		      // Set the url, number of POST vars, POST data
		      curl_setopt($ch, CURLOPT_URL, $url);
		      curl_setopt($ch, CURLOPT_POST, true);
		      curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		      // Disabling SSL Certificate support temporarly
		      curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		      curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
		      // Execute post
		      $result = curl_exec($ch);
		      
		      if ($result === FALSE){
		          die('Curl failed: ' . curl_error($ch));
		      }
		      // Close connection
		      curl_close($ch);
		      // return  $result;
		      echo $result;
	}
	public function driverAddWallet(Request $request){
	    $rules = [
            'driver_id' => 'required|int',
        ];
       
        $validator = Validator::make($request ->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'Status' => 'Failed',
                'message'=>$validator->messages() 
                ], 200);
        } 
        else 
        {
            try 
            {
                $getamount = DB::table('driver_wallet_recharge')
                ->where('transactiontype','!=','cash')
                ->where('driver_id', $request->driver_id)
                ->orderBy('id','desc')
                ->first();
                
                if(!empty($getamount))
                {
                    if($request->transactiontype !='cash'){
                        $price = $getamount->amount + $request->amount;
                        $change_amount = $request->amount;
                    }else{
                       $price = $request->amount; 
                       $change_amount = $request->amount;
                    }
                }else{
                    $price = $request->amount;
                    $change_amount = $request->amount;
                }
                
                /* cash out start*/
                 if($request->transactiontype === 'requested-gcash' || $request->transactiontype ==='converted-ewallet'){
                     $walletRechargeCash = DB::table('driver_wallet_recharge')
                     ->where('driver_id', $request->driver_id)
                     ->where('transactiontype','=','cash')
                     ->where('cash_status','!=','1')
                     ->orderBy('id', 'desc')
                     ->get();
                     foreach($walletRechargeCash as $cash){
                         $item   = DB::table('driver_wallet_recharge')->where('id',$cash->id)->update([
                             'cash_status'=>'1',
                             'updated_at'=>date("Y-m-d H:i:s")
                            ]);
                     }
                     
                     $tasks_controller = new PushNotificationCommonController;
                     $message= "You have cashout for amount ". $change_amount ." successfully with Duradrive at " . date("F j, Y, g:i A");
                     $ext = 'Cash Out Request';
                     $tasks_controller->driverNotification($request->driver_id, $message, $ext);
                     
                 }else{
                     $tasks_controller = new PushNotificationCommonController;
                    $message= "You have recharge wallet with amount ". $change_amount ." successfully with Duradrive at " . date("F j, Y, g:i A");
                    $ext = 'Wallet Recharge';
                    $tasks_controller->driverNotification($request->driver_id, $message, $ext);
                 }
                /*cashout end*/
                $finalData =  array(
                    'transactionid'     => $request->transactionid,
                    'transactiontype'   => $request->transactiontype,
                    'driver_id'         => $request->driver_id,
                    'amount'            => $price,
                    'description'       => $request->description,
                    'phone'             => '0',
                    'method'            => 'credit',
                    'change_amount'     => $change_amount,
                    'created_at'        => date('Y-m-d H:i:s')
                );
                if($request->amount!="")
                {
                    $item   = DB::table('driver_wallet_recharge')->insertGetId($finalData);  
                    
                }
                $getdata = DB::table('driver_wallet_recharge')
                ->where('driver_id', $request->driver_id)
                ->orderBy('id','desc')
                ->first();
                if(isset($getdata))
                {
                    return response()->json(['status' => 200,'message'=>'Success','amount'=>$getdata], 200);
                }
                else{
                  
                    return response()->json(['status' => 200,'message'=>'Success','amount'=>$getdata], 200);
                }
              
            } catch (\Exception $e) {
                dd($e);
               // return response()->json(['message' => $e], 500);
            }
        }
	}
	public function driverWalletHistory(Request $request)
    {
        $rules = [
            'driver_id' => 'required|int'
        ];
       
        $validator = Validator::make($request ->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'message'=>$validator->messages() 
            ], 200);
        } 
        else 
        {
            $walletRechargeData = DB::table('driver_wallet_recharge')
            ->where('driver_id', $request->driver_id)
            ->where('transactiontype','!=','')
            ->orderBy('id', 'desc')
            ->get();
            if(count($walletRechargeData) >0){
                
                
                $cashAmount=0;
                $rechargeHistory=[];
                foreach($walletRechargeData as $history){
                    $rechargeHistory[]=array(
                        'id'=>$history->id,
                        'transactionid'=>$history->transactionid,
                        'transactiontype'=>$history->transactiontype,
                        'driver_id'=>$history->driver_id,
                        'phone'=>$history->phone,
                        'method'=>$history->method,
                        'amount'=>$history->amount,
                        'change_amount'=>$history->change_amount,
                        'description'=>$history->description,
                        'created_at'=> date('F jS Y \a\t h:i:s A', strtotime($history->created_at)),
                        'updated_at'=>$history->created_at,
                        );
            }
            $walletRecharge = DB::table('driver_wallet_recharge')
            ->where('driver_id', $request->driver_id)
            ->where('transactiontype','!=','cash')
            ->orderBy('id', 'desc')
            ->first();
            
            if(isset($walletRecharge->amount)){
                $amount = $walletRecharge->amount;
            }else{
                 $amount = 0;
            }
            
            $walletRechargeCash = DB::table('driver_wallet_recharge')
            ->where('driver_id', $request->driver_id)
            ->where('transactiontype','=','cash')
            ->where('cash_status','!=','1')
            ->orderBy('id', 'desc')
            ->get();
            $cashData= 0;
            foreach($walletRechargeCash as $cash){
                $cashData =   $cashData + $cash->amount;
            }
            $finalData=array(
                'e-wallet'=>$amount,
                'cashAmount'=>$cashData,
                'history'=>$rechargeHistory,
                );
            return response()->json(['status' => 200,'message'=>'Success','data'=>$finalData], 200);    
            }else{
              return response()
              ->json([
                  'status' => 201,
                  'message'=>'Not found',
                  'data'=>array(
                      'e-wallet'=>'0',
                      'cashAmount'=>0,
                      'history'=>[],
                      )
                      ], 
                      201);
            }
           
        }
    }
    
    public function driverWalletCurrentAmount(Request $request)
    {
        $rules = [
            'driver_id' => 'required|int'
        ];
       
        $validator = Validator::make($request ->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'message'=>$validator->messages() 
            ], 200);
        } 
        else 
        {
            $walletRechargeData = DB::table('driver_wallet_recharge')
            ->where('driver_id', $request->driver_id)
            ->where('transactiontype','!=','')
            ->orderBy('id', 'desc')
            ->get();
            //dd($walletRechargeData);
            if(count($walletRechargeData) >0){
                $walletRecharge = DB::table('driver_wallet_recharge')
                ->where('driver_id', $request->driver_id)
                ->where('transactiontype','!=','cash')
                ->orderBy('id', 'desc')
                ->first();
            
            if(isset($walletRecharge->amount)){
                $amount = $walletRecharge->amount;
            }else{
                 $amount = 0;
            }
            
            $walletRechargeCash = DB::table('driver_wallet_recharge')
            ->where('driver_id', $request->driver_id)
            ->where('transactiontype','=','cash')
            ->where('cash_status','!=','1')
            ->orderBy('id', 'desc')
            ->get();
            $cashData= 0;
            foreach($walletRechargeCash as $cash){
                $cashData =   $cashData + $cash->amount;
            }
            $finalData=array(
                'e-wallet'=>$amount,
                'cashAmount'=>$cashData,
                //'history'=>$rechargeHistory,
                );
            return response()->json(['status' => 200,'message'=>'Success','data'=>$finalData], 200);    
            }else{
              return response()->json(['status' => 201,'message'=>'Not found','data'=>array(
                'e-wallet'=>'0',
                'cashAmount'=>0,
                //'history'=>[],
                )], 201);
            }
           
        }
    }
    public function driverNotification(Request $request){
      $rules = [
            'driver_id' => 'required|int',
        ];
       
        $validator = Validator::make($request ->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
        } 
        else 
        {
            try 
            { 
                $driverData = DB::table('driveuser')
                ->where('id', $request->driver_id)
                ->first();
                if($driverData){
                   $notificationData = DB::table('driverusernotification')
                    ->where('driver_id', $request->driver_id)
                    ->orderBy('id', 'desc')
                    ->get();
                    foreach($notificationData as $notification){
                        $notData[] =array(
                            'id'=>$notification->id,
                            'driver_id'=>$notification->driver_id,
                            'type'=>$notification->type,
                            'description'=>$notification->description,
                            'login_type'=>$notification->login_type, 
                            'is_read'=>$notification->is_read, 
                            'reason'=>$notification->reason, 
                            'created_at'=>date('F jS Y \a\t h:i A', strtotime($notification->created_at)),
                            'updated_at'=>$notification->updated_at,
                            );
                        
                    }
                    if($notData){
                        return response()->json(['status' => 200,'message'=>'Success','data'=>$notData], 200);
                    }else{
                        return response()->json(['status' => 200,'message'=>'Success','data'=>[]], 200);
                    }
                    
                }else{
                     return response()->json(['status' => 201,'message'=>'driver Not found'], 201);  
                }
                
            } catch (\Exception $e) {
                //dd($e);
                return response()->json(['message' => $e], 500);
            }
        }
	}
    public function driverWalletAmount(Request $request){
       $rules = [
            'driver_id' => 'required|int',
        ];
        $validator = Validator::make($request ->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
        } 
        else 
        {
            try 
            {
                $driverData = DB::table('driveuser')
                ->where('id', $request->driver_id)
                ->first();
                if($driverData){
                    $walletRecharge = DB::table('driver_wallet_recharge')
                    ->where('driver_id', $request->driver_id)
                    ->where('transactiontype','=','g-pay')
                    ->orderBy('id', 'desc')
                    ->first();
                    $walletRechargeCash = DB::table('driver_wallet_recharge')
                    ->where('driver_id', $request->driver_id)
                    ->where('transactiontype','=','cash')
                    ->orderBy('id', 'desc')
                    ->get();
                    $cashData= 0;
                    foreach($walletRechargeCash as $cash){
                      $cashData =   $cashData + $cash->amount;
                    }
                    $finalData=array(
                        'e-wallet'=>$walletRecharge->amount,
                        'cashAmount'=>$cashData
                        );
            if($finalData){
                return response()->json(['status' => 200,'message'=>'Success','data'=>$finalData], 200);
            }else{
                return response()->json(['status' => 201,'message'=>'Not found','data'=>[]], 201);
            }
                    
        }else{
                    return response()->json(['status' => 201,'message'=>'driver Not found'], 201);  
                }
                
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['message' => $e], 500);
            }
        }
	}
    public function driverUpdateDevice(Request $request){
       $rules = [
            'driver_id' => 'required|int',
            'device_type'=>'required',
            'device_id'=>'required',
        ];
       
        $validator = Validator::make($request ->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
        } 
        else 
        {
            try 
            {
                $driverData = DB::table('driveuser')
                ->where('id', $request->driver_id)
                ->first();
                if($driverData){
                    $driverData = DB::table('driveuser')
                ->where('id', $request->driver_id)
                ->update([
                    'device_type'=>$request->device_type,
                    'device_id'=>$request->device_id
                    ]);
                    return response()->json([
                        'status' => 200,
                        'message'=>'Success'
                        ], 200);
                }else{
                   return response()->json(['status' => 201,'message'=>'driver Not found'], 201); 
                }
                
            } catch (\Exception $e) {
                dd($e);
                return response()->json(['message' => $e], 500);
            }
        }
	}
	public function driverGiveReview(Request $request){
	    $rules = [
            'driver_id' => 'required|int',
            'pickup_id'=>'required',
            'user_id'=>'required',
            'remarks'=>'required',
            'rating'=>'required',
        ];
        
       
        $validator = Validator::make($request ->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
        } 
        else 
        {
            try 
            {
                $driverData = DB::table('user_rating_review')->insert([
                    'user_id'=>$request->user_id,
                    'pickup_id'=>$request->pickup_id,
                    'driver_id'=>$request->pickup_id,
                    'rating'=>$request->rating,
                    'remarks'=>$request->remarks,
                    ]);
                    return response()->json([
                        'status' => 200,
                        'message'=>'Review add successfully'
                        ], 200);
                
            }catch (\Exception $e){
                dd($e);
                return response()->json(['message' => $e], 500);
            }
        }
	}
	public function driverReadNotification(Request $request)
    {
        $rules = [
            'driver_id' => 'required|int',
        ];
        $validator = Validator::make($request ->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 201);
        }else{
            $driverData = DB::table('driveuser')
            ->where('id', $request->driver_id)
            ->first();
            if($driverData){
                $data = DB::table('driverusernotification')->where('driver_id',$request ->driver_id)->get();
                if($data){
                    if($request->is_read=='all'){
                        $is_update = DB::table('driverusernotification')->where('driver_id', $request->driver_id)->update(['is_read'=>'1']);
                    }else{
                        $is_update = DB::table('driverusernotification')->where('driver_id', $request->driver_id)->where('id',$request->notification_id)->update(['is_read'=>'1']);
                    }
                    return response()->json(['status' => 200,'message'=>'Success'], 200);
                }else{
                    return response()->json(['status' => 201,'message'=>'Not found'], 201);
                }
            }else{
                return response()->json(['status' => 201,'message'=>'driver Not found'], 201);
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
        return $result;
    }
    function generateRandomString($length = 15) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
    
}
