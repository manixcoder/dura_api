<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Track;
use App\Alarm_create;
use App\Templates;
use  App\User;
use DB;
use Hash;
class CustomerController extends Controller
{
     
    public function create_customer(Request $request)
    {
        $rules = [
           
        ];
        $validator = Validator::make($request ->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
        } else 
        {
               try 
                {
                     $addData = DB::table('customer')->insertGetId($request->all()); 
        
                    $data = collect(["status" => "100", "message" => "Success", "data" => $addData]);
                    return response()->json($data, 200);
    
            } catch (\Exception $e) {
                return response()->json(['message' => $e], 409);
            }
        }
    }
    
    public function get_customer($id){
       if($id!=null){
            $customer = DB::table('customer')->where('id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $customer]);
                    return response()->json($data, 200);
       }
       else{
             $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                    return response()->json($data, 200);
       }
    }
    
    
     public function get_all_customer(Request $request){
      
            $customer = DB::table('customer')->get();
            $data = collect(["status" => "200", "message" => "Success", "data" => $customer]);
                    return response()->json($data, 200);
    }
    
    
     public function update_customer(Request $request){
       if($request->id!=null){
            $customer = DB::table('customer')->where('id', $request->id)->update($request->all());
            $data = collect(["status" => "200", "message" => "Success", "data" => $customer]);
                    return response()->json($data, 200);
       }
       else{
             $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                    return response()->json($data, 200);
       }
       
    }
    public function upload_image(Request $request)
    {
            $validator = Validator::make($request->all(), [
            'file' => 'required|max:10280'
            ]);
            
             if ($validator->fails()) {
                return sendCustomResponse($validator->messages()->first(),  'error', 500);
             }
            //  $file = $request->file('file');
            //  $ext=explode('.',$file->getClientOriginalName())[1];
            //  $file_name1=uniqid('file').'.'.$ext;  
            //  $file->move('public/Media/', $file_name1);
            $interestedValues=array();
            if($file = $request->file('file')) {
                $destinationPath = base_path('public/Media/');
                $profileImage = uniqid('file') . "-" . $file->getClientOriginalName();
                $path = $file->move($destinationPath, $profileImage);
                $data = collect(["status" => "200", "message" => "Success", "data" => $profileImage]);
                return response()->json($data, 200);
            }
          
    }
    
}
?>