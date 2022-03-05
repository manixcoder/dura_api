<?php
class GCM

	{

	// put your code here
	// constructor

	function __construct()
		{
		    return "Hello Manish";
		}

	public function send_notification($registatoin_ids, $message)
		{
		    $apiKey = "AAAAeB_dZhA:APA91bELAbNrF4c8U7ZQCN2AjOPxMUSCIsAk_OVjafBFXN4hERtN6sDu66KA2lyAEAlhWA_fjHagwgnqQUUEl40BB6vdYdpFqBhvBs-AkN9KjW-7h8GXxAv5MKbZaFYHSI6HUu3WxzUp";
		    //$url = 'https://android.googleapis.com/gcm/send';
		    $url = 'https://fcm.googleapis.com/fcm/send';
		    $fields = array(
		        'registration_ids' => $registatoin_ids,
		        'data' => $message,
		  );
		//$headers = array("Content-Type:" . "application/json","Authorization:" . "key=" . $apiKey);
		$headers = array(
		// 'Authorization: key=' . "AIzaSyBxumKKnknvpf4FP9iupqT4rraP1MlpAkU",
		'Authorization: key=' . $apiKey,'Content-Type: application/json');
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
		if ($result === FALSE)
			{
			die('Curl failed: ' . curl_error($ch));
			}

		// Close connection

		curl_close($ch);
		
		// return  $result;

		echo $result;
		}
	}

?>
