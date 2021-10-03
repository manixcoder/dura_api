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
class WarehouseController extends Controller
{
    public function get_warehouse_info(Request $request)
    {
       
            $addData = DB::table('warehouse')->get();
            $newArr=array();
          foreach ($addData as $value) {
            $current = DB::table('product_stock')->where('warehouse_id',$value->id)->sum('stock');
           $x[]= array('warehouse_id'=>$value->id,'warehouse_color_code'=>$value->warehouse_color_code,'warehouse_name'=>$value->warehouse_name,'available_stock'=>$current);
            }
          
            $data = collect(["status" => "200", "message" => "Success", "data" => $x]);
                return response()->json($data, 200);

    }
    
    public function get_warehouse_info_by_id($id)
    {
       
            $addData = DB::table('product_stock')->where('warehouse_id',$id)->join('products', 'product_stock.product_id', '=', 'products.id')->get();
            foreach ($addData as $value) 
            {
                $current = DB::table('product_gallery')->where('product_id',$value->product_id)->get();
                $x[]= array('item'=>$value,'images'=>$current);
            }
          
            $data = collect(["status" => "200", "message" => "Success", "data" => $x]);
             return response()->json($data, 200);

    }
    
    public function get_stock_items_by_warehouse_id(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'warehouse_id' => 'required|integer',
            'brand_id'=>'required|integer'
            ]);
        if ($validator->fails()) {
                return response()->json(['StatusCode' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 200);
            }
            else{
                 if($request->brand_id==0)
                 {
                      $addData = DB::table('product_stock')->where('warehouse_id',$request->warehouse_id)
                             ->Join('products', 'product_stock.product_id', '=', 'products.id')
                             ->Join('color', 'products.color_id', '=', 'color.id')
                             ->Join('category', 'products.category_id', '=', 'category.id')->get();
                             
                              $x=array();
                 foreach ($addData as $value) {
                    $current = DB::table('product_gallery')->where('product_id',$value->product_id)->get()->first();
                    $value=(array)$value;
                    if(isset($current->image))
                    {
                        $value['image']='https://'.$request->server->get('SERVER_NAME')."/wmc_admin/public/product_image/".$current->image;    
                    }
                    
                    $x[]=$value;
                        //$x[]= array('item'=>$value,'image'=>$current);
                    }
                             
                               $data = collect(["status" => "200", "message" => "success", "data" =>$x]);
                              return response()->json($data, 200);
                 }
                 $addData = DB::table('product_stock')->where('warehouse_id',$request->warehouse_id)
                 ->Join('products', 'product_stock.product_id', '=', 'products.id')
                 ->Join('color', 'products.color_id', '=', 'color.id')
                 ->Join('category', 'products.category_id', '=', 'category.id')
                 ->Join('brand', 'products.brand_id', '=', 'brand.id')->where('products.brand_id',$request->brand_id)->get();
               //dd($addData);
                 if(!$addData)
                 {
                       $data = collect(["status" => "200", "message" => "Success", "data" =>array()]);
                      return response()->json($data, 200);
                 }
                 $x=array();
                 foreach ($addData as $value) {
                    $current = DB::table('product_gallery')->where('product_id',$value->product_id)->get()->first();
                    $value=(array)$value;
                    if(isset($current->image)){
                        $value['image']='https://'.$request->server->get('SERVER_NAME')."/wmc_admin/public/product_image/".$current->image;    
                    }
                    
                    $x[]=$value;
                        //$x[]= array('item'=>$value,'image'=>$current);
                    }
                $data = collect(["status" => "200", "message" => "Success", "data" => $x]);
                return response()->json($data, 200);
             }
            

    }
}

?>