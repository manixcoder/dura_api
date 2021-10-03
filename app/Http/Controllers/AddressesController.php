<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\User;
use DB;
use Hash;

class AddressController extends Controller
{
    public function create_user_addresses(Request $request)
    {
        $rules = [
            'user_id' => 'required|Integer'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $addData = DB::table('user_addresses')->insertGetId($request->all());
                $data = collect(["status" => "100", "message" => "Success", "data" => $addData]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(['message' => $e], 409);
            }
        }
    }
    public function get_user_addresses($id)
    {
        if ($id != null) {
            $user_addresses = DB::table('user_addresses')->where('id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $user_addresses]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
    public function get_user_addresses_by_customer_id($id)
    {
        if ($id != null) {
            $user_addresses = DB::table('user_addresses')->where('user_id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $user_addresses]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
    public function get_all_user_addresses(Request $request)
    {
        $user_addresses = DB::table('user_addresses')->get();
        $data = collect(["status" => "200", "message" => "Success", "data" => $user_addresses]);
        return response()->json($data, 200);
    }
    public function update_user_addresses(Request $request)
    {
        if ($request->id != null) {
            $user_addresses = DB::table('user_addresses')->where('id', $request->id)->update($request->all());
            $data = collect(["status" => "200", "message" => "Success", "data" => $user_addresses]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
}
