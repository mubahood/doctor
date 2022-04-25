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
                        <li><a href="#register-tab" class="nav-link active" data-toggle="tab">sign in</a></li>
                    </ul>
                </div>
                <div class="tab-pane active" id="register-tab">
                    <div class="user-form-title">
                        <h2>Login</h2>
                        <p>Provide your credintials to login.</p>
                    </div>


                    <form method="POST" action="{{ route('login') }}">
                        @csrf

                        <div class="row">
                            <div class="col-12">
                                <div class="form-group"><input  value="{{ old('phone_number') }}"
                                        class="form-control" required placeholder="Email address" name="phone_number">
                                    @error('phone_number')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror

                                </div>
                            </div>
                            <div class="col-12 pb-0 pb-0">
                                <div class="form-group"><input type="password" class="form-control"
                                        placeholder="Password" name="password"><button class="form-icon"><i
                                            class="eye fas fa-eye"></i></button><small class="form-alert">Password must
                                        be more than 6 characters</small>
                                    @error('password')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror

                                </div>
                            </div>

                            <span class="ml-md-3 mt-0 pt-0 mb-4">
                                Did you forget your password? <a href="{{ route('password-reset') }}">Reset Password</a>
                            </span>

                            <div class="col-12">
                                <div class="form-group"><button type="submit" class="btn btn-inline"><i
                                            class="fas fa-user-check"></i><span>Login</span></button></div>
                            </div>
                        </div>
                    </form>
                    <div class="col-12">
                        <div class="form-group">
                            <div class="custom-control custom-checkbox">Don't have account? <a
                                    href="{{ route('register') }}">Register</a> </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endsection
