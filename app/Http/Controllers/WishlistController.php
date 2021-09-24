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
class WishlistController extends Controller
{
    public function add_to_user_wishlist(Request $request)
    {
     $rules = [
            'user_id' => 'required|int',
            'item_id'=>'required'
        ];
       
        $validator = Validator::make($request ->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
        } 
        else 
        {
            try 
            { 
                $IsPresent=DB::table('wishlist')->where('user_id', $request->user_id)->where('item_id',$request['item_id'])->first();
                if($IsPresent)
                {
                     return response()->json(['StatusCode' => 200,'message'=>'Already added','data'=>null], 200);
                }
                else
                {
                    $item= DB::table('wishlist')->insertGetId($request->all());
                    return response()->json(['StatusCode' => 200,'message'=>'Success','data'=>$item], 200);
                }
              
            } 
            catch (\Exception $e) 
            {
              //dd($e);
                return response()->json(['message' => $e], 500);
            }
        }
    }
    public function remove_user_wishlist(Request $request)
    {
     $rules = [
            'user_id' => 'required|int',
            'item_id'=>'required'
        ];
       
        $validator = Validator::make($request ->all(), $rules);


        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
        } 
        else 
        {
            try 
            { 
                $IsPresent=DB::table('wishlist')->where('user_id', $request->user_id)->where('item_id',$request['item_id'])->first();
                if($IsPresent)
                {
                    $is_update=DB::table('wishlist')->where('user_id', $request->user_id)->where('item_id',$IsPresent->item_id)->delete();
                   return response()->json(['StatusCode' => 200,'message'=>'Success','data'=>$is_update], 200);
                }
                else
                {
                    return response()->json(['StatusCode' => 200,'message'=>'Not found','data'=>null], 200);
                }
              
            } catch (\Exception $e) {
              //dd($e);
                return response()->json(['message' => $e], 500);
            }
        }
    }
    
    public function get_user_wishlist($id){
       if($id!=null)
       {
            $user_cart = DB::table('cart_items')->where('user_id', $id)->join('products','cart_items.item_id','=','products.id')->join('product_gallery','products.id','=','product_gallery.product_id')->join('brand','products.brand_id','=','brand.id')->get();
             $link = "https://162.241.87.160/wmc_admin/public/product_image/";
            foreach($user_cart as $item)
            {
                $item->image=$link.$item->image;
            }
            $data = collect(["status" => "200", "message" => "Success", "data" => $user_cart]);
                    return response()->json($data, 200);
       }
       else{
             $data = collect(["status" => "404", "message" => "not found", "data" =>null ]);
             return response()->json($data, 200);
       }
    }
    
    
    public function get_user_wishlist_by_customer_id(Request $request,$id){
         
        if($id!=null){
            
            $user_cart = DB::table('wishlist')->where('user_id', $id)->get();
            $array_out=array();
            foreach($user_cart as $item)
            {
                //$item->image=$link.$item->image;
                $product = DB::table('products')
                ->leftJoin('product_gallery', 'products.id', '=', 'product_gallery.product_id')
                ->where('products.id', $item->item_id)
                ->select('products.product_name','product_gallery.image','products.unit_price')
                ->first();
                //print_r($product);die;
                $array_out[]=array('user_id'=>$item->user_id,'product_name'=>$product->product_name,'image'=>'https://'.$request->server->get('SERVER_NAME')."/wmc_admin/public/product_image/".$product->image,'unit_price'=>$product->unit_price,'item_id'=>$item->item_id,);
            }
            
            if(!$array_out)
            {
                $data = collect(["status" => "404", "message" => "not found", "data" => null]);
                return response()->json($data, 200);
            }
            
                $data = collect(["status" => "200", "message" => "Success", "data" => $array_out]);
                return response()->json($data, 200);
        }
        else{
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
    
}

?>