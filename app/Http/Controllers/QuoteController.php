<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Track;
use App\Alarm_create;
use App\Templates;
use App\User;
use DB;
use Hash;
class QuoteController extends Controller
{
    public function create_quote(Request $request)
    {
     $rules = [
            'lowest_price' => 'required|numeric',
            'product_id' => 'required|integer',
        ];
        $validator = Validator::make($request ->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
        } 
        else 
        {
               try 
            {
                     $addData = DB::table('quote')->insertGetId($request->all()); 
        
                    $data = collect(["status" => "100", "message" => "Success", "data" => $addData]);
                    return response()->json($data, 200);
    
            } catch (\Exception $e) {
                return response()->json(['message' => $e], 409);
            }
        }
    }
    
    public function get_quote($id){
       if($id!=null){
            $quote = DB::table('quote')->where('id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $quote]);
                    return response()->json($data, 200);
       }
       else{
             $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                    return response()->json($data, 200);
       }
    }
    
    
     public function get_all_quote(Request $request){
      
            $quote = DB::table('quote')->join('products','quote.product_id','products.id')->join('color','products.color_id','color.id')->join('product_gallery','quote.product_id','product_gallery.product_id')->get();
            
             if($quote->count()>0)
            {
                foreach($quote as $item){
                    $item->image='https://'.$request->server->get('SERVER_NAME')."/wmc_admin/public/product_image/".$item->image;
                }
                
            }
                
            $data = collect(["status" => "200", "message" => "Success", "data" => $quote]);
                    return response()->json($data, 200);
    }
    
     public function get_quote_by_customer_id($id){
        if($id!=null){
            $quote = DB::table('quote')->where('id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $quote]);
                    return response()->json($data, 200);
       }
       else{
             $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                    return response()->json($data, 200);
       }
    }
    
     public function update_quote(Request $request){
       if($request->id!=null){
            $quote = DB::table('quote')->where('id', $request->id)->update($request->all());
            $data = collect(["status" => "200", "message" => "Success", "data" => $quote]);
                    return response()->json($data, 200);
       }
       else{
             $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                    return response()->json($data, 200);
       }
       
    }
}

?>