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

class NotificationsController extends Controller
{
    public function create_notifications(Request $request)
    {
        $rules = [
            'title' => 'required|string',
            'description' => 'required|string',
            'user_id' => 'required|Integer'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $addData = DB::table('notifications')->insertGetId($request->all());
                $data = collect(["status" => "100", "message" => "Success", "data" => $addData]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(['message' => $e], 409);
            }
        }
    }
    public function get_notifications($id)
    {
        if ($id != null) {
            $notifications = DB::table('notifications')->where('id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $notifications]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
    public function get_notifications_by_customer_id($id)
    {
        if ($id != null) {
            $notifications = DB::table('notifications')->where('user_id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $notifications]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
    public function get_all_notifications(Request $request)
    {

        $notifications = DB::table('notifications')->get();
        $data = collect(["status" => "200", "message" => "Success", "data" => $notifications]);
        return response()->json($data, 200);
    }
    public function update_notifications(Request $request)
    {
        if ($request->id != null) {
            $notifications = DB::table('notifications')->where('id', $request->id)->update($request->all());
            $data = collect(["status" => "200", "message" => "Success", "data" => $notifications]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
}
