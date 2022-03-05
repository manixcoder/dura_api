<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Track;
use App\Alarm_create;
use App\Templates;
use  App\User;
use DB;
use Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use League\Flysystem\Filesystem;
use League\Flysystem\Adapter\Local;
use URL;

class ProductController extends Controller
{
    public function get_color_by_brand_varient(Request $request)
    {
        $rules = [
            'brand_id' => 'required|integer',
            'varient' => 'required|string',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $product = DB::table('products')
                    ->join('color', 'color.id', '=', 'products.color_id')
                    ->where('products.brand_id', $request->brand_id)
                    ->where('products.variant', $request->varient)
                    ->distinct(['products.color_id'])
                    ->select('color.color_name', 'color.id')
                    ->get();

                if (sizeof($product) > 0) {
                    $data = collect(["StatusCode" => "200", 'Status' => 'Success', "message" => "Data Get Successfully", "data" => $product]);
                    return response()->json($data, 200);
                } else {
                    return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => "Data not found..!"], 409);
                }
            } catch (\Exception $e) {
                return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $e], 409);
            }
        }
    }

    public function get_product_by_brand_varient_color(Request $request)
    {
        $rules = [
            'brand_id' => 'required|integer',
            'color_id' => 'required|integer',
            'varient' => 'required|string',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $prosuct = DB::table('products')
                    ->where('color_id', $request->color_id)
                    ->where('brand_id', $request->brand_id)
                    ->where('variant', $request->varient)
                    ->distinct(['variant'])
                    ->first();

                $productStock = DB::table('product_stock')->where('product_id', $prosuct->id)->first();

                if ($productStock != '') {

                    $data = array(
                        'product_id' => $prosuct->id,
                        'stock_id' => $productStock->id,
                        'stock' => $productStock->stock,
                        'price' => $prosuct->unit_price
                    );
                    $data = collect(["StatusCode" => "200", 'Status' => 'Success', "message" => "Data Get Successfully", "data" => $data]);
                    return response()->json($data, 200);
                } else {
                    $data = array(
                        'product_id' => $prosuct->id,
                        'stock' => 0
                    );
                    $data = collect(["StatusCode" => "200", 'Status' => 'Success', "message" => "Data Get Successfully", "data" => $data]);
                    return response()->json($data, 200);
                }
            } catch (\Exception $e) {
                return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => 'Data not found.!'], 409);
            }
        }
    }


    public function search_car(Request $request)
    {
        $rules = [
            'query' => 'required|string'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {

                // $prosuct =DB::table('products')->leftJoin('posts', 'users.id', '=', 'posts.user_id')->where('product_name','LIKE','%'.$request->input('query').'%')->get();
                $product = DB::table('products')
                    ->leftJoin('brand', 'products.brand_id', '=', 'brand.id')->leftJoin('product_gallery', 'products.id', '=', 'product_gallery.product_id')->select('products.*', 'brand.brand_name', 'product_gallery.image')
                    ->where('product_name', 'LIKE', '%' . $request->input('query') . '%')->get();
                if ($product->count() > 0) {
                    foreach ($product as $item) {
                        $item->image = 'https://' . $request->server->get('SERVER_NAME') . "/wmc_admin/public/product_image/" . $item->image;
                    }
                }
                $data = collect(["StatusCode" => "200", 'Status' => 'Success', "message" => "Data Get Successfully", "data" => $product]);
                return response()->json($product, 200);
            } catch (\Exception $e) {
                return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $e->getMessage()], 500);
            }
        }
    }

    public function update_stock(Request $request)
    {

        $rules = [
            'stock_id' => 'required|integer',
            'stock' => 'required|integer',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $updatestock_query = DB::table('product_stock')->where('id', $request->stock_id)->update(['stock' => $request->stock]);
                $data = collect(["StatusCode" => 200,  "message" => "Success"]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(['StatusCode' => 422, "message" => "Failed"], 409);
            }
        }
    }

    public function get_stock_according_to_coloror_barnd(Request $request)
    {
        $rules = [
            'color_id' => 'required|integer',
            'model_id' => 'required|integer',
        ];
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {

            try {
                $PoductStockData = DB::table('products')
                    ->join('color', 'color.id', '=', 'products.color_id')
                    ->join('product_stock', 'product_stock.product_id', '=', 'products.id')
                    ->join('warehouse', 'warehouse.id', '=', 'product_stock.warehouse_id')
                    ->where('product_stock.product_id', $request->model_id)
                    ->where('products.color_id', $request->color_id)
                    ->get(['product_stock.id as stock_id', 'warehouse.warehouse_name', 'products.product_name', 'products.variant', 'color.color_name',  'product_stock.stock', 'product_stock.created_at']);

                if (sizeof($PoductStockData) > 0) {
                    $data = collect(["status" => "100", "message" => "Success", "data" => $PoductStockData]);
                    return response()->json($data, 200);
                } else {
                    $data = collect(["status" => "120", "message" => "Faild"]);
                    return response()->json($data, 200);
                }
            } catch (\Exception $e) {
                print_r($e);
                die;
                return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => 'Data Not found.!'], 409);
            }
        }
    }

    public function add_product(Request $request)
    {
        $rules = [
            'model_name' => 'required|string',
            'product_short_description' => 'required|string|max:255',
            'product_long_description' => 'required|string|max:255',
            'varient' => 'required|string|max:255',
            'brand_id' => 'required|integer',
            'body_type' => 'required|integer',

        ];
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                if ($request->product_items) {
                    foreach ($request->product_items as $key => $value) {
                        $rules = [
                            'images' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:15000',
                        ];

                        $modelData = array(
                            'brand_id' => $request->brand_id,
                            'category_id' => $request->body_type,
                            'product_name' => $request->model_name,
                            'variant' => $request->varient,
                            'short_desc' => $request->product_short_description,
                            'description' => $request->product_long_description,
                            'unit_price' => $value['unit_price'],
                            'color_id' => $value['color_id'],
                            'unit_price' => $value['unit_price'],
                            'status' => 1,
                        );

                        $modelgetID = DB::table('products')->insertGetId($modelData);

                        $images = $value['images'];

                        if ($validator->fails()) {
                            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
                        } else {
                            //ini_set('memory_limit', '-1');
                            $old = ini_set('memory_limit', '8192M');
                            foreach ($images as $key => $image_base64) {
                                $data = explode(',', $image_base64);
                                $format1 = explode(';', $data[0]);
                                $format1 = explode(':', $format1[0]);
                                $ext = explode('/', $format1[1]);
                                $data = base64_decode($data[1]);
                                $file_name = uniqid('image') . '.' . $ext[1];
                                file_put_contents('../wmc_admin/public/product_image/' . $file_name, $data);

                                $imageinsert = DB::table('product_gallery')->insert(['product_id' => $modelgetID, 'image' => $file_name, 'created_at' => date('Y-m-d H:i:s')]);
                            }
                        }

                        $data = array(
                            'product_id' => $modelgetID,
                            'stock' => $value['qty'],
                            'warehouse_id' => $value['warehouse_id'],
                        );
                        $insertColor = DB::table('product_stock')->insertGetId($data);

                        if ($request->product_attributes) {
                            foreach ($request->product_attributes as $key => $attrubutes) {
                                $attributeData = array(
                                    'product_id' => $modelgetID,
                                    'master_specification_id' => $attrubutes['specification_id'],
                                    'attribute_name' => $attrubutes['attribute_name'],
                                    'attribute_value' => $attrubutes['attribute_value'],
                                );

                                $insertAttributes = DB::table('product_attributes')->insertGetId($attributeData);
                            }
                        }
                    }
                }

                $data = collect(["StatusCode" => 200, 'status' => 'Success', "message" => "Data Add Successfully"]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                print_r($e);
                die;
                return response()->json(['StatusCode' => 422, 'status' => 'Failed', 'message' => 'Add Product Failed!'], 409);
            }
        }
    }

    public function get_products()
    {
        try {
            $product = DB::table('products')->get();

            $link = "https://162.241.87.160/wmc_admin/public/product_image/";

            foreach ($product as $key => $value) {
                $productstock = DB::table('product_stock')->where('product_id', $value->id)->first();
                $product_gallery = DB::table('product_gallery')->where('product_id', $value->id)->get();
                $product_color = DB::table('color')->where('id', $value->color_id)->first();
                $product_bodytype = DB::table('category')->where('id', $value->category_id)->first();

                /*print_r($product_gallery); die;*/

                foreach ($product_gallery as $key => $value2) {
                    $imagedata = $link . $value2->image;
                }

                $data['id'] = $value->id;
                $data['product_name'] = $value->product_name ?? '';
                $data['product_varient'] = $value->variant ?? '';
                $data['product_price'] = $value->unit_price ?? '';
                $data['body_type'] = $product_bodytype->category_name ?? '';
                $data['color'] = $product_color->color_name ?? '';
                $data['color_code'] = $product_color->color_hex_code ?? '';
                $data['stock'] = $productstock->stock ?? '';
                $data['image'] = $imagedata ?? '';

                $productlist[] = $data;
            }

            return response()->json(['StatusCode' => 200, 'Status' => 'Success', 'message' => 'Success', 'data' => $productlist]);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Data Not Found ..!'], 409);
        }
    }

    public function get_products_according_to_id($id)
    {
        $product = DB::table('products')->join('brand', 'products.brand_id', 'brand.id')->select('products.*', 'brand.brand_name')->where('products.id', $id)->get()->first();

        $link = "https://162.241.87.160/wmc_admin/public/product_image/";

        $productstock = DB::table('product_stock')->where('product_id', $product->id)->first();
        $product_gallery = DB::table('product_gallery')->where('product_id', $product->id)->get();
        $product_color = DB::table('color')->where('id', $product->color_id)->first();
        $product_bodytype = DB::table('category')->where('id', $product->category_id)->first();
        $product_attributes = DB::table('product_attributes')->where('product_id', $product->id)->Join('specification', 'product_attributes.master_specification_id', 'specification.id')->get();

        /* print_r($product_attributes); die;*/
        $test = array();
        foreach ($product_attributes as $key => $value3) {
            $product_specification = DB::table('specification')->where('id', $value3->master_specification_id)->first();

            $attributes['specification_name'] = $product_specification->specification_name;
            $attributes['Attribute'] = $value3->attribute_name;
            $attributes['value'] = $value3->attribute_value;
            $test[] = $attributes;
        }


        foreach ($product_gallery as $key => $value2) {
            $imagedata[] = $link . $value2->image;
        }

        $data['id'] = $product->id;
        $data['product_name'] = $product->product_name ?? '';
        $data['model'] = $product->model ?? '';
        $data['brand'] = $product->brand_name ?? '';
        $data['product_varient'] = $product->variant ?? '';
        $data['product_price'] = $product->unit_price ?? '';
        $data['discount'] = $product->discount ?? '';
        $data['body_type'] = $product_bodytype->category_name ?? '';
        $data['color'] = DB::table('products')->where('products.id', $product->id)->Join('color', 'products.color_id', 'color.id')->select('color.*')->get();
        $data['color_code'] = $product_color->color_hex_code ?? '';
        $data['stock'] = $productstock->stock ?? '';
        $data['images'] = $imagedata ?? '';
        $data['Specification'] = $product_attributes;
        $data['short_description'] = $product->description;
        $data['long_description'] = $product->short_desc;
        $data['reviews'] = DB::table('review')->where('product_id', $product->id)->get();

        $productlist = $data;

        return response()->json(['StatusCode' => 200, 'Status' => 'Success', 'message' => 'Success', 'data' => $productlist]);
    }

    public function product_order()
    {
        $ordertype = $_GET['order_type'] ?? '';

        if ($ordertype == "Normal") {
            $poducts_order_data = DB::table('product_order')->where('order_type', $ordertype)->get();
        } elseif ($ordertype == "Preapprove") {
            $poducts_order_data = DB::table('product_order')->where('order_type', $ordertype)->get();
        } elseif ($ordertype == "All") {
            $poducts_order_data = DB::table('product_order')->where('order_type', $ordertype)->get();
        } else {
            $poducts_order_data = DB::table('product_order')->get();
        }

        /*print_r($poducts_order_data); die;*/

        if (sizeof($poducts_order_data) > 0) {
            $data = [];
            foreach ($poducts_order_data as $key => $value) {
                $product_details = DB::table('products')->where('id', $value->product_id)->first();
                $customer_details = DB::table('users')->where('id', $value->customer_id)->first();

                $data['customer_name'] = $customer_details->first_name . ' ' . $customer_details->last_name;
                $data['phone'] = $customer_details->phone;
                $data['product_name'] = $product_details->product_name;
                $data['product_price'] = $product_details->unit_price;
                $data['booking_amount'] = $value->booking_amount;
                $data['booking_date'] = $value->booking_date;

                $product_order_details[] = $data;

                if ($data != '') {
                    $data = collect(["status" => "200", "message" => "Success", "data" => $product_order_details]);
                    return response()->json($data, 200);
                } else {
                    $data = collect(["status" => "120", "message" => "Faild"]);
                    return response()->json($data, 200);
                }
            }
        } else {
            $data = collect(["status" => "120", "message" => "Data Not found.!"]);
            return response()->json($data, 200);
        }
    }

    public function product_get_accordingto_brandid(Request $request)
    {
        $data = DB::table('products')->where('brand_id', $request->brand_id)->get(['variant']);

        if ($data != '') {
            $data = collect(["status" => "200", "message" => "Success", "data" => $data]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "120", "message" => "Faild"]);
            return response()->json($data, 200);
        }
    }

    public function add_product_stock(Request $request)
    {

        $this->validate($request, [
            'product_id' => 'required|integer',
            'stock' => 'required|integer',
        ]);

        try {
            $data = array(
                'product_id' => $request->product_id,
                'stock' => $request->stock,
            );

            /*print_r($data); die;*/

            $adddata = DB::table('product_stock')->insertgetId($data);

            $data = collect(["status" => "200", "message" => "Data Add Successfully", "stock_id" => $adddata]);
            return response()->json($data, 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'failed.!'], 409);
        }
    }

    public function get_product_stock_according_to_brand(Request $request)
    {
        $rules = [
            'brand_id' => 'required|integer'
        ];
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $product = DB::table('products')->where('brand_id', $request->brand_id)->get();
                if (sizeof($product) > 0) {
                    $link = "https://162.241.87.160/wmc_admin/public/product_image/";

                    foreach ($product as $key => $value) {
                        $productstock = DB::table('product_stock')->where('product_id', $value->id)->first();
                        $product_gallery = DB::table('product_gallery')->where('product_id', $value->id)->get();
                        $product_color = DB::table('color')->where('id', $value->color_id)->first();
                        $product_bodytype = DB::table('category')->where('id', $value->category_id)->first();

                        foreach ($product_gallery as $key => $value2) {
                            $imagedata = $link . $value2->image;
                        }
                        $data['id'] = $value->id;
                        $data['product_name'] = $value->product_name ?? '';
                        $data['product_varient'] = $value->variant ?? '';
                        $data['product_price'] = $value->unit_price ?? '';
                        $data['body_type'] = $product_bodytype->category_name ?? '';
                        $data['color'] = $product_color->color_name ?? '';
                        $data['color_code'] = $product_color->color_hex_code ?? '';
                        $data['stock'] = $productstock->stock ?? '';
                        $data['image'] = $imagedata ?? '';

                        $productlist[] = $data;
                    }

                    return response()->json(['StatusCode' => 200, 'Status' => 'Success', 'message' => 'Success', 'data' => $productlist]);
                } else {
                    return response()->json(['StatusCode' => 200, 'Status' => 'Success', 'message' => 'Success', 'data' => array()]);
                }
            } catch (\Exception $e) {
                return response()->json(['message' => 'Data Not Found for this Id.!'], 500);
            }
        }
    }

    public function get_product_according_to_brand_id(Request $request)
    {
        $rules = [
            'brand_id' => 'required|integer',
        ];
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $product = DB::table('products')->where('brand_id', $request->brand_id)->get();
                if ($product->Count() <= 0) {
                    return response()->json(['StatusCode' => 200, 'Status' => 'Success', 'message' => 'Success', 'data' => array()]);
                }
                $link = "https://162.241.87.160/wmc_admin/public/product_image/";

                foreach ($product as $key => $value) {
                    $productstock = DB::table('product_stock')->where('product_id', $value->id)->first();
                    $product_gallery = DB::table('product_gallery')->where('product_id', $value->id)->get();
                    $product_color = DB::table('color')->where('id', $value->color_id)->first();
                    $product_bodytype = DB::table('category')->where('id', $value->category_id)->first();
                    $product_attributes = DB::table('product_attributes')->where('product_id', $value->id)->get();
                    /* print_r($product_attributes); die;*/
                    foreach ($product_attributes as $key => $value3) {
                        $product_specification = DB::table('specification')->where('id', $value3->master_specification_id)->first();
                        $attributes['specification_name'] = $product_specification->specification_name;
                        $attributes['Attribute'] = $value3->attribute_name;
                        $attributes['value'] = $value3->attribute_value;
                        $test[] = $attributes;
                    }
                    foreach ($product_gallery as $key => $value2) {
                        $imagedata[] = $link . $value2->image;
                    }
                    $data['id'] = $value->id;
                    $data['product_name'] = $value->product_name ?? '';
                    $data['product_varient'] = $value->variant ?? '';
                    $data['product_price'] = $value->unit_price ?? '';
                    $data['body_type'] = $product_bodytype->category_name ?? '';
                    $data['color'] = $product_color->color_name ?? '';
                    $data['color_code'] = $product_color->color_hex_code ?? '';
                    $data['stock'] = $productstock->stock ?? '';
                    $data['image'] = $imagedata ?? '';
                    $data['Specification'] = $test ?? '';
                    $productlist[] = $data;
                }
                return response()->json([
                    'StatusCode' => 200,
                    'Status' => 'Success',
                    'bool' => 'True',
                    'message' => 'Success',
                    'data' => $productlist
                ]);
            } catch (\Exception $e) {
                return response()->json([
                    'message' => 'Data Not Found ..!'
                ], 409);
            }
        }
    }
}
