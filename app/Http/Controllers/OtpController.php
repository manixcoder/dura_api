<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Track;
use App\Alarm_create;
use Carbon\Carbon;
use App\Templates;
use Twilio\Rest\Client;
use  App\User;
use DB;
use Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use League\Flysystem\Filesystem;
use League\Flysystem\Adapter\Local;
use URL;

class OtpController extends Controller
{
    // Function to generate OTP 
    public function generateNumericOTP($n)
    {
        // Take a generator string which consist of 
        // all numeric digits 
        $generator = "1357902468";

        // Iterate for n-times and pick a single character 
        // from generator and append it to $result 

        // Login for generating a random character from generator 
        //     ---generate a random number 
        //     ---take modulus of same with length of generator (say i) 
        //     ---append the character at place (i) from generator to result 

        $result = "";

        for ($i = 1; $i <= $n; $i++) {
            $result .= substr($generator, (rand() % (strlen($generator))), 1);
        }

        // Return result 
        return $result;
    }

    public function getpromocode(Request $request)
    {
        try {
            $data = DB::table('promocode')->where('created_at', '>=', Carbon::now()->toDateTimeString())->get();

            $data = collect(['status' => 200, "message" => "Success", "data" => $data]);
            return response()->json($data, 200);
        } catch (\Exception $e) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $e], 409);
        }
    }

    public function varify_promocode(Request $request)
    {
        $rules = [
            'promocode' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $row = DB::table('promocode')->where('name', $request->input('promocode'))->first();
                if ($row != null) {
                    $data = collect(["status" => 200, "message" => "Promocode Varified", "data" => $row]);
                    return response()->json($data, 200);
                }
                $data = collect(["status" => 200, "message" => "Wrong Promocode", "data" => $row]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e], 409);
            }
        }
    }

    public function send_otp(Request $request)
    {
        $rules = [
            'phone' => 'required',
            //'country_code' =>'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {

                $otp = $this->generateNumericOTP(4);
                $msg = "Your code for otp varification " . $otp;

                // use wordwrap() if lines are longer than 70 characters
                $msg = wordwrap($msg, 70);

                // send email
                //mail($request->input('email'),"Otp code from wmc",$msg);
                if (is_numeric($request->input('phone'))) {

                    // $row = DB::table('users')->where('phone','=',$request->input('phone'))->first();
                    //print_r($row);die;
                    /*if(empty($row)){
                        $data = collect(['status' => 201, "message" => "This Phone Number not found."]);
                        return response()->json($data, 201);    die;
                    }*/

                    $id = DB::table('users_otp')->insertGetId([
                        'otp' => $otp,
                        'phone' => $request->input('phone'),
                        'country_code' => $request->input('country_code')
                    ]);
                    require base_path('public/twilio-php-main/src/Twilio/autoload.php');
                    // dd(env('SID'));
                    // dd(env('TWILIO_TOKEN'));
                    // dd(env('TWILIO_FROM'));
                    $sid = env('SID');
                    $token = env('TWILIO_TOKEN');
                    $twilio = new Client($sid, $token);

                    $message = $twilio->messages
                        ->create(
                            $request->input('country_code') . $request->input('phone'), // to 
                            array(
                                "messagingServiceSid" => env('TWILIO_FROM'),
                                //"from" =>"Duradrive",
                                "body" => 'Otp code from Duradrive is:' . $otp
                            )
                        );
                    //echo "hi";die;
                    //print($message);die;
                } else {
                    $id = DB::table('users_otp')->insertGetId(['otp' => $otp, 'email' => $request->input('phone')]);
                    mail($request->input('phone'), "Otp code from Duradrive", 'Otp code from Duradrive is:' . $otp);
                }

                $data = collect(['status' => 200, "message" => "Success", "otp" => $otp]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => 'Please Enter valid Phone number'], 409);
            }
        }
    }

    public function varify_otp(Request $request)
    {
        $rules = [
            //'email' => 'required',  
            'phone' => 'required',
            'otp' => 'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                if (is_numeric($request->input('phone'))) {
                    $row = DB::table('users_otp')->where('otp', $request->input('otp'))->where('phone', $request->input('phone'))->first();
                } else {
                    $row = DB::table('users_otp')->where('otp', $request->input('otp'))->where('email', $request->input('phone'))->first();
                }
                if ($row != null) {
                    $data = collect(["status" => 200, "message" => "otp varified", "data" => $row]);
                    $is_update = DB::table('users_otp')->where('phone', $request->input('phone'))->delete();
                    return response()->json($data, 200);
                }
                $data = collect(["status" => 201, "message" => "Wrong code", "data" => $row]);
                return response()->json($data, 201);
            } catch (\Exception $e) {
                return response()->json(['status' => 422, 'message' => $e], 409);
            }
        }
    }
    public function create_new_password_with_otp(Request $request)
    {
        $rules = [
            'phone' => 'required',
            'otp' => 'required',
            'password' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 400, 'status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $row = DB::table('users_otp')->where('otp', '=', $request->otp)->where('phone', '=', $request->phone)->get()->first();
                if ($row != null) {
                    $enc_pass = app('hash')->make($request->password);
                    $row = DB::table('users')->where('email', '=', $request->email)->update(['password' => $enc_pass]);
                    $data = collect(['status' => 200, "message" => "Password updated", "data" => $row]);
                    return response()->json($data, 200);
                }
                $data = collect(['status' => 201, "message" => "Wrong code", "data" => $row]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $e], 409);
            }
        }
    }

    public function forgot_passworduser(Request $request)
    {
        $rules = [
            //'phone' => 'required', 
            'password' => 'required'
            //'country_code'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 400, 'status' => 'Failed', 'message' => "Password can not be empty."], 200);
        } else {
            try {
                if (is_numeric($request->phone)) {
                    $row = DB::table('users')->where('phone', '=', $request->phone)->first();
                    if (empty($row)) {
                        $data = collect(['status' => 201, "message" => "This Phone Number not found."]);
                        return response()->json($data, 201);
                    }
                    if ($row->country_code != $request->country_code) {
                        $data = collect(['status' => 201, "message" => "Wrong Country Code", "data" => null]);
                        return response()->json($data, 201);
                    }
                } else {
                    $row = DB::table('users')->where('email', '=', $request->phone)->first();
                    //print_r($row);die;
                    if (empty($row)) {
                        $data = collect(['status' => 201, "message" => "This email not found."]);
                        return response()->json($data, 201);
                    }
                }

                $enc_pass = app('hash')->make($request->password);
                if (is_numeric($request->phone)) {

                    $rowdata = DB::table('users')->where('phone', $request->phone)->update(['password' => $enc_pass]);
                } else {
                    //echo $request->phone;die;
                    /*$getrow= DB::table('users')->where('email',$request->email)->first();
                        print_r($getrow->id);die;*/
                    $rowdata = DB::table('users')->where('email', $request->phone)->update(['password' => $enc_pass]);
                }
                if ($rowdata) {
                    $data = collect(['status' => 200, "message" => "Password updated"]);
                    return response()->json($data, 200);
                } else {
                    $data = collect(['status' => 201, "message" => "Something went wrong try again"]);
                    return response()->json($data, 201);
                }
            } catch (\Exception $e) {
                print_r($e);
                die;
                return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => $e], 409);
            }
        }
    }

    public function otpmessages()
    {
        $apiKey = urlencode('Njg2NTU0NTE2ZDRlNGM0ZjM3Mzg0MzY0MzY0ZjRjNmY=');

        // Message details
        $numbers = array(917905848385);
        $sender = urlencode('TXTLCL');
        $message = rawurlencode('This is your message');

        $numbers = implode(',', $numbers);

        // Prepare data for POST request
        $data = array('apikey' => $apiKey, 'numbers' => $numbers, "sender" => $sender, "message" => $message);

        // Send the POST request with cURL
        $ch = curl_init('https://api.textlocal.in/send/');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($ch);
        curl_close($ch);
        print_r($response);
        // Process your response here
        //echo $response;
    }
    public function otpsent()
    {
        //mail('upendrasngh5@gmail.com',"Otp code from wmc",'sfdsfsd');
        /*Mail::send(['text'=>'mail'], $data, function($message) {
             $message->to('abc@gmail.com', 'Tutorials Point')->subject
                ('Laravel Basic Testing Mail');
             $message->from('xyz@gmail.com','Virat Gandhi');
        });
        echo "Basic Email Sent. Check your inbox.";*/

        require base_path('public/twilio-php-main/src/Twilio/autoload.php');
        // dd(env('SID'));
        // dd(env('TWILIO_TOKEN'));
        // dd(env('TWILIO_FROM'));
        $sid = env('SID');
        $token = env('TWILIO_TOKEN');
        $twilio = new Client($sid, $token);
        $message = $twilio->messages->create(
            "+917979948924", // to 
            array(
                "messagingServiceSid" => env('TWILIO_FROM'),
                "body" => "Test"
            )
        );
        print($message->sid);
    }
}
