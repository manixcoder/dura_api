<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\PushNotificationCommonController;
use App\Track;
use App\Alarm_create;
use App\Templates;
use App\User;
use DB;
use Hash;
use URL;
class OrdersController extends Controller
{
    public function __construct(){
        //error_reporting(0);
    }
    public function place_order_with_address (Request $request)
    {
        $today = date("Ymd");
        $rand = strtoupper(substr(uniqid(sha1(time())),0,4));
        $uniqueOrderId = $today . $rand;
        
        if($request->orderData){
            foreach($request->orderData as $orderdata) {
                $rules = [
                    'order_item_id' => 'required|integer',
                    'user_id' => 'required|integer',
                ];
                
                $validator = Validator::make($orderdata, $rules);

                if ($validator->fails()) {
                    return response()->json(['StatusCode' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
                }else {
                    try{
                        $data = array(
                            'order_id'=>$uniqueOrderId,
                            'order_item_id'=>$orderdata['order_item_id'],
                            'user_id'=>$orderdata['user_id'],
                            'payment_status'=>$orderdata['payment_status'],
                            'order_total'=>$orderdata['order_total'],
                            'order_subtotal'=>$orderdata['order_subtotal'],
                            'total_tax'=>$orderdata['total_tax'],
                            'item_tax'=>$orderdata['item_tax'],
                            'item_discount'=>$orderdata['item_discount'],
                            'total_discount'=>$orderdata['total_discount'],
                            'order_type'=>$orderdata['order_type'],
                            'payment_id'=>$orderdata['payment_id'],
                            'item_total'=>$orderdata['item_total'],
                        );
                        $addOrderData = DB::table('orders')->insertGetId($data);
                    } catch (\Exception $e) {
                        return response()->json(['message' => $e], 409);
                    }     
                }
            }
        }   
        if($request->OrderBillingAddress) {
            $data = $request->OrderBillingAddress;
            $rules = [
                'user_id' => 'required|integer',
                'first_name' => 'required|string',
                'last_name' => 'required|string',
                'email' => 'required|string',
                'address_line1' => 'required|string',
                'contact_number1' => 'required|integer',
                'town' => 'required|string',
                'state' => 'required|string',
                'country' => 'required|string',
            ];
                
            if ($validator->fails()) {
                return response()->json(['StatusCode' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
            } 
            else  {
                $addressdataforuser = array(
                    'order_id'=>$uniqueOrderId,
                    'user_id'=>$data['user_id'],
                    'first_name'=>$data['first_name'],
                    'last_name'=>$data['last_name'],
                    'email'=>$data['email'],
                    'contact_number1'=>$data['contact_number1'],
                    'address_line1'=>$data['address_line1'],
                    'address_line2'=>$data['address_line2'],
                    'town'=>$data['town'],
                    'state'=>$data['state'],
                    'country'=>$data['country']
                );
                try  {
                    $addData = DB::table('user_addresses')->insertGetId($addressdataforuser);
                    $product_order = DB::table('orders')->where('order_id', $uniqueOrderId)->first();
                    $data = collect(["status" => "100", "message" => "Success", "orderId" => $product_order->id]);
                    return response()->json($data, 200);
                } 
                catch (\Exception $e)  {
                    return response()->json(['message' => $e], 409);
                }
            } 
        }
    }
    
    public function create_product_order(Request $request)
    {
        $rules = [
            'customer_id' => 'required|integer'
        ];
        $validator = Validator::make($request ->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
        } 
        else 
        {
           try 
            {
                $addData = DB::table('orders')->insertGetId($request->all()); 
                $data = collect(["status" => "100", "message" => "Success", "data" => $addData]);
                return response()->json($data, 200);
            } 
            catch (\Exception $e) 
            {
                return response()->json(['message' => $e], 409);
            }
        }                       
    }
    
    public function get_product_order($id)
    {
        if($id!=null){
            $product_order = DB::table('orders')->where('id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $product_order]);
                    return response()->json($data, 200);
        }
        else{
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                    return response()->json($data, 200);
        }
    }
    
    public function orderByuserid($id)
    {
        if($id!=null){
            //$product_order = DB::table('orders')->where('user_id', $id)->orderBy('id', 'DESC')->get();
            $product_order = DB::table('orders')
                            ->join('products', 'products.id', '=', 'orders.order_item_id')
                            ->select('orders.*', 'products.*','orders.id as id')
                            ->where('orders.user_id', $id)
                            ->orderBy('orders.id', 'DESC')->get();
                            
            $data = collect(["status" => "200", "message" => "Success", "data" => $product_order]);
            return response()->json($data, 200);
        }
        else{
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
    
    public function get_product_order_by_order_type(Request $request)
    {
        
        $rules = [
            'order_type' => 'required|string'
        ];
        $validator = Validator::make($request ->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
        } 
        
        if($id!=null){
            $product_order = DB::table('orders')->where('id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $product_order]);
                    return response()->json($data, 200);
        }
        else
        {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                    return response()->json($data, 200);
        }
    }
    
    public function get_all_product_order(Request $request)
    {
      
        $product_order = DB::table('orders')->Join('products','orders.order_item_id','products.id')->Join('customer','orders.user_id','customer.id')->Join('product_gallery','products.id','product_gallery.product_id')->join('color', 'color.id', '=', 'products.color_id')->get();
           foreach($product_order as $item)
           {
              $item->image='https://'.$request->server->get('SERVER_NAME')."/wmc_admin/public/product_image/".$item->image;
           }
        $data = collect(["status" => "200", "message" => "Success", "data" => $product_order]);
                return response()->json($data, 200);
    }
    
    public function get_product_order_by_customer_id($id)
    {
        if($id!=null){
            $product_order = DB::table('product_order')->where('customer_id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $product_order]);
                    return response()->json($data, 200);
        }
        else{
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                    return response()->json($data, 200);
        }
    }
    
    public function update_product_order(Request $request)
    {
        if($request->id!=null){
            $product_order = DB::table('product_order')->where('id', $request->id)->update($request->all());
            $data = collect(["status" => "200", "message" => "Success", "data" => $product_order]);
                    return response()->json($data, 200);
        }
        else{
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                    return response()->json($data, 200);
        }
       
    }
    
    public function update_orderpayment_status(Request $request)
    {
        if($request->order_id!=null){
            $product_order = DB::table('orders')->where('id', $request->order_id)->update(array("payment_status"=>$request->payment_status));
            $data = collect(["status" => "200", "message" => "Success", "data" => $product_order]);
                    return response()->json($data, 200);
        }
        else{
             $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                    return response()->json($data, 200);
        }
       
    }
    
    public function place_order(Request $request)
    {
       
        $rules = [
            'user_id' => 'required|integer'
        ];
        $validator = Validator::make($request ->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
        }
        else{
             $data = collect(["status" => "200", "message" => "Order placed", "data" => 9283]);
                    return response()->json($data, 200);
        }
       
    }
    
    public function order_details_ByUser_id(Request $request)
    {
        $rules = [
            'user_id' => 'required|int',
            'page_id' => 'required|int',
            'totalcount' => 'required|int',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['status' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $IsPresent = DB::table('durapickupshedule')->where('user_id', $request->user_id)->where('driver_id', '!=', 0)->where('vehicle_id', '!=', null)->orderby('id', 'desc')->count();
                
                if ($request->status != "") {
                    $IsPresent = DB::table('durapickupshedule')->where('user_id', $request->user_id)->where('status', $request->status)->orderby('id', 'desc')->count();
                }
                if ($IsPresent > 0) {
                    $offset = ($request->page_id - 1) * $request->totalcount;
                    $driver = 0;
                    $order_no='1';
                    $IsPresent = DB::select("select * from durapickupshedule WHERE user_id=".$request->user_id." AND driver_id !=" .$driver. "  AND order_no !=" .$order_no. " AND status=".$request->status. " ORDER BY id DESC limit ".$offset. ",". $request->totalcount);
                    if(count($IsPresent) > 0){
                    
                    foreach ($IsPresent as $ispresent) {
                        $getpickup    =  DB::table('durapickupshedule')
                        ->where('id', $ispresent->id)
                        ->where('order_no', '!=', 1)
                        ->where('vehicle_id', '!=', null)
                        ->first();
                        if ($ispresent->coupon != null) {
                            $row = DB::table('promocode')
                            ->where('name', $ispresent->coupon)
                            ->first();
                            $coupon    =  array(
                                'id' => $row->id,
                                'couponname' => $row->name,
                                'discount'   => $row->discount,
                                'description' => $row->application,
                                'currency'   => '₱'
                            );
                        }
                        $getusers     =  DB::table('users')
                        ->where('id', $request->user_id)
                        ->first();
                        $getvehicle   =  DB::table('vehicle')
                        ->where('id', $getpickup->vehicle_id)
                        //->where('service', 1)
                        ->first();
                        $getdriver    =  DB::table('driveuser')
                        ->where('id', $ispresent->driver_id)
                        ->first();
                        // $searchdriver =  DB::table('search_driver')
                        // ->orderBy('id', 'desc')
                        // ->first();
                        $origin = $getpickup->pickuplat . "," . $getpickup->pickuplon;
                        $destination = $getpickup->destinationlat . "," . $getpickup->destinationlon;
                        $api = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" . $origin . "&destinations=" . $destination . "&key=" . env('GOOGLE_KEY') . "");
                        $data = json_decode($api);
                        $times = @$data->rows[0]->elements[0]->duration->text;
                        $km = $this->distance($getpickup->pickuplat, $getpickup->pickuplon, $getpickup->destinationlat, $getpickup->destinationlon, "K");
                        $distance = number_format($km, 0, '', '');
                        /*distance by google api*/
                        $tasks_controller = new PushNotificationCommonController;
                        $distance = $tasks_controller->multipleStopDistance($getpickup->id);
                        $kmfare = @$getvehicle->kmfare;
                        $basefare = $getvehicle->basefare;
                        $vehicle_type = $getvehicle->vehicle_type;
                        $totalprice = $distance * $kmfare + $basefare;
                        if ($getpickup->tip != '') {
                            $tip = $getpickup->tip;
                        } else {
                            $tip = '0';
                        }
                        $totalPrice = $getpickup->finalprice;
                        $services = DB::table('durapickup_services as ds')
                            ->join('pricecard as pc', 'ds.service_id', '=', 'pc.id')
                            ->where('ds.pickup_id', $ispresent->id)
                            ->select('pc.id', 'pc.services', 'pc.servicefee')
                            ->get();

                        // $completePrice =  array(
                        //     'distance'      => $distance,
                        //     'kmprice'       => $distance * $kmfare,
                        //     'basefare'      => $basefare,
                        //     //'total'         => $getpickup->finalprice,
                        //     'total'         => $totalPrice,
                        //     'tip'           => $tip,
                        //     'per_km'        => $kmfare,
                        //     'services'      => $services,
                        //     'currency'      => '₱',
                        //     'surcharge'     => 10
                        // );
                        $tasks_controller = new PushNotificationCommonController;
                        $completePrice = $tasks_controller->orderPriceBreakdown($ispresent->id);

                        if ($getpickup->paymentmode != 'cod' && $getpickup->paymentmode != null) {
                            $paid = 'pending';
                        } else {
                            $paid = 'paid';
                        }

                        $stopcount = DB::table('pickup_stoplocation')
                        ->where('pickup_id', $ispresent->id)
                        ->count();
                        //echo $stopcount;die;
                        if ($stopcount > 0) {
                            $stopget = DB::table('pickup_stoplocation')
                            ->where('pickup_id', $ispresent->id)
                            ->get();
                            $stoplocation = array();
                            $stoplocations = '';
                            foreach ($stopget as $getstop) {
                                $stoplocation[] = array(
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
                            $driverlocationlink = 'https://www.google.com/maps/dir/' . $origin . '/' . $getstop->stoplat . ',' . $getstop->stoplon . $stoplocations . '/' . $destination;
                            $map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" . $origin . "|" . $getstop->stoplat . ',' . $getstop->stoplon . "&destinations=" . $destination . "&key=" . env('GOOGLE_KEY') . "";
                            $api = file_get_contents($map);
                            $data = json_decode($api);
                        } else {
                            $driverlocationlink = 'https://www.google.com/maps/dir/' . $origin . '/' . $destination;
                            $map = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" . $origin . "&destinations=" . $destination . "&key=" . env('GOOGLE_KEY') . "";
                            $api = file_get_contents($map);
                            $data = json_decode($api);
                        }
                        $finalData[]  = array(
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
                            'accounttype'       => $getpickup->itemtype,
                            'pickup_name'       => $getpickup->pickup_name,
                            'pickuplat'         => $getpickup->pickuplat,
                            'pickuplon'         => $getpickup->pickuplon,
                            'destinationlat'    => $getpickup->destinationlat,
                            'destinationlon'    => $getpickup->destinationlon,
                            'pickup_mobile'     => $getpickup->pickup_mobile,
                            'destination_mobile' => $getpickup->destination_mobile,
                            'price'             => $completePrice,
                            'drivername'        => $getdriver->firstname . " " . $getdriver->lastname,
                            'driverphoto'       => URL::to('/') . "/public/Media/" . $getdriver->profilephoto_url,
                            'drivermobile'        => $getdriver->mobile,
                            "driverdescription"=> "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s",
                            'driver_id'         => @$getdriver->id,
                            'vehicle'           => $vehicle_type,
                            'username'          => @$getusers->first_name . " " . @$getusers->last_name,
                            'status'            => $getpickup->status,
                            'paymentmode'       => $getpickup->paymentmode,
                            'paidstatus'        => $paid,
                            'orderdate'         => date('F jS Y \a\t h:i:s A', strtotime($getpickup->pdate)),
                            'coupon'            => @$coupon,
                            'stopdata'          => @$stoplocation,
                            'driverlocationlink' => $driverlocationlink, 
                        );
                    }
                    return response()->json(['status' => 200, 'message' => 'Success', 'data' => $finalData], 200);
                    }else{
                    return response()->json(['status' => 201, 'message' => 'No Data found', 'data' => ""], 201);  
                    }
                    
                } else {
                    return response()->json(['status' => 201, 'message' => 'No Data found', 'data' => ""], 201);
                }
            } catch (\Exception $e) {
                dd($e);
                // return response()->json(['message' => $e], 500);
            }
        }
    }
    
    public function distance($lat1, $lon1, $lat2, $lon2, $unit)
    {
        if (($lat1 == $lat2) && ($lon1 == $lon2)) {
            return 0;
        }
        else {
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

?>