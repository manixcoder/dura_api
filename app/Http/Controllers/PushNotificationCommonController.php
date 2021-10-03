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
	public function generateReferalCode()
	{
		$acceptableChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
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
	public function generateReferalCodeDriver()
	{
		$acceptableChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
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
	public function getNearestDriver($lat1, $lon1, $unit)
	{
		$driverdata = DB::table('driveuser')->where('is_online', 1)->where('is_autoaccept', 1)->get();
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
				$distanc = $miles * 1.60934;
				//dd($miles);
				$unit = strtoupper($unit);
				if ($unit == "K") {
					$distanc = $miles * 1.60934;
					if ($distanc < 25) {
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
	public function generateUsersReferralCode($user_id)
	{
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
				'user_id'           => $user_id,
				'refereal_code'     => $generateCode,
				'is_used'           => '0',
				'valid_till'        => date('Y-m-d H:i:s', strtotime('+1 years')),
				'used_date_at'      => '',
				'used_by'           => '0',
				'description'       => 'This is the auto generated referral code with 50 % discount on first ride',
				'percent_discount'  => '50',
				'created_at'        => date("Y-m-d H:i:s"),
				'updated_at'        => date("Y-m-d H:i:s")
			]);
			$usersData = DB::table('users')->where('id', $user_id)->update([
				'referral_code' => $generateCode
			]);
			return $generateCode;
		}
	}
	public function multipleStopDistance($pickup_id)
	{
		$allLoaction = array();
		$durapickupsheduleData = DB::table('durapickupshedule')
			->where('id', $pickup_id)
			->orderby('id', 'desc')
			->first();
		$origin =  $durapickupsheduleData->pickuplat . "," . $durapickupsheduleData->pickuplon;
		$finalDestination = $durapickupsheduleData->destinationlat . "," . $durapickupsheduleData->destinationlon;
		$distance = 0;
		if ($durapickupsheduleData->is_stop == '1') {
			$stopData = DB::table('pickup_stoplocation')
				->where('pickup_id', $durapickupsheduleData->id)
				->get();
			$dynamiclocation = '';
			$totalRecode = count($stopData);
			foreach ($stopData as $key => $stop) {
				$location = $stop->stoplat . "," . $stop->stoplon;
				if ($key < 1) {
					$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $origin . "&destinations=" . $location . "&key=" . env('GOOGLE_KEY') . "";
					$api = file_get_contents($map);
					$data = json_decode($api);
					$distancevalue = @$data->rows[0]->elements[0]->distance->value;
					$distance = $distance + $distancevalue;
					$dynamiclocation .= $location;
				} else {
					if ($totalRecode - 1 === $key) {
						$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $dynamiclocation . "&destinations=" . $location . "&key=" . env('GOOGLE_KEY') . "";
						$api = file_get_contents($map);
						$data = json_decode($api);
						$distancevalue = @$data->rows[0]->elements[0]->distance->value;
						$distance = $distance + $distancevalue;
						$dynamiclocation = '';
						$dynamiclocation .= $location;
					}
				}
			}
			$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $dynamiclocation .  "&destinations=" . $finalDestination . "&key=" . env('GOOGLE_KEY') . "";
			$api = file_get_contents($map);
			$data = json_decode($api);
			$distancevalue = @$data->rows[0]->elements[0]->distance->value;
			$distance = $distance + $distancevalue;
		} else {

			$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $durapickupsheduleData->pickuplat . "," . $durapickupsheduleData->pickuplon . "&destinations=" . $durapickupsheduleData->destinationlat . "," . $durapickupsheduleData->destinationlon . "&key=" . env('GOOGLE_KEY') . "";
			$api = file_get_contents($map);
			$data = json_decode($api);
			$distancevalue = @$data->rows[0]->elements[0]->distance->value;
			$distance = $distance + $distancevalue;
		}
		$distance = $distance / 1000;
		$distance = number_format($distance, 2);
		return $distance;
	}
	public function multipleStopDistanceBackUp($pickup_id)
	{
		$durapickupsheduleData = DB::table('durapickupshedule')
			->where('id', $pickup_id)
			->orderby('id', 'desc')
			->first();
		if ($durapickupsheduleData->is_stop == '1') {
			$stopData = DB::table('pickup_stoplocation')
				->where('pickup_id', $durapickupsheduleData->id)
				->get();
			$stoplocation = '';
			foreach ($stopData as $stop) {
				$location = "|" . $stop->stoplat . "," . $stop->stoplon;
				$stoplocation .= $location;
			}
			$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $durapickupsheduleData->pickuplat . "," . $durapickupsheduleData->pickuplon . $stoplocation . "&destinations=" . $durapickupsheduleData->destinationlat . "," . $durapickupsheduleData->destinationlon . "&key=" . env('GOOGLE_KEY') . "";
		} else {
			$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $durapickupsheduleData->pickuplat . "," . $durapickupsheduleData->pickuplon . "&destinations=" . $durapickupsheduleData->destinationlat . "," . $durapickupsheduleData->destinationlon . "&key=" . env('GOOGLE_KEY') . "";
		}
		// $map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=28.617276,77.180989|27.307315,77.982991|28.976272,78.649494|28.664557,77.426533&destinations=27.6901798,76.8147774&key=" . env('GOOGLE_Key') . "";
		$api = file_get_contents($map);
		$data = json_decode($api);
		$times = @$data->rows[0]->elements[0]->duration->text;
		$distance = 0;
		foreach (@$data->rows as $row) {
			$distancetext = $row->elements[0]->distance->value;
			//$distanceText = explode(" ", $distancetext);
			//$distance = $distance + $distanceText[0];
			$distance = $distance + $distancetext;
		}
		$distance = $distance / 1000;
		$distance = number_format($distance, 2);
		return $distance;
	}
	public function multipleStopDistanceTime($pickup_id)
	{
		$allLoaction = array();
		$durapickupsheduleData = DB::table('durapickupshedule')
			->where('id', $pickup_id)
			->orderby('id', 'desc')
			->first();
		$origin =  $durapickupsheduleData->pickuplat . "," . $durapickupsheduleData->pickuplon;
		$finalDestination = $durapickupsheduleData->destinationlat . "," . $durapickupsheduleData->destinationlon;
		$distance = 0;
		if ($durapickupsheduleData->is_stop == '1') {
			$stopData = DB::table('pickup_stoplocation')
				->where('pickup_id', $durapickupsheduleData->id)
				->get();
			$dynamiclocation = '';
			$totalRecode = count($stopData);
			foreach ($stopData as $key => $stop) {
				$location = $stop->stoplat . "," . $stop->stoplon;
				if ($key < 1) {
					$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $origin . "&destinations=" . $location . "&key=" . env('GOOGLE_KEY') . "";
					$api = file_get_contents($map);
					$data = json_decode($api);
					$distancevalue = @$data->rows[0]->elements[0]->duration->value;
					$distance = $distance + $distancevalue;
					$dynamiclocation .= $location;
				} else {
					if ($totalRecode - 1 === $key) {
						$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $dynamiclocation . "&destinations=" . $location . "&key=" . env('GOOGLE_KEY') . "";
						$api = file_get_contents($map);
						$data = json_decode($api);
						$distancevalue = @$data->rows[0]->elements[0]->duration->value;
						$distance = $distance + $distancevalue;
						$dynamiclocation = '';
						$dynamiclocation .= $location;
					}
				}
			}
			$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $dynamiclocation .  "&destinations=" . $finalDestination . "&key=" . env('GOOGLE_KEY') . "";
			$api = file_get_contents($map);
			$data = json_decode($api);
			$distancevalue = @$data->rows[0]->elements[0]->duration->value;
			$distance = $distance + $distancevalue;
		} else {
			$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $durapickupsheduleData->pickuplat . "," . $durapickupsheduleData->pickuplon . "&destinations=" . $durapickupsheduleData->destinationlat . "," . $durapickupsheduleData->destinationlon . "&key=" . env('GOOGLE_KEY') . "";
			$api = file_get_contents($map);
			$data = json_decode($api);
			$distancevalue = @$data->rows[0]->elements[0]->duration->value;
			$distance = $distance + $distancevalue;
		}
		$distance = $distance / 1000;
		$distance = number_format($distance, 2);
		return $distance;
	}
}
