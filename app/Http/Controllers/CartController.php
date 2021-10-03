<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\PushNotificationCommonController;
use App\User;
use DB;
use Hash;
use URL;

class CartController extends Controller
{
    public function add_to_user_cart(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            'item_id' => 'required',
            'qty' => 'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $IsPresent = DB::table('cart_items')->where('user_id', $request->user_id)->where('item_id', $request['item_id'])->first();
                if ($IsPresent) {
                    $IsPresent->qty++;
                    $is_update = DB::table('cart_items')->where('user_id', $request->user_id)->where('item_id', $IsPresent->item_id)->update(['qty' => $IsPresent->qty]);
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $is_update], 200);
                } else {
                    $item = DB::table('cart_items')->insertGetId($request->all());
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $item], 200);
                }
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }
    public function createNotifications(Request $request)
    {
        $rules = [
            'description' => 'required',
            'user_id'     => 'required|int',
            'type'        => 'required',
            'reason'      => 'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $finalData =  array(
                    'description'  => $request->description,
                    'user_id'      => $request->user_id,
                    'type'         => $request->type,
                    'reason'       => $request->reason,
                    'is_read'      => 0,
                    'created_at'   => date('Y-m-d H:i:s')
                );
                $item = DB::table('notification')->insertGetId($finalData);
                return response()->json(['status' => 200, 'message' => 'Success'], 200);
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }

    public function get_notification(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            //'amount'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 201);
        } else {
            $data = DB::table('notification')->where('user_id', $request->user_id)->orderBy('id', 'DESC')->get();
            if ($data) {
                return response()->json(['status' => 200, 'message' => 'Success', 'data' => $data], 200);
            } else {
                return response()->json(['status' => 201, 'message' => 'Not found', 'data' => ""], 201);
            }
        }
    }

    public function read_notification(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 201);
        } else {
            $data = DB::table('notification')->where('user_id', $request->user_id)->get();
            if ($data) {
                if ($request->is_read == 'all') {
                    $is_update = DB::table('notification')->where('user_id', $request->user_id)->update(['is_read' => 1]);
                } else {
                    $is_update = DB::table('notification')->where('user_id', $request->user_id)->where('id', $request->notification_id)->update(['is_read' => 1]);
                }


                return response()->json(['status' => 200, 'message' => 'Success'], 200);
            } else {
                return response()->json(['status' => 201, 'message' => 'Not found'], 201);
            }
        }
    }

    public function addtowallet(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            //'amount'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $getamount = DB::table('wallet_recharge')->where('user_id', $request->user_id)->orderBy('id', 'desc')->first();
                $price = $request->amount;
                if (!empty($getamount)) {
                    $price = $getamount->amount + $request->amount;
                }

                $finalData =  array(
                    'transactiontype' => $request->transactiontype,
                    'user_id'         => $request->user_id,
                    'amount'          => $price,
                    'phone'           => '0',
                    'method'          => 'credit',
                    'change_amount'   => $request->amount,
                    'transactionid'   => $request->transactionid,
                    'created_at'      => date('Y-m-d H:i:s')
                );

                if ($request->amount != "") {
                    $item   = DB::table('wallet_recharge')->insertGetId($finalData);
                }

                $getdata = DB::table('wallet_recharge')->where('user_id', $request->user_id)->orderBy('id', 'desc')->first();
                //print_r($getdata);die;
                if (isset($item)) {
                    return response()->json(['status' => 200, 'message' => 'Success', 'amount' => $getdata], 200);
                } else {

                    return response()->json(['status' => 200, 'message' => 'Success', 'amount' => $getdata], 200);
                }
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }
    public function shedule_pickup(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            'pickup_mobile' => 'required',
            'pickup_name' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $pickupshedule = array(
                    "pickup_address1" => $request->pickup_address1,
                    "pickup_address2" => $request->pickup_address2,
                    "pickup_mobile" => $request->pickup_mobile,
                    "pickup_name" => $request->pickup_name,
                    "destination_address1" => $request->destination_address1,
                    "destination_address2" => $request->destination_address2,
                    "destination_mobile" => $request->destination_mobile,
                    "destination_name" => $request->destination_name,
                    "type" => $request->type,
                    "acctype" => $request->acctype,
                    "pdate" => $request->pdate,
                    "created_at" => $request->created_at,
                    "user_id" => $request->user_id,
                    "pickuplat" => $request->pickuplat,
                    "pickuplon" => $request->pickuplon,
                    "destinationlat" => $request->destinationlat,
                    "destinationlon" => $request->destinationlon,
                    "status" => '1'
                );
                $item = DB::table('durapickupshedule')->insertGetId($pickupshedule);
                //print_r($item);die;
                if ($request->stopData != null) {
                    $update = DB::table('durapickupshedule')->where('id', $item)->update(['is_stop' => '1']);
                    //$stopData = $request->stopData;
                    $services = array();
                    foreach ($request->stopData as $data) {
                        $services = array(
                            'pickup_id'     => $item,
                            'stop_address1' => $data['stop_address1'],
                            'stop_address2' => $data['stop_address2'],
                            'stop_name'     => $data['stop_name'],
                            'stop_mobile'   => $data['stop_mobile'],
                            'stoplat'       => $data['stoplat'],
                            'stoplon'       => $data['stoplon']
                        );
                        $iteminsert = DB::table('pickup_stoplocation')->insertGetId($services);
                    }
                }
                return response()->json(['status' => 200, 'message' => 'Success', 'data' => $item], 200);
            } catch (\Exception $e) {
                // dd($e);
                return response()->json(['status' => 422, 'message' => $e->getMessage()], 500);
            }
        }
    }

    public function get_vehicle(Request $request)
    {
        $rules = [
            'pickuplat' => 'required',
            'pickuplon' => 'required',
            'destinationlat' => 'required',
            'destinationlon' => 'required',
            'pickup_id' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                // $km = $this->distance($request->pickuplat, $request->pickuplon, $request->destinationlat, $request->destinationlon, "K");
                // $distance = number_format($km, 0, '', '');
                $tasks_controller = new PushNotificationCommonController;
                $distance = $tasks_controller->multipleStopDistance($request->pickup_id);
                $data = DB::table('vehicle')->where('service', 1)->get();
                if ($data) {
                    $finalData = array();
                    foreach ($data as $item) {
                        $pricecard = DB::table('pricecard')->where('service', 1)->where('vehicle_type', $item->id)->get();
                        $services  = array();
                        foreach ($pricecard as $items) {
                            //print_r($item);die;
                            $services[] = array(
                                'id'           => $items->id,
                                'service'      => $items->services,
                                'price'         => $items->servicefee
                            );
                        }


                        $totalprice = $distance * $item->kmfare + $item->basefare;
                        $finalData[] =  array(
                            'id'           => $item->id,
                            'service'      => $item->service,
                            'city'         => $item->city,
                            'currency'      => '₱',
                            'vehicle_type' => $item->vehicle_type,
                            'weight_limit' => $item->weight_limit,
                            'size_limit'   => $item->size_limit,
                            'priceby'      => $item->priceby,
                            'basefare'     => $item->basefare,
                            'image'        => URL::to('/') . "/public/Media/" . $item->image,
                            'kmfare'       => $item->kmfare,
                            'priceafterbasefare' => $item->priceafterbasefare,
                            'stopprice'    => $item->stopprice,
                            'description'  => $item->description,
                            'totalfare'    => $totalprice,
                            'created_at'   => $item->created_at,
                            'services'     => $services
                        );
                        // echo "<pre>";
                        // print_r($finalData);
                        // die;
                        // URL::to('/')."/public/Media/".
                    }
                    //$is_update=DB::table('cart_items')->where('user_id', $request->user_id)->where('item_id',$IsPresent->item_id)->update(['qty'=>$IsPresent->qty]);
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $finalData], 200);
                } else {

                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => ""], 200);
                }
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }

    public function pickup_details(Request $request)
    {
        $rules = [
            'pickup_id' => 'required|int',
            'vehicle_id' => 'required|int'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 201);
        } else {
            try {
                $pickupsheduleData = DB::table('durapickupshedule')->where('id', $request->pickup_id)->first();

                $pickuplat = $pickupsheduleData->pickuplat;
                $pickuplon = $pickupsheduleData->pickuplon;

                $tasks_controller = new PushNotificationCommonController;
                $nerarestDriver = $tasks_controller->getNearestDriver($pickuplat, $pickuplon, 'K');
                $driverid = $nerarestDriver;
                $driverid = '5';
                $status  = '1'; //Pending
                if ($file = $request->file('itemphoto')) {
                    $destinationPath = base_path('public/Media/');
                    $profileImage = uniqid('itemphoto') . "-" . $file->getClientOriginalName();
                    $path = $file->move($destinationPath, $profileImage);
                    //$data = collect(["status" => "200", "message" => "Success", "data" => $profileImage]);
                    //return response()->json($data, 200);
                } else {
                    $profileImage = "";
                }
                if ($request->type == 'later') {
                    $driverid = '0';
                    $status  = '1'; //Pending    
                }
                if ($request->services == 'no') {
                } else {
                    $servicesArray = json_decode($request->services, true);
                    $getpickup = DB::table('durapickup_services')->where('pickup_id', $request->pickup_id)->delete();
                    foreach ($servicesArray as $service) {
                        $services = DB::table('durapickup_services')->insert([
                            'pickup_id'     => $request->pickup_id,
                            'service_id'    => $service['service_id'],
                            'created_at'    => date("Y-m-d H:i:s"),
                            'updated_at'    => date("Y-m-d H:i:s"),
                        ]);
                    }
                }


                $is_update = DB::table('durapickupshedule')->where('id', $request->pickup_id)->update([
                    'driver_id'   => $driverid,
                    'status'      => $status,
                    'vehicle_id'  => $request->vehicle_id,
                    'price'       => $request->price,
                    'drivernote'  => $request->drivernote,
                    'tip'         => $request->tip,
                    'itemtype'    => $request->itemtype,
                    'coupon'      => $request->coupon,
                    'discount'    => $request->discount,
                    'itemphoto'   => $profileImage,
                    'acctype'     => $request->acctype,
                    'finalprice'  => $request->finalprice,
                    'order_no'    => $this->rand_string()
                ]);
                $orderData = DB::table('durapickupshedule')->where('id', $request->pickup_id)->first();
                $tasks_controller = new PushNotificationCommonController;
                $message = " You have placed order successfully with Duradrive at " . date("F j, Y, g:i A");
                $ext = 'placedorder';
                $tasks_controller->postNotification($orderData->user_id, $message, $ext);

                if ($is_update) {
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $is_update], 200);
                } else {
                    return response()->json(['status' => 201, 'message' => 'failed', 'data' => ""], 200);
                }
            } catch (\Exception $e) {
                return response()->json(['message' => $e->getMessage()], 500);
            }
        }
    }
    public function walletpackege(Request $request)
    {
        $data = DB::table('wallerpackage')->get();
        if ($data) {
            return response()->json(['status' => 200, 'message' => 'Success', 'data' => $data], 200);
        } else {
            return response()->json(['status' => 200, 'message' => 'Success', 'data' => ""], 200);
        }
    }

    public function tipprice(Request $request)
    {
        $data = DB::table('tipprice')->get();
        if ($data) {
            //print_r($data);die;
            return response()->json(['status' => 200, 'message' => 'Success', 'data' => $data], 200);
        } else {
            return response()->json(['status' => 200, 'message' => 'Success', 'data' => ""], 200);
        }
    }

    public function finddriver(Request $request)
    {
        /*$pickuplat='28.476570';
        $pickuplon='77.502190';
        $droplat='28.570316';
        $droplon='77.321823';
            $origin = $pickuplat.",".$pickuplon; 
            $destination = $droplat.",".$droplon;
            $api = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=".$origin."&destinations=".$destination."&key=AIzaSyAggbvh490Y3Oa7tVGSKDB6gep-j62ZJls");
            $data = json_decode($api);
            print_r($data);die;*/
        $rules = [
            'pickup_id' => 'required|int',

        ];
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $i = 1;
                while ($i <= 60) {
                    //	usleep(1000000);
                    $data = DB::table('durapickupshedule')->where('id', $request->pickup_id)->first();
                    $ids = [];
                    if (!empty($data)) {
                        //$driverdata = DB::table('driver_current_location')->where('driver_id',2)->get();
                        $driverdata = DB::table('driver_current_location')->get();

                        //print_r($driverdata); 
                        foreach ($driverdata as $drivervalue) {
                            /*$origin = $data->pickuplat.",".$data->pickuplon; 
                        $destination = $drivervalue->latitude.",".$drivervalue->longitude;
                        $api = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=".$origin."&destinations=".$destination."&key=AIzaSyAggbvh490Y3Oa7tVGSKDB6gep-j62ZJls");
                        $data = json_decode($api);
                        print_r($data);die;*/

                            $origin = $data->pickuplat . "," . $data->pickuplon;
                            $destination = $drivervalue->c_lat . "," . $drivervalue->c_log;
                            $api = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" . $origin . "&destinations=" . $destination . "&key=AIzaSyAggbvh490Y3Oa7tVGSKDB6gep-j62ZJls");
                            $data = json_decode($api);
                            $times = @$data->rows[0]->elements[0]->duration->text;
                            //	$km = $this->distance($data->pickuplat, $data->pickuplon, $drivervalue->c_lat, $drivervalue->c_log, "K");
                            //print_r($km); die('------');
                            // $distance = number_format($km, 0, '', '');
                            $tasks_controller = new PushNotificationCommonController;
                            $distance = $tasks_controller->multipleStopDistance($request->pickup_id);
                            if ($distance <= 10000) {

                                $finalData =  array(
                                    'driver_id'     => $drivervalue->id,
                                    'vehicle_id'    => $data->vehicle_id,
                                    'pickup_id'     => $request->pickup_id,
                                    'km'            => $distance,
                                    'time'          => @$times
                                );
                                $item   = DB::table('search_driver')->insertGetId($finalData);
                                array_push($ids, $item);
                            }
                            //i++;
                            //}

                        }
                        $data1 = DB::table('durapickupshedule')->where('id', $request->pickup_id)->first();
                        return response()->json(['status' => 200, 'message' => 'Success', 'data' => $data1], 200);
                    }

                    $i++;
                }
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }
    public function send_driver_request(Request $request)
    {
        $rules = [
            'driver_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                //$IsPresent=DB::table('search_driver')->where('driver_id', $request->driver_id)->orderBy('id','desc')->first();
                $IsPresent = DB::table('search_driver')->orderBy('id', 'desc')->first();
                //print_r($IsPresent);die;
                if ($IsPresent) {
                    $getpickup = DB::table('durapickupshedule')->where('id', $IsPresent->pickup_id)->first();
                    //print_r($getpickup);die;
                    //$is_update=DB::table('cart_items')->where('user_id', $request->user_id)->where('item_id',$IsPresent->item_id)->first();
                    $finalData =  array(
                        'servicetype'       => 'Dura Express',
                        'pickup_id'         => $getpickup->id,
                        'pickup'            => $getpickup->pickup_address1 . $getpickup->pickup_address2,
                        'dropoff'           => $getpickup->destination_address1 . $getpickup->destination_address2,
                        'distance'          => $IsPresent->km,
                        'time'              => $IsPresent->time,
                        'username'          => $getpickup->pickup_name,
                        'pickuplat'         => $getpickup->pickuplat,
                        'pickuplon'         => $getpickup->pickuplon,
                        'destinationlat'    => $getpickup->destinationlat,
                        'destinationlon'    => $getpickup->destinationlon,
                        'pickup_mobile'     => $getpickup->pickup_mobile,
                        'destination_mobile' => $getpickup->destination_mobile,
                        'price'             => $getpickup->price
                    );
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $finalData], 200);
                } else {

                    return response()->json(['status' => 200, 'message' => 'No Data found', 'data' => ""], 200);
                }
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }


    public function driver_current_location(Request $request)
    {
        $rules = [
            'driver_id' => 'required|int',
            'c_lat' => 'required',
            'c_log' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                //$item= DB::table('cart_items')->insertGetId($request->all());
                $is_update = DB::table('driver_current_location')->where('driver_id', $request->driver_id)->Update(['c_lat' => $request->c_lat, 'c_log' => $request->c_log]);
                return response()->json(['status' => 200, 'message' => 'Request updated successfully', 'data' => $is_update], 200);
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }

    // close ----------------------


    public function denied_request(Request $request)
    {
        $rules = [
            'driver_id' => 'required|int',
            'pickup_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $is_update = DB::table('search_driver')->where('driver_id', $request->driver_id)->delete();

                $finalData =  array(
                    'driver_id'     => $request->driver_id,
                    'pickup_id'     => $request->pickup_id,
                    'created_at'   => date('Y-m-d H:i:s')
                );

                $item   = DB::table('driverdecline')->insertGetId($finalData);

                return response()->json(['status' => 200, 'message' => 'Request rejected successfully', 'data' => $is_update], 200);
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }

    public function accept_request(Request $request)
    {
        $rules = [
            'driver_id' => 'required|int',
            'pickup_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                //$item= DB::table('cart_items')->insertGetId($request->all());
                $is_update = DB::table('durapickupshedule')->where('id', $request->pickup_id)->Update(['driver_id' => $request->driver_id, 'status' => $request->status]);
                return response()->json(['status' => 200, 'message' => 'Request rejected successfully', 'data' => $is_update], 200);
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }

    public function get_driver_details(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            'pickup_id' => 'required|int'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            $data = DB::table('durapickupshedule')->where('id', $request->pickup_id)->first();
            $driverdata = DB::table('driveuser')->where('is_online', 1)->get();
            if (!empty($data)) {
                foreach ($driverdata as $drivervalue) {
                    $tasks_controller = new PushNotificationCommonController;
                    $distance = $tasks_controller->multipleStopDistance($request->pickup_id);
                    if ($distance < 500000) {
                        $finalData =  array(
                            'driver_id'     => $drivervalue->id,
                            'vehicle_id'    => $data->vehicle_id,
                            'pickup_id'     => $request->pickup_id,
                            'km'            => $distance,
                            'time'          => '10'
                        );
                        // $item   = DB::table('search_driver')->insertGetId($finalData);    

                    }
                }
            }

            $IsPresent = DB::table('durapickupshedule')->where('user_id', $request->user_id)->where('id', $request->pickup_id)->orderby('id', 'desc')->first();

            if (!empty($IsPresent)) {
                if ($IsPresent->driver_id != 0 && !empty($IsPresent->driver_id)) {
                    //$searchdriver =  DB::table('search_driver')->orderBy('id','desc')->first();
                    $getdriver    =  DB::table('driveuser')->where('id', $IsPresent->driver_id)->first();
                    $destination = $IsPresent->pickuplat . "," . $IsPresent->pickuplon;
                    $origin = $getdriver->latitude . "," . $getdriver->longitude;
                    $map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $origin . "&destinations=" . $destination . "&key=" . env("GOOGLE_KEY") . "";
                    $api = file_get_contents($map);
                    $dataapis = json_decode($api);
                    $times = @$dataapis->rows[0]->elements[0]->duration->value;
                    //echo $times;die("Hello");
                    // if($times==null)
                    // {
                    //     $getdriver    =  DB::table('driveuser')->where('id',5)->first();
                    //     // return response()->json(['status' => 201,'message'=>'No Driver found','data'=>null], 201);
                    // }

                    $finalData    =  array(
                        'drivername'        => $getdriver->firstname . " " . $getdriver->lastname,
                        'driverphoto'       => URL::to('/') . "/public/Media/" . $getdriver->profilephoto_url,
                        'distance'          => $distance,
                        'time'              => @$times,
                        'servicetype'       => 'Dura Express',
                        'price'             => $IsPresent->price,
                        'vehicleno'         => 'UP16T1718'
                    );
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $finalData], 200);
                } else {
                    //$searchdriver =  DB::table('search_driver')->orderBy('id','desc')->first();
                    $getdriver      =  DB::table('driveuser')->where('id', 5)->first();
                    $destination    = $IsPresent->pickuplat . "," . $IsPresent->pickuplon;
                    $origin         = $getdriver->latitude . "," . $getdriver->longitude;
                    $api            = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $origin . "&destinations=" . $destination . "&key=" . env("GOOGLE_KEY") . "");
                    $dataapis       = json_decode($api);
                    //print_r($dataapis);die;
                    $times = @$dataapis->rows[0]->elements[0]->duration->value;
                    // if($times==null)
                    // {
                    //     return response()->json(['status' => 201,'message'=>'No Driver found','data'=>null], 201);
                    // }
                    $finalData    =  array(
                        'drivername'        => $getdriver->firstname . " " . $getdriver->lastname,
                        'driverphoto'       => URL::to('/') . "/public/Media/" . $getdriver->profilephoto_url,
                        'distance'          => $distance,
                        'time'              => @$times,
                        'servicetype'       => 'Dura Express',
                        'price'             => $IsPresent->price,
                        'vehicleno'         => 'UP16T1718'
                    );
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $finalData], 200);
                    //return response()->json(['status' => 201,'message'=>'No Driver found','data'=>null], 201);
                }
            } else {
                return response()->json(['status' => 201, 'message' => 'No request found', 'data' => null], 201);
            }
        }
    }
    public function get_pickup_details(Request $request)
    {
        $rules = [
            'user_id' => 'required|int'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $IsPresent = DB::table('durapickupshedule')->where('user_id', $request->user_id)->where('vehicle_id', '!=', null)->orderby('id', 'desc')->first();
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
                        $api            = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=matrix&origins=" . $origin . "&destinations=" . $destination . "&key=" . env("GOOGLE_KEY") . "");
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
                        $tasks_controller = new PushNotificationCommonController;
                        $distance = $tasks_controller->multipleStopDistance($IsPresent->id);
                        // echo $distance;
                        // die;
                        /*distance by google api end */

                        $totalprice = $distance * $getvehicle->kmfare + $getvehicle->basefare;

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
                        $totalPrices = round($getpickup->finalprice, 0, PHP_ROUND_HALF_UP);
                        $stopcount = DB::table('pickup_stoplocation')->where('pickup_id', $IsPresent->id)->count();
                        /* multiple stop data start*/

                        $getpickup  = DB::table('durapickupshedule')->where('id', $IsPresent->id)->orderby('id', 'desc')->first();
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
                            // $map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" . $origin . "|" . $getstop->stoplat . ',' . $getstop->stoplon . "&destinations=" . $destination . "&key=" . env('GOOGLE_Key') . "";
                            // $api = file_get_contents($map);
                            // $data = json_decode($api);
                        } else {
                            $driverlocationlink = 'https://www.google.com/maps/dir/' . $origin . '/' . $destination;
                            // $map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" . $origin . "&destinations=" . $destination . "&key=" . env('GOOGLE_KEY') . "";
                            // $api = file_get_contents($map);
                            // $data = json_decode($api);
                        }
                        /* multiple stop data end*/
                        // echo $stopget;die;
                        // if ($stopcount > 0) {
                        //     $stopget = DB::table('pickup_stoplocation')->where('pickup_id', $IsPresent->id)->get();
                        //     $stoplocation = array();
                        //     foreach ($stopget as $getstop) {
                        //         $stoplocation[]     = array(
                        //             'stop_address1' => $getstop->stop_address1,
                        //             'stop_address2' => $getstop->stop_address2,
                        //             'stop_name'     => $getstop->stop_name,
                        //             'stop_mobile'   => $getstop->stop_mobile,
                        //             'stoplat'       => $getstop->stoplat,
                        //             'stoplon'       => $getstop->stoplon
                        //         );
                        //     }
                        // }
                        $kmprice = round($distance * $getvehicle->kmfare, 0, PHP_ROUND_HALF_UP);
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
                        $finalData  = array(
                            'servicetype'       => 'Dura Express',
                            'pickup_id'         => $getpickup->id,
                            'order_no'          => $getpickup->order_no,
                            'pickup'            => $getpickup->pickup_address1 . $getpickup->pickup_address2,
                            'stoplocation'      => $getpickup->stop_address1 . $getpickup->stop_address2,
                            'dropoff'           => $getpickup->destination_address1 . $getpickup->destination_address2,
                            'wheretoname'       => $getpickup->destination_name,
                            'wheretomobile'     => $getpickup->destination_mobile,
                            'distance'          => $distance,
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
                            'usermobile'        => @$getusers->phone,
                            'vehicleno'         => 'UP16Y1719',
                            'status'            => @$getpickup->status,
                            'orderdate'         => date('F jS Y \a\t h:i:s A', strtotime($getpickup->pdate)),
                            'driverlocationlink' => $driverlocationlink,
                            //'driverlocationlink'=> 'https://162.241.87.160/duradrive_api/map.html',
                            'coupon'            => @$coupon,
                            'stopdata'          => @$stoplocation
                        );
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
    public function order_details(Request $request){
        $rules = [
            'user_id' => 'required|int',
            'order_id' => 'required|int'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $IsPresent = DB::table('durapickupshedule')->where('id', $request->order_id)->first();
                if ($IsPresent) {
                    $getpickup    =  DB::table('durapickupshedule')->where('id', $IsPresent->id)->first();
                    if ($IsPresent->coupon != null) {
                        $row = DB::table('promocode')->where('name', $IsPresent->coupon)->first();
                        $coupon    =  array(
                            'id'         => $row->id,
                            'couponname' => $row->name,
                            'discount'   => $row->discount,
                            'description' => $row->application,
                            'currency'   => '₱'
                        );
                    }
                    $getusers     =  DB::table('users')->where('id', $request->user_id)->first();
                    $getvehicle   =  DB::table('vehicle')->where('id', $getpickup->vehicle_id)->where('service', 1)->first();
                    $getdriver    =  DB::table('driveuser')->where('id', 5)->first();/*$getpickup->driver_id*/
                    $searchdriver =  DB::table('search_driver')->orderBy('id', 'desc')->first();

                    $origin = $getpickup->pickuplat . "," . $getpickup->pickuplon;
                    $destination = $getpickup->destinationlat . "," . $getpickup->destinationlon;
                    $api = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" . $origin . "&destinations=" . $destination . "&key=" . env('GOOGLE_KEY') . "");
                    $data = json_decode($api);
                    $times = @$data->rows[0]->elements[0]->duration->text;

                    $km = $this->distance($getpickup->pickuplat, $getpickup->pickuplon, $getpickup->destinationlat, $getpickup->destinationlon, "K");
                    $distance = number_format($km, 0, '', '');
                    /*distance by google api start */
                    $tasks_controller = new PushNotificationCommonController;
                    $distance = $tasks_controller->multipleStopDistance($request->order_id);
                    if ($getpickup->tip != '') {
                        $tip = $getpickup->tip;
                    } else {
                        $tip = '0';
                    }
                    $totalPrice = round($getpickup->finalprice, 0, PHP_ROUND_HALF_UP);
                    $services = DB::table('durapickup_services as ds')
                        ->join('pricecard as pc', 'ds.service_id', '=', 'pc.id')
                        ->where('ds.pickup_id', $IsPresent->id)
                        ->select('pc.id', 'pc.services', 'pc.servicefee')
                        ->get();
                    //$data = DB::table('vehicle')->where('service', 1)->get();
                    //print_r($getvehicle);die;
                    //$totalprice = $distance*$getvehicle->kmfare+$getvehicle->basefare;
                    if (!empty($getvehicle)) {
                        $kmprice = round($distance * $getvehicle->kmfare, 0, PHP_ROUND_HALF_UP);
                        $completePrice =  array(
                            'distance'      => $distance,
                            'kmprice'       => $kmprice,
                            'basefare'      => $getvehicle->basefare,
                            'total'         => $totalPrice,
                            'tip'           => $tip,
                            'per_km'        => $getvehicle->kmfare,
                            'services'      => $services,
                            // 'total'         => $getpickup->finalprice,
                            'currency'      => '₱',
                            'surcharge'     => 10
                        );
                    }
                    if ($IsPresent->type != 'later') {
                        $drivername = $getdriver->firstname . " " . $getdriver->lastname;
                        $vehicle    = @$getvehicle->vehicle_type;
                    } else {
                        $drivername = 'No Driver found';
                        $vehicle    = 'No Photo Found';
                    }
                    $stopcount = DB::table('pickup_stoplocation')->where('pickup_id', $IsPresent->id)->count();
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
                        // $map="https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=".$origin."|".$getstop->stoplat.','.$getstop->stoplon."&destinations=".$destination."&key=".env('GOOGLE_Key')."";
                        // $api = file_get_contents($map);
                        // $data = json_decode($api);
                    } else {
                        $driverlocationlink = 'https://www.google.com/maps/dir/' . $origin . '/' . $destination;
                        // $map="https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=".$origin."&destinations=".$destination."&key=".env('GOOGLE_KEY')."";
                        // $api = file_get_contents($map);
                        // $data = json_decode($api);
                    }
                    // echo $driverlocationlink;
                    // die;
                    $finalData  = array(
                        'user_id'           => $request->user_id,
                        'order_id'          => $getpickup->id,
                        'servicetype'       => 'Dura Express',
                        'pickup_id'         => $getpickup->id,
                        'order_no'          => $getpickup->order_no,
                        'pickupdate'        => date('F jS Y \a\t h:i:s A', strtotime($getpickup->pdate)),
                        'pickupaddress'     => $getpickup->pickup_address1 . $getpickup->pickup_address2,
                        'pickupaddresssub'  => $getpickup->pickup_address1 . $getpickup->pickup_address2,
                        'stopaddress'       => $getpickup->stop_address1 . $getpickup->stop_address2,
                        'stopaddresssub'    => $getpickup->stop_address1 . $getpickup->stop_address2,
                        'wheretoaddress'    => $getpickup->destination_address1 . $getpickup->destination_address2,
                        'wheretoaddresssub' => $getpickup->destination_address1 . $getpickup->destination_address2,
                        'wheretoname'       => $getpickup->destination_name,
                        'wheretomobile'     => $getpickup->destination_mobile,
                        'distance'          => $distance,
                        'time'              => @$times,
                        'accounttype'       => $getpickup->acctype,
                        'pickup_name'       => $getpickup->pickup_name,
                        'pickuplat'         => $getpickup->pickuplat,
                        'pickuplon'         => $getpickup->pickuplon,
                        'destinationlat'    => $getpickup->destinationlat,
                        'destinationlon'    => $getpickup->destinationlon,
                        'pickup_mobile'     => $getpickup->pickup_mobile,
                        'destination_mobile' => $getpickup->destination_mobile,
                        'price'             => @$completePrice,
                        'drivername'        => $drivername,
                        'driverphoto'       => URL::to('/') . "/public/Media/" . $getdriver->profilephoto_url,
                        'driver_id'         => @$getdriver->id,
                        'vehicle'           => $vehicle,
                        'username'          => @$getusers->first_name . " " . @$getusers->last_name,
                        'status'            => $getpickup->status,
                        'paymentmode'       => $getpickup->paymentmode,
                        'orderdate'         => date('F jS Y \a\t h:i:s A', strtotime($getpickup->pdate)),
                        'coupon'            => @$coupon,
                        'stopdata'          => @$stoplocation,
                        //'driverlocationlink'=> 'https://www.google.com/maps/dir/'.$origin.'/'.$destination,
                        'driverlocationlink' => $driverlocationlink,
                    );
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $finalData], 200);
                } else {
                    return response()->json(['status' => 200, 'message' => 'No Data found', 'data' => ""], 200);
                }
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }
    public function remove_user_cart(Request $request){
        $rules = [
            'user_id' => 'required|int',
            'item_id' => 'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $IsPresent = DB::table('cart_items')->where('user_id', $request->user_id)->where('item_id', $request['item_id'])->first();
                if ($IsPresent) {
                    $is_update = DB::table('cart_items')->where('user_id', $request->user_id)->where('item_id', $IsPresent->item_id)->delete();
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $is_update], 200);
                } else {
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => ""], 200);
                }
            } catch (\Exception $e) {
                return response()->json(['message' => $e->getMessage()], 500);
            }
        }
    }

    public function update_user_cart(Request $request){
        $rules = [
            'user_id' => 'required|int',
            'item_id' => 'required',
            'qty' => 'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $IsPresent = DB::table('cart_items')
                    ->where('user_id', $request->user_id)
                    ->where('item_id', $request['item_id'])
                    ->first();
                if ($IsPresent) {
                    $is_update = DB::table('cart_items')
                        ->where('user_id', $request->user_id)
                        ->where('item_id', $IsPresent->item_id)
                        ->Update(['qty' => $request->qty]);
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $is_update], 200);
                } else {
                    return response()->json(['status' => 404, 'message' => 'Success', 'data' => $item], 200);
                }
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }
    public function get_user_cart($id){
        if ($id != null) {
            $user_cart = DB::table('cart_items')
                ->where('user_id', $id)
                ->join('products', 'cart_items.item_id', '=', 'products.id')
                ->join('product_gallery', 'products.id', '=', 'product_gallery.product_id')
                ->join('brand', 'products.brand_id', '=', 'brand.id')
                ->get();
            $link = URL::to('/') . "/public/Media/";
            foreach ($user_cart as $item) {
                $item->image = $link . $item->image;
            }
            $data = collect(["status" => "200", "message" => "Success", "data" => $user_cart]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
    public function get_all_user_cart(Request $request){
        $user_cart = DB::table('user_cart')
            ->join('products', 'user_cart.product_id', 'products.id')
            ->join('color', 'products.color_id', 'color.id')
            ->join('product_gallery', 'user_cart.product_id', 'product_gallery.product_id')
            ->get();
            if ($user_cart->count() > 0) {
            foreach ($user_cart as $item) {
                $item->image = 'https://' . $request->server->get('SERVER_NAME') . "/wmc_admin/public/product_image/" . $item->image;
            }
        }
        $data = collect(["status" => "200", "message" => "Success", "data" => $user_cart]);
        return response()->json($data, 200);
    }
    public function get_user_cart_by_customer_id($id){
        if ($id != null) {
            $user_cart = DB::table('user_cart')->where('user_id', $id)->first();
            if (!$user_cart) {
                $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                return response()->json($data, 200);
            }
            $user_items = DB::table('cart_items')->where('cart_id', $user_cart->id)->get();
            $data = collect(["status" => "200", "message" => "Success", "data" => $user_cart]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
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

    public function rand_string($length = 10){
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
    public function addaddress(Request $request){
        $rules = [
            'user_id' => 'required|int'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                if ($request->isdefault == 1) {
                    $finalData =    array('isdefault' => '0');
                    $is_update = DB::table('useraddress')->where('user_id', $request->user_id)->update($finalData);
                }
                $item = DB::table('useraddress')->insertGetId($request->all());
                return response()->json(['status' => 200, 'message' => 'Success', 'data' => $item], 200);
            } catch (\Exception $e) {
                print_r($e);
                return response()->json(['message' => 'Something went wrong.Please try again!'], 404);
            }
        }
    }
    public function paymentmode(Request $request){
        $rules = [
            'pickup_id' => 'required|int',
            'paymentmode' => 'required',
            'user_id' => 'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $checkbalance = DB::table('wallet_recharge')->where('user_id', $request->user_id)->orderBy('id', 'desc')->first();
                $durapickupsheduleData = DB::table('durapickupshedule')->where('id', $request->pickup_id)->first();

                // //if(isset($request->price) && $checkbalance->amount>=$request->price)
                // {
                //     $price = $checkbalance->amount-$request->price;
                //     $finalData =  array(
                //         'transactiontype' => 'sheduled',
                //         'user_id'      => $request->user_id,
                //         'amount'       => $price,
                //         'method'       => 'debit',
                //         'phone'        => '0',
                //         'change_amount'=> $request->price,
                //         'transactionid'=> $this->rand_string(),
                //         'created_at'   => date('Y-m-d H:i:s')
                //         );

                //     $item   = DB::table('wallet_recharge')->insertGetId($finalData);    


                // }else{
                //     return response()->json(['status' => 201,'message'=>'Wallet amount is not sufficient'], 201);
                // }
                if ($request->paymentmode == 'COD') {
                    return response()->json(['status' => 200, 'message' => 'Success'], 200);
                } else {
                    $price = $checkbalance->amount - $request->price;
                    $finalData =  array(
                        'transactiontype' => 'sheduled',
                        'user_id'      => $request->user_id,
                        'amount'       => $price,
                        'method'       => 'debit',
                        'phone'        => '0',
                        'change_amount' => $request->price,
                        'transactionid' => $durapickupsheduleData->order_no,
                        'created_at'   => $durapickupsheduleData->pdate
                    );
                    $item   = DB::table('wallet_recharge')->insertGetId($finalData);
                    $is_update = DB::table('durapickupshedule')->where('id', $request->pickup_id)->update(['paymentmode' => $request->paymentmode]);
                    return response()->json(['status' => 200, 'message' => 'Success'], 200);
                }
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }

    public function wallet_history(Request $request){
        $rules = [
            'user_id' => 'required|int'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            $walletRechargeData = DB::table('wallet_recharge')->where('user_id', $request->user_id)->orderBy('id', 'desc')->get();
            $data = array();
            foreach ($walletRechargeData as $history) {
                $array = array(
                    'id' => $history->id,
                    'transactionid' => $history->transactionid,
                    'transactiontype' => $history->transactiontype,
                    'user_id' => $history->user_id,
                    'phone' => $history->phone,
                    'method' => $history->method,
                    'amount' => $history->amount,
                    'change_amount' => $history->change_amount,
                    'description' => $history->description,
                    'created_at' => date('F jS Y \a\t h:i:s A', strtotime($history->created_at)),
                    'updated_at' => $history->created_at,
                );
                array_push($data, $array);
            }
            if ($data) {
                //$data->currency = '₱';
                return response()->json(['status' => 200, 'message' => 'Success', 'data' => $data], 200);
            } else {
                return response()->json(['status' => 201, 'message' => 'Not found'], 201);
            }
        }
    }

    public function cancel_details(Request $request){
        $rules = [
            'pickup_id' => 'required|int',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            $pickupsheduleData = DB::table('durapickupshedule')->where('id', $request->pickup_id)->first();
            $data       = array(
                'user_id'    => $request->user_id,
                'driver_id'  => $request->driver_id,
                'pickup_id'  => $request->pickup_id,
                'canceledby' => $request->canceledby,
                'reason'     => $request->reason
            );
            $item = DB::table('shedulecancel')->insertGetId($data);
            $is_update = DB::table('durapickupshedule')->where('id', $request->pickup_id)->update(['status' => '4', 'price' => '0', 'tip' => '0', 'finalprice' => '0']);
            /*Return start*/
            $walletData   = DB::table('wallet_recharge')->where('user_id', $request->user_id)->orderBy('id', 'DESC')->first();
            $returnAmount = $walletData->amount + $pickupsheduleData->finalprice;
            $recharge = DB::table('wallet_recharge')->insert([
                'transactionid'     => $pickupsheduleData->order_no,
                'transactiontype'   => 'cancle',
                'user_id'           => $pickupsheduleData->user_id,
                'phone'             => '0',
                'method'            => 'credit',
                'amount'            => $returnAmount,
                'change_amount'     => $pickupsheduleData->price,
                'description'       => 'Refund for cancel order',
                'created_at'        => date("Y-m-d H:i:s"),
                'updated_at'        => date("Y-m-d H:i:s")
            ]);
            /*Return end*/
            if ($item) {
                return response()->json(['status' => 200, 'message' => 'Success'], 200);
            } else {
                return response()->json(['status' => 201, 'message' => 'Not found'], 201);
            }
        }
    }
    public function testotp(Request $request){
        $secret = env('TWILIO_FROM');    // APP fixed key, inget itunes

        $POSTFIELDS = array("To" => '+917905848385', 'MessagingServiceSid' => $secret, 'Body' => 'test messages');
        $POSTFIELDS = json_encode($POSTFIELDS);

        //Official purchase address Sandbox purchase address
        $url   = "https://api.twilio.com/2010-04-01/Accounts/ACa5851aee43962b30a9f5f6d56bf09b09/Messages.json";
        //$url = "https://sandbox.itunes.apple.com/verifyReceipt";

        //Simple curl
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $POSTFIELDS);
        $result = curl_exec($ch);
        curl_close($ch);

        //$html = acurl($receipt_data);
        $data = json_decode($result);
    }

    /*curl 'https://api.twilio.com/2010-04-01/Accounts/ACa5851aee43962b30a9f5f6d56bf09b09/Messages.json' -X POST \
--data-urlencode 'To=+917979948924' \
--data-urlencode 'MessagingServiceSid=+13176997248' \
--data-urlencode 'Body=test mesdgs' \
-u ACa5851aee43962b30a9f5f6d56bf09b09:efbacf5eca58f1f8385a914ebda8838c*/

    public function user_driverrequest(Request $request)
    {
        $rules = [
            'user_id' => 'required|int'
        ];

        $validator = Validator::make($request->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['status' => 422, 'message' => $validator->messages()], 200);
        } else {
            try {
                $IsPresent = DB::table('driver_request')->where('user_id', $request->user_id)->first();
                if ($IsPresent) {
                    return response()->json(['status' => 200, 'message' => 'You have already requested'], 201);
                } else {
                    $item = DB::table('driver_request')->insertGetId($request->all());
                    return response()->json(['status' => 200, 'message' => 'Success'], 200);
                }
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }

    public function getdistance(Request $request)
    {
        $pickuplat = '28.476570';
        $pickuplon = '77.502190';
        $droplat = '28.570316';
        $droplon = '77.321823';
        $origin = $pickuplat . "," . $pickuplon;
        $destination = $droplat . "," . $droplon;
        $api = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" . $origin . "&destinations=" . $destination . "&key=AIzaSyAggbvh490Y3Oa7tVGSKDB6gep-j62ZJls");
        $data = json_decode($api);
        print_r($data->rows[0]->elements[0]->duration->text);
        die;
    }
}
