<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DataTables\UsersDataTable;
use App\Models\Appointment;
use App\Models\Product;
use App\Models\User;
use App\Models\Utils;

class ApiAppointementsController extends Controller
{
    public function index(Request $r)
    {
        $user_id = ((int)($r->client_id));
        if($user_id<1){
            return [];
        }

        $u = User::find($user_id);
        if ($u == null) {
            return [];
        }

        $items = [];

        if ($u->user_ty == 'admin') {
            $items  = Appointment::all();
        } else if ($u->user_ty == 'doctor') {
            $items  = Appointment::where('doctor_id', $user_id)->get();
        } else {
            $items  = Appointment::where('client_id', $user_id)->get();
        }


        return $items;
    }

    /*
    {: canceled, : not paid, : mobile money, : 200, : 2022-05-17 08:00:00.000}
    */
    public function status_update(Request $r){
        if (
            (!isset($r->id)) || 
            (!isset($r->price)) 
        ) {
            return Utils::response([
                'status' => '0',
                'message' => 'No enough data.',
            ]);
        }

        $item = Appointment::find(((int)($r->id)));
        if($item == null){
            return Utils::response([
                'status' => '0',
                'message' => 'Appointment not found.',
            ]);
        }
        if($r->status!=null){
            $item->status = $r->status;
        }
        if($r->payment_status!=null){
            $item->payment_status = $r->payment_status;
        }
        if($r->payment_method!=null){
            $item->payment_method = $r->payment_method;
        }
        if($r->appointment_time!=null){
            $item->appointment_time = $r->appointment_time;
        }
        if($r->price!=null){
            $item->price = (int)($r->price);
        }

        if($item->save()){
            return Utils::response([
                'status' => '1',
                'message' => 'Appointment updated.',
            ]);
        }else{
            return Utils::response([
                'status' => '0',
                'message' => 'Failed to update appointment.',
            ]);
        }

    }
    public function store(Request $r)
    {

        if (
            (!isset($r->product_id)) ||
            (!isset($r->name)) ||
            (!isset($r->address)) ||
            (!isset($r->phone)) 
        ) {
            return Utils::response([
                'status' => '0',
                'message' => 'No enough data.',
            ]);
        }


        $user_id = 1;
        $product_id = ((int)($r->product_id));
          
        $p = Product::find($product_id);
        if ($p == null) {
            return Utils::response([
                'status' => '0',
                'message' => 'Service not found..',
            ]);
        }


        $ap = new Appointment();
        $ap->hospital_id = $p->hospital_id;
        $ap->doctor_id = $p->doctor_id;
        $ap->client_id = 1;
        $ap->price = $p->price;
        $ap->latitude = '0.00';
        $ap->longitude = '0.00';
        $ap->category_id = '1';
        $ap->status = 'Pending';
        $ap->appointment_time = '';
        $ap->details = $p->name;
        $ap->order_location = '1';

        if ($ap->save()) {
            return Utils::response([
                'status' => '1',
                'data' => '',
                'message' => 'Appinment submited successfully!',
            ]);
        } else {
            return Utils::response([
                'status' => '0',
                'data' => '',
                'message' => 'Failed to submit appinment. Please try again.',
            ]);
        }
    }

    public function edit()
    {
        return  view('metro.dashboard.users-create');
    }
}
