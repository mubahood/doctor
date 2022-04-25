@php
use App\Models\User;
@endphp
@extends('layouts.layout')
@section('head')
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/user-form.css') }}">
@endsection
@section('content')

    <body>
        <section class="user-form-part">
            <div class="user-form-banner">
                <div class="user-form-content"><a href="#"><img src="{{ URL::asset('/assets') }}/images/logo-1.png"
                            alt="logo"></a>
                    <h1>Advertise your products<span>and buy whatever you need</span></h1>
                    <p>across the Uganda.</p>
                </div>
            </div>
            <div class="user-form-category">
                <div class="user-form-header"><a href="#"><img src="{{ URL::asset('/assets') }}/images/logo.jpeg"
                            alt="logo"></a><a href="{{ url('') }}"><i class="fas fa-home"></i></a></div>
                <div class="user-form-category-btn">
                    <ul class="nav nav-tabs">
                        <li><a href="#register-tab" class="nav-link active" data-toggle="tab">Password Reset</a></li>
                    </ul>
                </div>
                <div class="tab-pane active" id="register-tab">
                    <?php
                    $title = 'Password Reset';
                    $is_success = false;
                    $is_reset = false;
                    $key = '';
                    $u = null;
                    
                    $body = "Provide your existing account's email address to where we should send your reset password link.";
                    if (isset($_GET['success'])) {
                        $title = 'Link Sent!';
                        $is_success = true;
                        $body = "A password resent link has been sent to the email address you submited. Go check 
                                                                                        it now!, click on the link to complete your password reset process. CHECK SPAM if you can't
                                                                                         find email in your inbox.";
                    }
                    
                    if (isset($_GET['key'])) {
                        $key = trim($_GET['key']);
                        if (strlen($key) > 0) {
                            $u = User::where('remember_token', $key)->first();
                            if ($u != null) {
                                $is_reset = true;
                                $body = 'Create your new password.';
                            }
                        }
                    }
                    
                    ?>
                    <div class="user-form-title">
                        <h2>{{ $title }}</h2>
                        <p>{{ $body }}</p>
                    </div>

                    @if ($is_reset)
                        <form method="POST" action="{{ route('password-reset') }}">
                            @csrf
                            <div class="row">
                                <div class="col-12">
                                    <input type="hidden" hidden name="key" value="{{ $key }}">
                                    <div class="form-group"><input type="text" value="{{ old('new_password') }}"
                                            class="form-control" required placeholder="Enter new password"
                                            name="new_password">
                                        @error('new_password')
                                            <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror

                                    </div>
                                </div>


                                <div class="col-12">
                                    <div class="form-group"><button type="submit" class="btn btn-inline"><i
                                                class="fas fa-user-check"></i><span>SUBMIT</span></button></div>
                                </div>
                            </div>
                        </form>
                    @endif


                    @if (!$is_success && !$is_reset)


                        <form method="POST" action="{{ route('password-reset') }}">
                            @csrf
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group"><input type="email" value="{{ old('email') }}"
                                            class="form-control" required placeholder="Enter your email address"
                                            name="email">
                                        @error('email')
                                            <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror

                                    </div>
                                </div>


                                <div class="col-12">
                                    <div class="form-group"><button type="submit" class="btn btn-inline"><i
                                                class="fas fa-user-check"></i><span>SUBMIT</span></button></div>
                                </div>
                            </div>
                        </form>
                        <div class="col-12">
                            <div class="form-group">
                                <div class="custom-control custom-checkbox">Don't have account? <a
                                        href="{{ route('register') }}">Register</a> </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </section>
    @endsection
