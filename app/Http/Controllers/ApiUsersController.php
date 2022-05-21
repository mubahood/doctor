<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Product;
use App\Models\Profile;
use App\Models\User;
use App\Models\Utils;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class ApiUsersController
{
    public function index(Request $request)
    {
        $items = User::paginate(10)->withQueryString()->items();
        return $items;
    }

    public function login(Request $request)
    {
        if (
            $request->email == null ||
            $request->password == null
        ) {
            return Utils::response([
                'status' => 0,
                'message' => "You must provide email and password.",
                'data' => null
            ]);
        }

        $email = (string) ($request->email ? $request->email : "");
        $password = (string) ($request->password ? $request->password : "");

        $_u = User::where('username', $email)->get();
        $u = null;
        if (isset($_u[0])) {
            $u = $_u[0];
        }

        if ($u == null) {
            $_u = User::where('email', $email)->get();
            if (isset($_u[0])) {
                $u = $_u[0];
            }
        }

        if (!password_verify($password, trim($u->password))) {
            return Utils::response([
                'status' => 0,
                'message' => "Wrong password.",
                'data' => null
            ]);
        }

        if ($u == null) {
            return Utils::response([
                'status' => 0,
                'message' => "Account not found.",
                'data' => null
            ]);
        }

        return Utils::response([
            'status' => 1,
            'message' => "Logged successfully.",
            'data' => $u
        ]);
    }

    public function update(Request $request)
    {

        if (
            $request->email == null ||
            $request->name == null ||
            $request->user_id == null
        ) {
            return Utils::response([
                'status' => 0,
                'message' => "You must provide Name, email and user id.",
                'data' => null
            ]);
        }

        $user_id = (int) ($request->user_id ? $request->user_id : 0);
        $email = (string) ($request->email ? $request->email : "");
        $u = User::find($user_id);
        if ($u == null) {
            return Utils::response([
                'status' => 0,
                'message' => "Failed to find account with ID {$user_id}",
                'data' => null
            ]);
        }

        $_u = User::where('email', $email)->get();
        if (isset($_u['0'])) {
            if ($_u['0']->id != $u->id) {
                return Utils::response([
                    'status' => 0,
                    'message' => "Changes not saved because user with same email ({$user_id}) that you provided already exist.",
                    'data' => null
                ]);
            }
        }

        $u->email = $email;
        $u->email = $u->email;
        $u->username = $u->email;

        $u->name = (string) ($request->name ? $request->name : "");
        $u->username = (string) ($request->email ? $request->email : "");
        $u->company_name = (string) ($request->company_name ? $request->company_name : "");
        $u->phone_number = (string) ($request->phone_number ? $request->phone_number : "");
        $u->address = (string) ($request->address ? $request->address : "");
        $u->about = (string) ($request->about ? $request->about : "");
        $u->services = (string) ($request->services ? $request->services : "");
        $u->longitude = (string) ($request->longitude ? $request->longitude : "");
        $u->latitude = (string) ($request->latitude ? $request->latitude : "");
        $u->division = (string) ($request->division ? $request->division : "");
        $u->facebook = (string) ($request->facebook ? $request->facebook : "");
        $u->twitter = (string) ($request->twitter ? $request->twitter : "");
        $u->whatsapp = (string) ($request->whatsapp ? $request->whatsapp : "");
        $u->instagram = (string) ($request->instagram ? $request->instagram : "");
        $u->category_id = (string) ($request->category_id ? $request->category_id : "");
        $u->country_id = (string) ($request->country_id ? $request->country_id : "");
        $u->region = (string) ($request->region ? $request->region : "");
        $u->district = (string) ($request->district ? $request->district : "");
        $u->sub_county = (string) ($request->sub_county ? $request->sub_county : "");

        unset($u->password);
        unset($u->status_comment);
        unset($u->opening_hours);
        unset($u->remember_token);
        unset($u->cover_photo);
        unset($u->youtube);
        unset($u->last_seen);
        unset($u->status);
        unset($u->linkedin);

        if (isset($_FILES)) {
            if ($_FILES != null) {
                if (count($_FILES) > 0) {

                    if (isset($_FILES['profile_pic'])) {
                        if ($_FILES['profile_pic'] != null) {
                            if (isset($_FILES['profile_pic']['tmp_name'])) {
                                $u->avatar = Utils::upload_file($_FILES['profile_pic']);
                            };
                        }
                        unset($_FILES['audio']);
                    }
                }
            }
        }


        $u->save();

        return Utils::response([
            'status' => 1,
            'message' => "Profile updated successfully.",
            'data' => $u
        ]);
    }

    public function create_account(Request $request)
    {

        if (
            $request->email == null ||
            $request->name == null ||
            $request->sub_county == null ||
            $request->password == null
        ) {
            return Utils::response([
                'status' => 0,
                'message' => "You must provide Name, email and password. {$request->name}",
                'data' => $request
            ]);
        }


        $u['name'] = $request->input("name");
        $u['username'] = $request->input("email");
        $u['email'] = $request->input("email");
        $u['sub_county'] = $request->input("sub_county");
        $u['latitude'] = $request->input("latitude");
        $u['longitude'] = $request->input("longitude");
        $u['user_type'] = 'Client';

        $old_user = User::where('username', $u['username'])->first();
        if ($old_user) {
            return Utils::response([
                'status' => 0,
                'message' => "User with same email address already exist."
            ]);
        }

        $u['password'] = Hash::make($request->input("password"));


        $user = User::create($u);
        $_user = User::find($user->id);

        return Utils::response([
            'status' => 1,
            'message' => "Account created successfully!",
            'data' => $_user
        ]);
    }
}
