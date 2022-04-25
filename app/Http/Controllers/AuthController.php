<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductReview;
use App\Models\Profile;
use App\Models\User;
use App\Models\Utils;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;



class AuthController extends Controller
{

    public function update_profile(Request $r)
    {
        $id = ((int)($r->id));
        if ($id < 1) {
            dd("creating");
        }

        $u = new User();
        if ($id > 0) {
            $u = User::find($id);
        }
        if ($u == null) {
            dd("user not found.");
        }


        if (isset($_FILES['avatar'])) {

            $img = $_FILES['avatar'];
            if ($img['error'] == 0) {
                $raw_images = [];
                $raw_images['name'][] = $img['name'];
                $raw_images['type'][] = 'image/png';
                $raw_images['tmp_name'][] = $img['tmp_name'];
                $raw_images['error'][] = $img['error'];
                $raw_images['size'][] = $img['size'];

                $temp_img = Utils::upload_images($raw_images);
                if ($temp_img != null) {
                    if (isset($temp_img[0])) {
                        $u->avatar = $temp_img[0]['src'];
                    }
                }
            }
        }


        $u->name = $r->name;
        if ($u->email == null) {
            $u->email = $u->username;
        }
        if ($u->username == null) {
            $u->username = $u->email;
        }

        $u->last_name = $r->name;
        $u->phone_number = $r->phone_number;
        $u->company_name = $r->company_name;
        $u->category_id = $r->category_id;
        $u->services = $r->services;
        $u->sub_county = $r->sub_county;
        $u->address = $r->address;
        $u->facebook = $r->facebook;
        $u->twitter = $r->twitter;
        $u->whatsapp = $r->whatsapp;
        $u->youtube = $r->youtube;
        $u->instagram = $r->instagram;
        $u->linkedin = $r->linkedin;
        $u->about = $r->about;
        $u->save();
        return redirect('dashboard');
    }

    public function logout()
    {
        die("logout...");
    }

    public function index()
    {
        die("listing...");
        return view('metro.auth.register');
    }

    public function login()
    {
        return view('metro.auth.login');
    }

    public function register()
    {
        return view('metro.auth.register');
    }

    public function do_login(Request $request)
    {

        $this->validate($request, [
            'email' => 'required|max:100|min:3',
            'password_1' => 'required|max:200|min:4',
        ]);


        $password = $request->password_1;
        $email = $request->email;


        $old_user = User::where('email', $email)->first();
        if ($old_user == null) {
            $old_user = User::where('username', $email)->first();
        }

        if ($old_user  == null) {
            $errors['email'] = "Account with email address you provided does not exist.";
            return redirect('login')
                ->withErrors($errors)
                ->withInput();
            die();
        }



        $_u['username'] = $email;
        $_u['password'] = $password;

        if (Auth::attempt($_u, true)) {
            return redirect('dashboard');
        } else {
            $errors['password_1'] = "You entered a wrong password.";
            return redirect('login')
                ->withErrors($errors)
                ->withInput();
        }
        die();
    }

    public function store(Request $request)
    {

        $this->validate($request, [
            'first_name' => 'required|max:45|min:3',
            'last_name' => 'required|max:45|min:3',
            'email' => 'required|max:100|min:3',
            'password_1' => 'required|max:200|min:4',
            'password_2' => 'required|max:200|min:4',
        ]);

        $password_2 = $request->password_2;
        $password_1 = $request->password_1;
        $email = $request->email;

        if ($password_2 != $password_1) {
            $errors['password_2'] = "Confirmation password did not match.";
            return redirect('register')
                ->withErrors($errors)
                ->withInput();
            die();
        }

        $old_user = User::where('email', $email)->first();

        if ($old_user) {
            $errors['email'] = "User with same email address already exist.";
            return redirect('register')
                ->withErrors($errors)
                ->withInput();
            die();
        }

        $new_user = new User();
        $new_user->email = $email;
        $new_user->username = $email;
        $new_user->password = password_hash($password_1, PASSWORD_DEFAULT);
        $new_user->name = $request->first_name;
        $new_user->last_name = $request->last_name;
        $new_user->avatar = 'avatar.jpg';

        $new_user->save();

        $_u['username'] = $email;
        $_u['password'] = $password_1;

        if (Auth::attempt($_u, true)) {
            return redirect('dashboard');
        } else {
            $errors['password'] = "Failed to log you in.";
            return redirect('login')
                ->withErrors($errors)
                ->withInput();
        }
        die();
    }

    public function show($id)
    {
        die("show");
        //
    }



    public function edit($id)
    {
        die("edit");
        //
    }



    public function update(Request $request, $id)
    {
        die("update");
        //
    }


    public function destroy($id)
    {
        die("deleint..");
        //
    }
}
