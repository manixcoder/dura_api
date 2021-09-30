<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use  App\User;
use DB;

class HomeController extends Controller
{
    public function upload_image(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'file' => 'required|max:10280'
        ]);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        }
        $interestedValues = array();
        if ($file = $request->file('file')) {
            $destinationPath = base_path('public/Media/');
            $profileImage = uniqid('file') . "-" . $file->getClientOriginalName();
            $path = $file->move($destinationPath, $profileImage);
            $data = collect(["status" => "200", "message" => "Success", "data" => $profileImage]);
            return response()->json($data, 200);
        }
    }
    public function get_loans(Request $request)
    {
        try {
            $addData = DB::table('loan_apply')
            ->Join('product_gallery', 'loan_apply.product_id', 'product_gallery.product_id')
            ->get();
            $myArr = array();
            foreach ($addData as $item) {
                $item = (array)$item;
                $item['total_amount_left'] = $item['total_loan_payment'] - ($item['down_payment'] + $item['monthly_emi'] * $item['total_emi_paid']);
                $item['total_emi_left'] = $item['total_emis'] - $item['total_emi_paid'];
                $item['total_amount_recieve'] = $item['total_loan_payment'] - $item['total_amount_left'];
                $item = (object)$item;
                $item->image = 'https://' . $request->server->get('SERVER_NAME') . "/wmc_admin/public/product_image/" . $item->image;
                array_push($myArr, $item);
            }
            $data = collect(["status" => "200", "message" => "Success", "data" => $myArr]);
            return response()->json($data, 200);
        } catch (\Exception $e) {
            print_r($e);
            die;
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => 'Loan Apply Failed!'], 500);
        }
    }

    public function apply_loan(Request $request)
    {

        $rules = [
            'product_id' => 'required|integer',
            'customer_id' => 'required|integer',
            'down_payment' => 'required|integer',
            //'total_loan_payment' => 'required|integer',
            'monthly_emi' => 'required|integer',
            //'address' => 'required|string|max:255',
            //'phone' => 'required|integer',
            'account_holder_name' => 'required|string|max:255',
            //'bank_name' => 'required|string|max:255',
            //'ifsc_code' => 'required|string',
            //'account_number' => 'required|integer',
            //'repayment_option' => 'required|string',
            //'family_book' => 'required|string',
            //'employment_contract' => 'required|string',
            //'occupation' => 'required|string',
            //'purchase_detail' => 'required|string',
            //'identity_card' => 'required|string',
            //'payment_mode' => 'required|string',
            //'payment_remark' => 'required|string',
            //'total_emis' => 'required|integer',
        ];
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                $data = array(
                    'customer_id' => $request->customer_id,
                    'product_id' => $request->product_id,
                    'monthly_emi' => $request->monthly_emi,
                    'down_payment' => $request->down_payment,
                    'address' => $request->address,
                    'phone' => $request->phone,
                    'account_holder_name' => $request->account_holder_name,
                    'occupation' => $request->occupation,
                    'repayment_option' => $request->repayment_option,
                    'status' => "Pending",
                );
                $addData = DB::table('loan_apply')->insertGetId($data);

                $data = collect(["status" => "200", "message" => "Success", "LoanId" => $addData]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                /*print_r($e); die;*/
                return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => 'Loan Apply Failed!'], 500);
            }
        }
    }

    public function get_users()
    {
        $users = DB::table('users')->where('users_role', 2)->get(['id', 'name', 'email', 'phone']);

        if ($users != '') {
            $data = collect(["status" => "100", "message" => "Success", "data" => $users]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "120", "message" => "Faild"]);
            return response()->json($data, 200);
        }
    }

    public function get_wherehouse()
    {
        $wherehousedata = DB::table('warehouse')->get(['id', 'warehouse_name']);

        if ($wherehousedata != '') {
            $data = collect([
                "status" => "100", 
                "message" => "Success", 
                "data" => $wherehousedata
            ]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "120", "message" => "Faild"]);
            return response()->json($data, 200);
        }
    }

    public function get_color()
    {
        $colordata = DB::table('color')
        ->orderBy('color_name', 'Asc')
        ->get(['id', 'color_hex_code', 'color_name']);

        if ($colordata != '') {
            $data = collect(["status" => "100", "message" => "Success", "data" => $colordata]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "120", "message" => "Faild"]);
            return response()->json($data, 200);
        }
    }

    public function get_customers()
    {
        $customers = DB::table('users')
        ->where('users_role', 3)
        ->get(['id', 'first_name', 'last_name', 'email', 'phone', 'home_phone', 'wechat_whatsapp_no', 'address', 'status', 'dob', 'gender']);

        if ($customers != '') {
            $data = collect(["status" => "100", "message" => "Success", "data" => $customers]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "120", "message" => "Faild"]);
            return response()->json($data, 200);
        }
    }

    public function add_customer(Request $request)
    {
        $rules = [
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'phone' => 'required|string',
            'home_phone' => 'required|string',
            'wechat_whatsapp_no' => 'required|string',
            'address' => 'required|string',
            'status' => 'required|integer',
            'gender' => 'required|integer',
            'dob' => 'required|string'

        ];
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['StatusCode' => 422, 'Status' => 'Failed', 'message' => $validator->messages()], 200);
        } else {
            try {
                /*echo "helo"; die;*/
                $user = new User;
                $user->first_name = $request->input('first_name');
                $user->last_name = $request->input('last_name');
                $user->phone = $request->input('phone');
                $user->home_phone = $request->input('home_phone');
                $user->wechat_whatsapp_no = $request->input('wechat_whatsapp_no');
                $user->address = $request->input('address');
                $user->status = $request->input('status');
                $user->gender = $request->input('gender');
                $user->dob = $request->input('dob');
                $user->email = $request->input('email');
                $user->bank_name = $request->input('bank_name');
                $user->account_name = $request->input('account_name');
                $user->account_no = $request->input('account_no');
                $user->authorize_person = $request->input('authorize_person');
                $user->vattin = $request->input('vattin');
                $plainPassword = $request->input('password');
                $user->password = app('hash')->make($plainPassword);
                $user->users_role = $request->input('users_role');

                /* print($user); die;*/
                $user->save();

                $data = collect(["status" => "100", "message" => "Success", "data" => $user]);
                return response()->json($data, 200);
            } catch (\Exception $e) {
                return response()->json(['message' => 'Customer Registration Failed!'], 409);
            }
        }
    }

    public function edit_customer(Request $request)
    {
        $this->validate($request, [
            'edit_id' => 'required|integer',
        ]);
        $customerdata = User::where('id', $request->edit_id)
        ->where('users_role', 3)
        ->first();

        if ($customerdata != '') {
            if ($customerdata->email == $request->email) {
                try {
                    $password = app('hash')->make($request->password);
                    $data = array(
                        'first_name' => $request->first_name,
                        'last_name' => $request->last_name,
                        'email' => $request->email,
                        'phone' => $request->phone,
                        'home_phone' => $request->home_phone,
                        'wechat_whatsapp_no' => $request->wechat_whatsapp_no,
                        'address' => $request->address,
                        'status' => $request->status,
                        'gender' => $request->gender,
                        'dob' => $request->dob,
                        'password' => $password,
                    );

                    $editdata = User::where('id', $request->edit_id)->update($data);
                    $data = collect(["status" => "100", "message" => "Data updated successfully"]);
                    return response()->json($data, 200);
                } catch (\Exception $e) {
                    return response()->json(['message' => 'Something went wrong'], 409);
                }
            } else {
                $this->validate($request, [
                    'email' => 'required|email|unique:users',
                ]);
                $password = app('hash')->make($request->password);
                $data = array(
                    'first_name' => $request->first_name,
                    'last_name' => $request->last_name,
                    'email' => $request->email,
                    'phone' => $request->phone,
                    'home_phone' => $request->home_phone,
                    'wechat_whatsapp_no' => $request->wechat_whatsapp_no,
                    'address' => $request->address,
                    'status' => $request->status,
                    'gender' => $request->gender,
                    'dob' => $request->dob,
                    'password' => $password,
                );

                $editdata = User::where('id', $request->edit_id)->update($data);
                $data = collect([
                    "status" => "100", 
                    "message" => "Data updated successfully"
                ]);
                return response()->json($data, 200);
            }
        } else {
            return response()->json([
                'status' => 102, 
                'message' => 'Data not found of this id'
            ], 401);
        }
    }

    public function get_brands()
    {
        $brand = DB::table('brand')->get();

        foreach ($brand as $value) {
            $user['id'] = $value->id;
            $user['brand_name'] = $value->brand_name;
            $user['status'] = $value->status;
            $user['image'] = "https://162.241.87.160/wmc_admin/public/brand_image/" . $value->image;
            $VendorList[] = $user;
        }

        if ($user != '') {
            $data = collect(["status" => "100", "message" => "Success", "data" => $VendorList]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "120", "message" => "Faild"]);
            return response()->json($data, 200);
        }
    }

    public function get_categoryold()
    {
        $brand = DB::table('category')->get();

        foreach ($brand as $value) {
            $user['id'] = $value->id;
            $user['category_name'] = $value->category_name;
            $user['status'] = $value->status;
            $user['image'] = "https://162.241.87.160/wmc_admin/public/category_image/" . $value->image;
            $VendorList[] = $user;
        }

        if ($user != '') {
            $data = collect(["status" => "100", "message" => "Success", "data" => $VendorList]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "120", "message" => "Faild"]);
            return response()->json($data, 200);
        }
    }

    public function get_category()
    {
        $brand = DB::table('brand')->get();
        foreach ($brand as $value) {
            $user['id'] = $value->id;
            $user['category_name'] = $value->brand_name;
            $user['status'] = $value->status;
            $user['image'] = "https://162.241.87.160/wmc_admin/public/brand_image/" . $value->image;
            $VendorList[] = $user;
        }
        if ($user != '') {
            $data = collect(["status" => "100", "message" => "Success", "data" => $VendorList]);
            return response()->json($data, 200);
        } else {
            $data = collect(["status" => "120", "message" => "Faild"]);
            return response()->json($data, 200);
        }
    }
}
