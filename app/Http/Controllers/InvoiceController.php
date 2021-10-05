<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\User;
use DB;
use Hash;

class InvoiceController extends Controller
{
    public function create_invoice(Request $request)
    {
        $rules = [
            'customer_name' => 'required|string',
            'customer_type' => 'required|string',
            'invoice_date' => 'required|string'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $addData = DB::table('invoice')->insertGetId($request->all());
                $data = collect(["status" => "200", "message" => "Success", "data" => $addData]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(['message' => $e . getMessage()], 500);
            }
        }
    }
    public function get_invoice($id)
    {
        if ($id != null) {
            $invoice = DB::table('invoice')->where('id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $invoice]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
    public function get_all_invoice(Request $request)
    {
        $invoice = DB::table('invoice')->get();
        $data = collect(["status" => "200", "message" => "Success", "data" => $invoice]);
        return response()->json($data, 200);
    }
    public function get_invoice_by_customer_id($id)
    {
        if ($id != null) {
            $invoice = DB::table('invoice')->where('id', $id)->first();
            $data = collect(["status" => "200", "message" => "Success", "data" => $invoice]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
    public function update_invoice(Request $request)
    {
        if ($request->id != null) {
            $invoice = DB::table('invoice')->where('id', $request->id)->update($request->all());
            $data = collect(["status" => "200", "message" => "Success", "data" => $invoice]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "404", "message" => "not found", "data" => null]);
            return response()->json($data, 200);
        }
    }
}
