<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use DB;
use Hash;

class PushNotificationCommonController extends Controller
{
	public function postNotification($user_id, $message, $ext)
	{
		DB::table('notification')->insert([
			'user_id' => $user_id,
			'description' => $message,
			'type' => $ext,
			'reason' => $ext,
			'is_read' => 0,
			'created_at' => date('Y-m-d H:i:s'),
			'updated_at' => date('Y-m-d H:i:s'),
		]);
		return true;
	}
	public function getNearestDriver($lat1, $lon1, $unit)
	{
		$driverdata = DB::table('driveuser')->get();
		foreach ($driverdata as $driver) {
			$lat2 = $driver->latitude;
			$lon2 = $driver->longitude;
		
			if (($lat1 == $lat2) && ($lon1 == $lon2)) {
				return 0;
			} else {
				$theta = $lon1 - $lon2;
				$dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
				$dist = acos($dist);
				$dist = rad2deg($dist);
				$miles = $dist * 60 * 1.1515;
				$distanc =$miles * 1.60934;
				
				//dd($miles);
				$unit = strtoupper($unit);
				if ($unit == "K") {
					$distanc =$miles * 1.60934;
					if($distanc < 25){
						return $driver->id;
					}
				//	return ($miles * 1.60934);
				} else if ($unit == "N") {
					return ($miles * 0.8684);
				} else {
					return $miles;
				}
			}
		}
	}
	public function generateUsersReferralCode($user_id){
        
        $acceptableChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        $randomCode = "";
		for ($i = 0; $i < 8; $i++) {
			$randomCode .= substr($acceptableChars, rand(0, strlen($acceptableChars) - 1), 1);
		}
		$generateCode = $randomCode;
        $usersReferralData = DB::table('users_referralcode')->where('refereal_code', $generateCode)->first();
        if ($usersReferralData > 0) {
			return $this->generateUsersReferralCode($user_id);
		} else {
            $usersReferral = DB::table('users_referralcode')->insert([
                'user_id'=>$user_id,
                'refereal_code'=>$generateCode,
                'is_used'=>'0', 
                'valid_till'=>date('Y-m-d H:i:s', strtotime('+1 years')),
                'used_date_at'=>'',
                'used_by'=>'0',
                'description'=>'This is the auto generated referral code with 50 % discount on first ride',
                'percent_discount'=>'50',
                'created_at'=>date("Y-m-d H:i:s"),
                'updated_at'=>date("Y-m-d H:i:s")
            ]);
            $usersData = DB::table('users')->where('id', $user_id)->update([
                'referral_code'=>$generateCode
            ]);
			return $generateCode;
		}

    }

	function generateReferalCode()
	{
		//$generateCode = (rand(1000, 9999));
		$acceptableChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		//$acceptableChars = "0123456789";
		$randomCode = "";
		for ($i = 0; $i < 8; $i++) {
			$randomCode .= substr($acceptableChars, rand(0, strlen($acceptableChars) - 1), 1);
		}
		$generateCode = $randomCode;

		$is_update = DB::table('users')->where('referral_code', $generateCode)->first();

		if ($is_update > 0) {
			return $this->generateReferalCode();
		} else {
			return $generateCode;
		}
	}
	function generateReferalCodeDriver()
	{
		//$generateCode = (rand(1000, 9999));
		$acceptableChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		//$acceptableChars = "0123456789";
		$randomCode = "";
		for ($i = 0; $i < 8; $i++) {
			$randomCode .= substr($acceptableChars, rand(0, strlen($acceptableChars) - 1), 1);
		}
		$generateCode = $randomCode;

		$is_update = DB::table('driveuser')->where('referralcode', $generateCode)->first();

		if ($is_update > 0) {
			return $this->generateReferalCode();
		} else {
			return $generateCode;
		}
	}
	public function distance($lat1, $lon1, $lat2, $lon2, $unit)
	{
		if (($lat1 == $lat2) && ($lon1 == $lon2)) {
			return 0;
		} else {
			$theta = $lon1 - $lon2;
			$dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
			$dist = acos($dist);
			$dist = rad2deg($dist);
			$miles = $dist * 60 * 1.1515;
			$unit = strtoupper($unit);
			if ($unit == "K") {
				return ($miles * 1.609344);
			} else if ($unit == "N") {
				return ($miles * 0.8684);
			} else {
				return $miles;
			}
		}
	}

	public function multipleStopDistance($lat1, $lon1, $lat2, $lon2, $unit)
	{
		if (($lat1 == $lat2) && ($lon1 == $lon2)) {
			return 0;
		} else {
			$theta = $lon1 - $lon2;
			$dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
			$dist = acos($dist);
			$dist = rad2deg($dist);
			$miles = $dist * 60 * 1.1515;
			$unit = strtoupper($unit);
			if ($unit == "K") {
				return ($miles * 1.609344);
			} else if ($unit == "N") {
				return ($miles * 0.8684);
			} else {
				return $miles;
			}
		}
	}
}
