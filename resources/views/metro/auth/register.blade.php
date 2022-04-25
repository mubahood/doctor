@extends('metro.layout.layout-auth')
@section('content')
    <form class="form w-100" autocomplete="off" 
        action="{{url('register')}}"
        method="POST"
    >
    @csrf
        <div class="mb-10 text-center">
            <h1 class="text-dark mb-3">Create an Account</h1>
            <div class="text-gray-400 fw-bold fs-4">Already have an account?
                <a href="{{ url('login') }}" class="link-primary fw-bolder">Sign in
                    here</a>
            </div>
        </div>

        <div class="row fv-row mb-7">
            <div class="col-md-6">
                @include('metro.components.input-text', [
                    'label' => 'First name',
                    'required' => 'required',
                    'attributes' => [
                        'name' => 'first_name',
                        'type' => 'text',
                    ],
                ])
            </div>
            <div class="col-md-6">
                @include('metro.components.input-text', [
                    'label' => 'Last name',
                    'required' => 'required',
                    'attributes' => [
                        'name' => 'last_name',
                        'type' => 'text',
                    ],
                ])
            </div>
        </div>
        <div class="fv-row mb-7">
            @include('metro.components.input-text', [
                'label' => 'Email address',
                'required' => 'required',
                'attributes' => [
                    'name' => 'email',
                    'type' => 'email',
                    'autocomplete' => 'off',
                ],
            ])
        </div>
        <div class="mb-5 fv-row" data-kt-password-meter="true">
            <div class="mb-1">
                @include('metro.components.input-text', [
                    'label' => 'Password',
                    'required' => 'required',
                    'hint' => 'Use 6 or more characters.',
                    'attributes' => [
                        'name' => 'password_1',
                        'type' => 'password',
                        'autocomplete' => 'off',
                    ],
                ])
            </div>
        </div>
        <div class="fv-row" data-kt-password-meter="true">
            <div class="mb-1">
                @include('metro.components.input-text', [
                    'label' => 'Confirm Password',
                    'required' => 'required',
                    'attributes' => [
                        'name' => 'password_2',
                        'type' => 'password',
                        'autocomplete' => 'off',
                    ],
                ])
            </div>
        </div>

        <div class="fv-row my-5">
            <label class="form-check form-check-custom form-check-solid form-check-inline">
                <input class="form-check-input" type="checkbox" name="toc" value="1" required />
                <span class="form-check-label fw-bold text-gray-700 fs-6">I Agree
                    <a href="javasxript:;" class="ms-1 link-primary">Terms and conditions</a>.</span>
            </label>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-lg btn-primary">
                <span class="indicator-label">Submit</span>
            </button>
        </div>
    </form>
@endsection
