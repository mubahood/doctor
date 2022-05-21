<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductReview;
use App\Models\Profile;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;



class MainController extends Controller
{
    public function index()
    {
        return view('metro.main.index');
        //return view('metro.index');
    }

    public function slugSwitcher(Request  $request)
    {
        //echo "<pre>"; 
        //dd($request);
        //die();
        if (
            isset($_POST['reason']) &&
            isset($_POST['product_id']) &&
            isset(
                $_POST['comment']
            )
        ) {
            $review = new ProductReview();
            $review->rating = $_POST['rating'];
            $review->reason = $_POST['reason'];
            $review->comment = $_POST['comment'];
            $review->product_id = $_POST['product_id'];
            $review->user_id =  Auth::id();

            $url = $_SERVER['REQUEST_URI'];

            if ($review->save()) {
                $errors['success'] = "Review was submitted successfully!";
                return redirect($url)
                    ->withErrors($errors)
                    ->withInput();
            } else {
                $errors['password'] = "Failed to submit review, please try again.";
                return redirect($url)
                    ->withErrors($errors)
                    ->withInput();
            }
        }

        $seg = request()->segment(1);
        $profile = Profile::where('username', $seg)->first();
        if ($profile) {
            return view('main.display-profile');
        }

        $pro = Product::where('slug', $seg)->first();
        if ($pro) {
            return view('metro.main.products-details');
        }
        return view('main.index');
    }

    public function password_reset(Request  $request)
    {

        if (
            isset($_POST['key']) && 
            isset($_POST['new_password'])  
            ) {
            $k = trim($_POST['key']);
            $new_password = trim($_POST['new_password']);
            if(strlen($k)>2){
                $u = User::where('remember_token', $k)->first();
                if($u!=null){
                    $hash = password_hash($new_password,PASSWORD_DEFAULT);
                    $u->password = $hash;
                    $u->save();
                    
                    $_u['email'] = $u->email;
                    $_u['password'] = $new_password;

                    if (Auth::attempt($_u, true)) { 
                        header("Location: ".url("dashboard"));
                        die();
                    } else {
                        $errors['password'] = "Failed to log you in.";
                        return redirect('login')
                            ->withErrors($errors)
                            ->withInput();
                    }
                }
            }
        }

        if (isset($_POST['email'])) {
            $email_address = trim($_POST['email']);
            $u = User::where("email", $email_address)->first();
            $id = 0;
            if ($u == null) {
                $pro = Profile::where("email", $email_address)->first();
                if ($pro != null) {
                    $u = User::find($pro->user_id);
                }
            }
            if ($u == null) {
                $errors['email'] = "The email you provided does not exist on our database.
                 Check your email and try again or if you don't have account, create one now.";
                return redirect('password-reset')
                    ->withErrors($errors)
                    ->withInput();
            }

            $faker = \Faker\Factory::create();
            $u->remember_token = $faker->regexify('[A-Za-z0-9]{50}');
            $u->save();
            $url = url('password-reset?key=' . $u->remember_token);

            // the message
            $message = "Hello,\nPlease click on link below to reset your password.\n\n{$url}";
            $message = wordwrap($message, 70); 
              
            $headers = 'From: info@goprint.ug'       . "\r\n" .
                         'Reply-To: info@goprint.ug' . "\r\n" .
                         'X-Mailer: PHP/' . phpversion(); 

            if (mail($email_address, "GO-PRINT PASSWORD RESET", $message, $headers)) {
                return redirect('password-reset?success=success');
                die();
                dd("SUCCESS");
            } else {
                dd("FAILED to send email. Please try again.");
            }


            // /dd(password_hash("269435158522",PASSWORD_DEFAULT));

            if (Auth::attempt($u, true)) {
                $errors['success'] = "Account created successfully!";
                return redirect('dashboard')
                    ->withErrors($errors)
                    ->withInput();
            } else {
                $errors['password'] = "Wrong password";
                return redirect('login')
                    ->withErrors($errors)
                    ->withInput();
            }
        }

        return view('main.password-reset');
    }

    public function login(Request  $request)
    {
        if (Auth::guard()->check()) {
            return redirect("/");
        }


        if (isset($_POST['phone_number'])) {

            $u['email'] = $_POST['phone_number'];
            $u['password'] = $_POST['password'];

            // /dd(password_hash("269435158522",PASSWORD_DEFAULT));

            if (Auth::attempt($u, true)) {
                $errors['success'] = "Account created successfully!";
                return redirect('dashboard')
                    ->withErrors($errors)
                    ->withInput();
            } else {
                $errors['password'] = "Wrong password";
                return redirect('login')
                    ->withErrors($errors)
                    ->withInput();
            }
        }

        return view('main.login');
    }

    public function register(Request  $request)
    {
        if (Auth::guard()->check()) {
            return redirect("/");
        }

        if (
            isset($_POST['password']) &&
            isset($_POST['password1']) &&
            isset($_POST['phone_number'])
        ) {


            if ($request->input('password') !=  $request->input('password1')) {
                $errors['password1'] = "Password don't match";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
            }

            if (strlen($request->input('password')) < 6) {
                $errors['password1'] = "Password too short.";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
            }


            $u['name'] = "";
            $u['email'] = trim(str_replace("+", "", $request->input("phone_number")));
            $u['phone_number'] = $u['email'];


            $old_user = User::where('email', $u['email'])->first();
            if ($old_user) {
                $errors['phone_number'] = "User with same email or phone number already exist.";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
                die();
            }

            $old_user = User::where('phone_number', $u['email'])->first();
            if ($old_user) {
                $errors['phone_number'] = "User with same email or phone number already exist.";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
                die();
            }

            $u['password'] = Hash::make($request->input("password"));
            $users = User::create($u);
            $pro = new Profile();
            $pro->status = 0;
            $pro->user_id = $users->id;
            $pro->save();

                
            $credentials['email'] = $u['email'];
            $credentials['password'] = $request->input("password");

            if (Auth::attempt($credentials, true)) {
                $request->session()->regenerate();
                return redirect()->intended('dashboard');
            } else {
                return redirect()->intended('login');
            }
        }
        return view('main.register');
    }

    public function about()
    {
        return view('about.about_us');
    }

    public function sell_fast()
    {
        return view('about.sell_fast');
    }

    public function contact()
    {
        return view('about.contact');
    }

    public function test()
    {
        return view('main.test');
    }
}
