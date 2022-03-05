<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use DB;
use App\User;
use Hash;
use URL;

class PushNotificationCommonController extends Controller
{
     public function __construct(){
         date_default_timezone_set("Asia/Kolkata");
     }
    public function postNotification($user_id, $message, $ext){
		$store = DB::table('notification')->insert([
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
	public function driverNotification($driver_id, $message, $ext){
		$store = DB::table('driverusernotification')->insert([
			'driver_id' => $driver_id,
			'description' => $message,
			'type' => $ext,
			'reason' => $ext,
			'is_read' => '0',
			'created_at' => date('Y-m-d H:i:s'),
			'updated_at' => date('Y-m-d H:i:s'),
		]);
		return true;
	}
	public function generateReferalCode(){
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
	public function generateReferalCodeDriver(){
	    $acceptableChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	    $randomCode = "";
		for ($i = 0; $i < 8; $i++) {
			$randomCode .= substr($acceptableChars, rand(0, strlen($acceptableChars) - 1), 1);
		}
		$generateCode = $randomCode;
		$is_update = DB::table('driver_referralcode')->where('refereal_code', $generateCode)->first();
		if ($is_update > 0) {
		    
			return $this->generateReferalCodeDriver();
		} else {
			return $generateCode;
		}
	}
	public function distance($lat1, $lon1, $lat2, $lon2, $unit){
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
	public function getNearestDriver($pickup_id,$lat1, $lon1, $unit){
		$driverdata = DB::table('driveuser')->where('is_online', 1)->where('isactive',1)->get();
       // echo "<pre>";print_r($driverdata);die;
		$orderData = DB::table('durapickupshedule')->where('id', $pickup_id)->first();
		$orderDatas = $this->getPickupDetails($pickup_id);
		
		foreach ($driverdata as $driver) {
		  
			$lat2 = $driver->latitude;
			$lon2 = $driver->longitude;
			if (($lat1 == $lat2) && ($lon1 == $lon2)) {
				return 0;
			} else {
			    // echo "<pre>";print_r($driver);die;
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
					if ($distanc < 25000) {
					    $message = array(
					        "pushmessage" => array('data'=>$orderDatas),
					        "notification_type"=>"accepted"
					   );
					   $notification =array(
					       'title'=> "Driver accept Your Order",
					       'sound'=> "default",
					       'body' => "Accepted Order",
					   );
					   $result = $this->send_notification($driver->device_id, $message,$notification);
					   // echo "<pre>";print_r($result);die;
					   //return $driver->id;
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
	
	public function generateDriverReferralCode($driver_id){
		$acceptableChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		$randomCode = "";
		for ($i = 0; $i < 8; $i++) {
			$randomCode .= substr($acceptableChars, rand(0, strlen($acceptableChars) - 1), 1);
		}
		$generateCode = $randomCode;
		$usersReferralData = DB::table('driver_referralcode')->where('refereal_code', $generateCode)->first();
		if ($usersReferralData > 0) {
			return $this->generateUsersReferralCode($user_id);
		} else {
			$usersReferral = DB::table('driver_referralcode')->insert([
				'driver_id'           => $driver_id,
				'refereal_code'     => $generateCode,
				//'is_used'           => '0',
				'valid_till'        => date('Y-m-d H:i:s', strtotime('+1 years')),
				'used_date_at'      => '',
				'used_by'           => '0',
				'description'       => 'This is the auto generated referral code with 50 % discount on first ride',
				'percent_discount'  => '50',
				'created_at'        => date("Y-m-d H:i:s"),
				'updated_at'        => date("Y-m-d H:i:s")
			]);
			$driverData = DB::table('driveuser')
			->where('id', $driver_id)
			->update([
				'referralcode' => $generateCode
			]);
			return $generateCode;
		}
	}
	public function multipleStopDistance($pickup_id){
	    $allLoaction = array();
		$durapickupsheduleData = DB::table('durapickupshedule')->where('id', $pickup_id)->orderby('id', 'desc')->first();
		//echo "<pre>";print_r($durapickupsheduleData->pickuplat);die;
		$origin             =  $durapickupsheduleData->pickuplat . "," . $durapickupsheduleData->pickuplon;
		$finalDestination   = $durapickupsheduleData->destinationlat . "," . $durapickupsheduleData->destinationlon;
		$distance = 0;
		
        $map            = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=". $durapickupsheduleData->pickuplat .",". $durapickupsheduleData->pickuplon ."&destinations=". $durapickupsheduleData->destinationlat .",". $durapickupsheduleData->destinationlon ."&key=" . env('GOOGLE_KEY') . "";
		//die;
		$api            = file_get_contents($map);
		$data           = json_decode($api);
		$distancevalue  = @$data->rows[0]->elements[0]->distance->value;
		$distance       = $distance + $distancevalue;
		
		if ($durapickupsheduleData->is_stop == '1') {
			$stopData = DB::table('pickup_stoplocation')
				->where('pickup_id', $durapickupsheduleData->id)
				->get();
			$dynamiclocation    = '';
			$totalRecode        = count($stopData);
			foreach ($stopData as $key => $stop) {
				$location = $stop->stoplat . "," . $stop->stoplon;
				if ($key < 1) {
					$map            = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $finalDestination . "&destinations=" . $location . "&key=" . env('GOOGLE_KEY') . "";
					$api            = file_get_contents($map);
					$data           = json_decode($api);
					$distancevalue  = @$data->rows[0]->elements[0]->distance->value;
					$distance       = $distance + $distancevalue;
					$dynamiclocation .= $location;
				} else {
					if($totalRecode-1 === $key){
						$map                = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $dynamiclocation . "&destinations=" . $location . "&key=" . env('GOOGLE_KEY') . "";
						$api                = file_get_contents($map);
						$data               = json_decode($api);
						$distancevalue      = @$data->rows[0]->elements[0]->distance->value;
						$distance           = $distance + $distancevalue;
						$dynamiclocation    ='';
						$dynamiclocation   .= $location;
					}
					
				}
			}
            // $map             = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $dynamiclocation .  "&destinations=" . $finalDestination . "&key=" . env('GOOGLE_KEY') . "";
            // $api             = file_get_contents($map);
            // $data            = json_decode($api);
            // $distancevalue   = @$data->rows[0]->elements[0]->distance->value;
            // $distance        = $distance + $distancevalue;
		    
		}
		// else {
		// $map             = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $durapickupsheduleData->pickuplat . "," . $durapickupsheduleData->pickuplon . "&destinations=" . $durapickupsheduleData->destinationlat . "," . $durapickupsheduleData->destinationlon . "&key=" . env('GOOGLE_KEY') . "";
		// die;
		// $api             = file_get_contents($map);
		// $data            = json_decode($api);
		// $distancevalue   = @$data->rows[0]->elements[0]->distance->value;
		// $distance        = $distance + $distancevalue;
		// }
		// echo $distance;
		// die;
		$distance = $distance / 1000;
		$distance = number_format($distance, 2);
		return $distance;
	}
	public function multipleStopDistanceBackUp($pickup_id){
	    $durapickupsheduleData = DB::table('durapickupshedule')->where('id', $pickup_id)->orderby('id', 'desc')->first();
		if ($durapickupsheduleData->is_stop == '1') {
			$stopData = DB::table('pickup_stoplocation')->where('pickup_id', $durapickupsheduleData->id)->get();
			$stoplocation = '';
			foreach ($stopData as $stop) {
				$location = "|" . $stop->stoplat . "," . $stop->stoplon;
				$stoplocation .= $location;
			}
			$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $durapickupsheduleData->pickuplat . "," . $durapickupsheduleData->pickuplon . $stoplocation . "&destinations=" . $durapickupsheduleData->destinationlat . "," . $durapickupsheduleData->destinationlon . "&key=" . env('GOOGLE_KEY') . "";
		} else {
			$map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $durapickupsheduleData->pickuplat . "," . $durapickupsheduleData->pickuplon . "&destinations=" . $durapickupsheduleData->destinationlat . "," . $durapickupsheduleData->destinationlon . "&key=" . env('GOOGLE_KEY') . "";
		}
		$api = file_get_contents($map);
		$data = json_decode($api);
		$times = @$data->rows[0]->elements[0]->duration->text;
		$distance = 0;
		foreach (@$data->rows as $row) {
			$distancetext = $row->elements[0]->distance->value;
			// $distanceText    = explode(" ", $distancetext);
			// $distance        = $distance + $distanceText[0];
			$distance           = $distance + $distancetext;
		}
		$distance = $distance / 1000;
		$distance = number_format($distance, 2);
		return $distance;
	}
	public function multipleStopDistanceTime($pickup_id){
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
					$map            = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $origin . "&destinations=" . $location . "&key=" . env('GOOGLE_KEY') . "";
					$api            = file_get_contents($map);
					$data           = json_decode($api);
					$distancevalue  = @$data->rows[0]->elements[0]->duration->value;
					$distance       = $distance + $distancevalue;
					$dynamiclocation .= $location;
				} else {
					if($totalRecode-1 === $key){
						$map        = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $dynamiclocation . "&destinations=" . $location . "&key=" . env('GOOGLE_KEY') . "";
						$api        = file_get_contents($map);
						$data       = json_decode($api);
						$distancevalue = @$data->rows[0]->elements[0]->duration->value;
						$distance   = $distance + $distancevalue;
						$dynamiclocation='';
						$dynamiclocation .= $location;
					}
					
				}
			}
			$map            = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $dynamiclocation .  "&destinations=" . $finalDestination . "&key=" . env('GOOGLE_KEY') . "";
			$api            = file_get_contents($map);
			$data           = json_decode($api);
			$distancevalue  = @$data->rows[0]->elements[0]->duration->value;
			$distance       = $distance + $distancevalue;
		} else {
			$map            = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $durapickupsheduleData->pickuplat . "," . $durapickupsheduleData->pickuplon . "&destinations=" . $durapickupsheduleData->destinationlat . "," . $durapickupsheduleData->destinationlon . "&key=" . env('GOOGLE_KEY') . "";
			$api            = file_get_contents($map);
			$data           = json_decode($api);
			$distancevalue  = @$data->rows[0]->elements[0]->duration->value;
			$distance       = $distance + $distancevalue;
		}
		$distance           = $distance / 1000;
		$distance           = number_format($distance, 2);
		return $distance;
	}
	
	public function orderPriceBreakdown($pickup_id)
	{
		$durapickupsheduleData  = DB::table('durapickupshedule')->where('id', $pickup_id)->orderby('id', 'desc')->first();
		$getvehicle             =  DB::table('vehicle')->where('id',$durapickupsheduleData->vehicle_id)->where('service', 1)->first();
		$distance               = $this->multipleStopDistance($pickup_id);
		
		$getvehicle             =  DB::table('vehicle')->where('id', $durapickupsheduleData->vehicle_id)->where('service', 1)->first();
		$kmprice                = round($distance * $getvehicle->kmfare, 1);
		
		$totalPrices            = $durapickupsheduleData->finalprice;
		$totalWithoutDiscounted = $durapickupsheduleData->price;
		/*
		$kmprice = round((int)$distance * (int)$getvehicle->kmfare, 0, PHP_ROUND_HALF_UP);
		$totalPrices = round($durapickupsheduleData->finalprice, 0, PHP_ROUND_HALF_UP);
		$totalWithoutDiscounted = round($durapickupsheduleData->price, 0, PHP_ROUND_HALF_UP);
		*/ 		
		$totalNew =$totalPrices;
		if ($durapickupsheduleData->tip != '') {
			$tip = $durapickupsheduleData->tip;
		} else {
			$tip = '0';
		}

		$services = DB::table('durapickup_services as ds')
			->join('pricecard as pc', 'ds.service_id', '=', 'pc.id')
			->where('ds.pickup_id', $pickup_id)
			->select('pc.id', 'pc.services', 'pc.servicefee')
			->get();
		$completePrice =  array(
			'distance'              => $distance,
			'totalWithoutDiscounted'=> $totalWithoutDiscounted ,
			'totalWithDiscounted'   => $totalPrices-$tip,
			'kmprice'               => $kmprice,
			'basefare'              => $getvehicle->basefare,
			'total'                 => $totalNew,
			'tip'                   => $tip,
			'per_km'                => $getvehicle->kmfare,
			'services'              => @$services,
			'currency'              => '₱',
			'surcharge'             => 10
		);
		return $completePrice;
	}
	
	 public function send_notification($registatoin_ids, $message,$notification)
		{
		    $apiKey = env('Server_key');
		    // $url = 'https://android.googleapis.com/gcm/send';
		    // $registatoin_ids='fUayOY7cc48:APA91bHjO4UOGm8N78mOIfOYtTA8bTBn-8UL6enrTAeX4SNrpgS37bzRfRfjs-XYGZBt-TRty2eZBPMZqbk27kws8umUUyFYEccMWVN_Fx-UfJhm2QFXOLvSaQyjgGcTzcQL_sCxUmPt';
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
		       return  $result;
		     // echo $result;
		}
		
		public function user_send_notification($registatoin_ids, $message,$notification)
		{
		    $apiKey = env('User_key');
		    // $url = 'https://android.googleapis.com/gcm/send';
		    // $registatoin_ids='fUayOY7cc48:APA91bHjO4UOGm8N78mOIfOYtTA8bTBn-8UL6enrTAeX4SNrpgS37bzRfRfjs-XYGZBt-TRty2eZBPMZqbk27kws8umUUyFYEccMWVN_Fx-UfJhm2QFXOLvSaQyjgGcTzcQL_sCxUmPt';
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
		      // echo "<pre>";
		      // print_r($fields);
		      // die;
		      
		      
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
		       return  $result;
		      // echo $result;
		}
		
		public function getPickupDetails($pickup_id)
		{
		 
            try {
                $IsPresent = DB::table('durapickupshedule')->where('id', $pickup_id)->where('vehicle_id', '!=', null)->orderby('id', 'desc')->first();
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
                    $getusers     =  DB::table('users')->where('id', $IsPresent->user_id)->first();
                    if ($getpickup->vehicle_id != "") {
                        $getvehicle     =  DB::table('vehicle')->where('id', $getpickup->vehicle_id)->where('service', 1)->first();
                        $getdriver      =  DB::table('driveuser')->where('id', $getpickup->driver_id)->first();/*$getpickup->driver_id*/
                        $searchdriver   =  DB::table('search_driver')->orderBy('id', 'desc')->first();

                        $origin         = $getpickup->pickuplat . "," . $getpickup->pickuplon;
                        $destination    = $getpickup->destinationlat . "," . $getpickup->destinationlon;
                        $api            = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=".$origin."&destinations=".$destination."&key=".env("GOOGLE_KEY")."");
                        $dataapis       = json_decode($api);
                        //print_r($dataapis);die;
                        $times = @$dataapis->rows[0]->elements[0]->duration->value;
                        /*if($times==null)
                        {
                            return response()->json(['status' => 201,'message'=>'No Driver found','data'=>null], 201);
                        }*/

                        // $km = $this->distance($getpickup->pickuplat, $getpickup->pickuplon, $getpickup->destinationlat, $getpickup->destinationlon, "K");
                        // $distance = number_format($km, 0, '', '');
                       
                        /*distance by google api start */ 
                       // $tasks_controller = new PushNotificationCommonController;
                        $distance = $this->multipleStopDistance($IsPresent->id);
                        // echo $distance;
                        // die;
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
                        $getUserData  = DB::table('users')->where('id', $getpickup->user_id)->first();
                        $origin = $getpickup->pickuplat . "," . $getpickup->pickuplon;
                        $destination = $getpickup->destinationlat . "," . $getpickup->destinationlon;
                        $stopcount = DB::table('pickup_stoplocation')->where('pickup_id', $getpickup->id)->count();
                        //echo $stopcount;die;
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
                        /* multiple stop data end*/
                        
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
                        //$tasks_controller = new PushNotificationCommonController;
                        $completePrice = $this->orderPriceBreakdown($getpickup->id);
                        
                        
                        $finalData  = array(
                            'servicetype'       => 'Dura Express',
                            'pickup_id'         => $getpickup->id,
                            'driver_id'         => $getpickup->driver_id,
                            'order_no'          => $getpickup->order_no,
                            'pickup'            => $getpickup->pickup_address1 . $getpickup->pickup_address2,
                            'stoplocation'      => $getpickup->stop_address1 . $getpickup->stop_address2,
                            'dropoff'           => $getpickup->destination_address1 . $getpickup->destination_address2,
                            'wheretoname'       => $getpickup->destination_name,
                            'wheretomobile'     => $getpickup->destination_mobile,
                            'distance'          => $distance,
                            'itemphoto'          => URL::to('/') . "/public/Media/" . @$getpickup->itemphoto,
                            'drivernote'        => $getpickup->drivernote,
                            'time'              => @$times,
                            'pickup_name'       => $getpickup->pickup_name,
                            'pickuplat'         => $getpickup->pickuplat,
                            'pickuplon'         => $getpickup->pickuplon,
                            'destinationlat'    => $getpickup->destinationlat,
                            'destinationlon'    => $getpickup->destinationlon,
                            'pickup_mobile'     => $getpickup->pickup_mobile,
                            'destination_mobile' => $getpickup->destination_mobile,
                            'price'             => $completePrice,
                            'drivername'        => @$drivername,
                            'driverphoto'       => @$driverphoto,
                            'drivermobile'      => @$getdriver->mobile,
                            'driverdescription' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s',
                            'vehicle'           => $getvehicle->vehicle_type,
                            'username'          => @$getusers->first_name . " " . @$getusers->last_name,
                            'user_id'           => $getpickup->user_id,
                            'profile_image'      =>  URL::to('/') . "/public/Media/" .$getUserData->profile_image,
                            'usermobile'        => @$getusers->phone,
                            'vehicleno'         => 'UP16Y1719',
                            'status'            => @$getpickup->status,
                            'driver_action'     => @$getpickup->driver_action,
                            'orderdate'         => date('F jS Y \a\t h:i:s A', strtotime($getpickup->pdate)),
                            'driverlocationlink' => $driverlocationlink,
                            'paymentmode'       => $getpickup->paymentmode,
                            'coupon'            => @$coupon,
                            'stopdata'          => @$stoplocation
                        );
                        return $finalData;
                        return response()->json(['status' => 200, 'message' => 'Success', 'data' => $finalData], 200);
                    }
                } else {
                    return response()->json(['status' => 200, 'message' => 'No Data found', 'data' => ""], 200);
                }
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        
    }
}
