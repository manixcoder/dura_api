<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
//use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use  App\User;
use URL;
use DB;

class ExternalController extends Controller
{
     /**
     * Instantiate a new ExternalController instance.update_user_profile
     *
     * @return void
     */
    public function __construct()  {
        //$this->middleware('auth');
    }

    /**
     * Get the authenticated User.
     *
     * @return Response
     */
    public function profile() {
        //return response()->json(['user' => Auth::user()], 200);
    }

    /**
     * Get all User.
     *
     * @return Response
     */
    public function allUsers() {
        die("sssssss");
         return response()->json(['users' =>  User::all()], 200);
    }

    /**
     * Get one user.
     *
     * @return Response
     */
        public function getlocation(Request $request)
        {
            $rules = [
                'service_name' => 'required|integer'
            ];
           
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return response()->json(['StatusCode' => 422,'Status' => 'Failed','message'=>$validator->messages() ], 201);
            } 
            else{
                //ini_set('memory_limit', '-1');
                try {
                    $user = DB::table('service_area')->where('service_name', $request->service_name)->get();
                    
                    $data = collect(["status" => "200", "message" => "Data fetch successfully.!" , "data" => $user]);
                    return response()->json($data, 200);
                } 
                catch (\Exception $e) 
                {
                    print_r($e);
                    return response()->json(['message' => 'Data not found!'], 404);
                }
            }
            
        }
        public function complocation(Request $request)
        {
            try {
                $country = DB::table('country')->where('phonecode','!=',0)->get();
                //print_r($country);die;
                $finalData= array();
                foreach($country as $user)
                {
                    $finalData[] = array('id'=>$user->id,'iso'=>$user->iso,'country_name'=>$user->country_name,'country_code'=>$user->phonecode);
                }
                $data = collect(["status" => 200, "message" => "Data fetch successfully.!" , "data" => $finalData]);
                return response()->json($data, 200);
            } 
            catch (\Exception $e) 
            {
                print_r($e);
                return response()->json(['message' => 'Data not found!'], 404);
            }
            
        }
        public function refercode(Request $request)
        {
            try 
            {
                $user = DB::table('reference_codemaster')->where('recode', $request->refer_code)->first();
                
                if(!empty($user))
                {
                    $data = collect(["status" => "200", "message" => "Code matched successfully.!" , "data" => $user]);
                }   else{
                    $data = collect(["status" => "200", "message" => "Code Not matched.!" , "data" =>null]);
                }
                
                return response()->json($data, 200);
                
            } 
            catch (\Exception $e) 
            {
                print_r($e);
                return response()->json(['message' => 'Data not found!'], 404);
            }    
        }
        
        public function allcountry()
        {
            try 
            {
                $user = DB::table('country')->orderby('id', 'DESC')->get();
                
                if(!empty($user))
                {
                    $data = collect(["status" => "200", "message" => "data matched successfully.!" , "data" => $user]);
                }   else{
                    $data = collect(["status" => "200", "message" => "data Not found.!" , "data" =>null]);
                }
                
                return response()->json($data, 200);
                
            } 
            catch (\Exception $e) 
            {
                print_r($e);
                return response()->json(['message' => 'Data not found!'], 404);
            }
        }
        
}

?>