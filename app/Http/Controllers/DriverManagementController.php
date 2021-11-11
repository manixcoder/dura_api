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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
        } else {
            try {
                $driverData = DB::table('driveuser')->where('mobile', $request->input('mobile'))->get();
                if (count($driverData) > 0) {
                    return response()->json(['status' => 409, 'message' => 'This mobile number is already registered', 'data' => []], 409);
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
                        $sid = env('SID');
                        $token = env('TWILIO_TOKEN');
                        $twilio = new Client(env('SID'),  env('TWILIO_TOKEN'));
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
                'status' => 405,
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
                        'country_code'          => $request->input('country_code'),
                        'device_type'          => $request->input('device_type'),
                        'device_id'          => $request->input('device_id'),
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
                    $tasks_controller           = new PushNotificationCommonController;
                    $referalCode                = $tasks_controller->generateDriverReferralCode($driver_id);
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
    public function driverUpdateProfile(Request $request, Driver $driver)
    {
        
        $rules = [
            'firstname' => 'required',
            'middlename' => 'required',
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

                    
                    $datass = array(
                        'firstname'             => $request->input('firstname'),
                        'middlename'            => $request->input('middlename'),
                        'lastname'              => $request->input('lastname'),
                        'dob'                   => $request->input('dob'),
                        'password'              => Hash::make($request->input('password')),
                        'manager_account_no'    => $request->input('manager_account_no'),
                        'g_cash_accont_name'    => $request->input('g_cash_accont_name'),
                        'g_cash_no'             => $request->input('g_cash_no'),
                        'lastupdatedatetime'    => date('Y-m-d H:i:s'),
                        'vehicle_id'            => $request->input('vehicle_id'),
                        'dura_bag_id'           => $request->input('dura_bag_id'),
                        'created_datetime'      => date('Y-m-d H:i:s'),
                        'isactive'              => '1',
                        'isvarified'            => '0',
                        'is_online'             => 1,
                        'refered_by'            => '',
                        'isbusinessaccout'      => '0',
                        'google_link'           => $request->has('google_link') ? $request->google_link : $userData->google_link,
                        'facebook_link'         => $request->has('facebook_link') ? $request->facebook_link : $userData->facebook_link,
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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
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
                        $data = collect(["status" => 200, "message" => "You have already decline"]);
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
            return response()->json(['status' => 422,  'message' => $validator->messages()], 200);
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
           // 'service_id' => 'required',
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
                    'device_type'=>$request->input('device_type'),
                    'device_id'=>$request->input('device_id'),
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
                    if ($driverDoc->police_clearance_image != '') {
                        $driverDoc->police_clearance_image = URL::to('/') . "/public/Media/" . $driverDoc->police_clearance_image;
                    } else {
                        $driverDoc->police_clearance_image =  $driverDoc->police_clearance_image;
                    }
                    $driverWallet = DB::table('driver_wallet')->where('driver_id', $driverData->id)->first();
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
            'account_num' => 'required',
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
                     $driverWallet = DB::table('driver_wallet')->where('driver_id', $request->driver_id)->first();
                    $combineData = array(
                        'driverData'         => $driverData,
                        //'driverDoc'          => $driverDoc,
                        //'driverWallet'       => $driverWallet
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
                // echo "<pre>";
                // print_r($orderData->driver_id);
                // die;
                $getdriver      =  DB::table('driveuser')->where('id', $orderData->driver_id)->first();
                // echo "<pre>";
                // print_r($getdriver->device_id);
                // die;
                $registatoin_ids = $getdriver->device_id;
               
                //$message = $orderData;
                $message = array("message" => $orderData);
                $result = $this->send_notification($registatoin_ids, $message);
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
                $driverData      =  DB::table('driveuser')->where('referral_code', $request->referral_code)->first();
                
                if($driverData){
                    $driverData      =  DB::table('driver_referralcode')->where('refereal_code', $request->referral_code)->first();
                    $data = collect(["status" => 200, "message" => "Data found sucessfully", "data" => $driverData]);
                    return response()->json($data, 200);
                }else{
                    return response()->json(['status' => 422, 'message' => 'Refereal code not found'], 200);
                }
                
            }catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 409);
            }
        }
    }
    public function send_notification($registatoin_ids, $message)
    {
        $apiKey = env('Server_key');
        //$url = 'https://android.googleapis.com/gcm/send';
        $url = 'https://fcm.googleapis.com/fcm/send';
        $fields = array(
            'registration_ids' => array($registatoin_ids),
            'data' => $message,
        );
        // echo "<pre>";
        // print_r($fields);
        // die;
        //$headers = array("Content-Type:" . "application/json","Authorization:" . "key=" . $apiKey);
        $headers = array(
            // 'Authorization: key=' . "AIzaSyBxumKKnknvpf4FP9iupqT4rraP1MlpAkU",
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
