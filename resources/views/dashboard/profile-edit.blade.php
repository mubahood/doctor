@extends('layouts.layout')

@section('title', 'Page Title')

@section('head')
<link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/ad-post.css') }}">
@endsection

@section('content')
@php
use App\Models\Country;
use App\Models\Category;
use App\Models\Profile;
use App\Models\City;
$cities = City::all();
$categories = [];
foreach (Category::all() as $key => $value) {
if($value->parent){
$categories[] = $value;
}
}
$user_id = ((int) request()->segment(2));
if ($user_id < 0) { die('User not found.'); } $prof=Profile::where("user_id",$user_id)->First();
    if(!$prof){
    $new_prof = new Profile(['user_id' => $user_id]);
    $new_prof->save();
    $prof = Profile::where("user_id",$user_id)->First();
    }
    if(!$prof){
    dd("Profile not found");
    }
    @endphp
    <!-- id created_at updated_at user_id first_name last_name
    company_name email phone_number location about services longitude latitude division opening_hours profile_photo
    cover_photo facebook twitter whatsapp youtube instagram last_seen -->

    <section class="adpost-part">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                </div>
                <div class="col-lg-8">
                    {{ Form::open(array('url' => 'profile-edit/'.$user_id,'files' => true) ) }}

                    @php
                    Form::model($prof);

                    @endphp

                    {{-- <form method="POST" action="{{ url('profile-edit/'.$user_id) }}" enctype="multipart/form-data"
                        class="adpost-form"> --}}
                        @csrf
                        <input type="text" name="user_id" id="user_id" value="{{ $user_id }}" hidden>
                        <div class="adpost-card">
                            <div class="adpost-title">
                                <h3>Creating profile</h3>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {{ Form::label('first_name', 'First name',['class' => "form-label", 'required'
                                        => 'required']) }}
                                        {{ Form::text('first_name', null,['class' => "form-control"]) }}
                                        @error('first_name')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {{ Form::label('last_name', 'Last name',['class' => "form-label", 'required' =>
                                        'required']) }}
                                        {{ Form::text('last_name', null,['class' => "form-control"]) }}
                                        @error('last_name')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">

                                        {{ Form::label('company_name', 'Company name',['class' => "form-label"]) }}
                                        {{ Form::text('company_name', null,['class' => "form-control", 'required' =>
                                        'required']) }}

                                        @error('company_name')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">

                                        {{ Form::label('username', 'username',['class' => "form-label"]) }}
                                        {{ Form::text('username', null,['class' => "form-control", 'required' =>
                                        'required']) }}

                                        @error('company_name')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">

                                        {{ Form::label('email', 'Agent\'s Email address',['class' => "form-label",
                                        'required' => 'required']) }}
                                        {{ Form::text('email', null,['class' => "form-control"]) }}


                                        @error('email')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">

                                        {{ Form::label('phone_number', 'Phone number',['class' => "form-label"]) }}
                                        {{ Form::text('phone_number', null,['class' => "form-control"]) }}

                                        @error('phone_number')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group"><label class="form-label">City/Division</label>
                                        <select name="country_id" required class="form-control  custom-select"
                                            id="countries">
                                            <option selected>Select City/Division</option>
                                            @foreach (Country::all() as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('country_id')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"><label for="city_id" class="form-label">Area</label>
                                        <select name="city_id" class="form-control  custom-select" required
                                            id="city_id">
                                            <option selected>Select Area</option>
                                            @foreach ($cities as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('city_id')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">

                                        {{ Form::label('location', 'Street/Biulding address',['class' => "form-label",
                                        'required' => 'required']) }}
                                        {{ Form::text('location', null,['class' => "form-control"]) }}

                                        @error('location')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">


                                        {{ Form::label('about', 'About Company',['class' => "form-label", 'required' =>
                                        'required']) }}
                                        {{ Form::textarea('about', null,['class' => "form-control"]) }}

                                        @error('about')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">


                                        {{ Form::label('category_id', 'Main Products',['class' => "form-label",
                                        'required' => 'required']) }}

                                        <select name="category_id" required class="form-control  custom-select"
                                            id="category_id">
                                            <option selected>Select service</option>
                                            @foreach ($categories as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('category_id')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>


                            <div class="row d-none">
                                <div class="col-md-12">
                                    <div class="form-group">

                                        {{ Form::label('longitude', 'National ID Number or Passport Number',['class' =>
                                        "form-label" ] ) }}
                                        {{ Form::text('longitude', "romina",['class' => "form-control"]) }}
  
                                    </div>
                                </div>

                                <input type="text" hidden value="{{ old('latitude') }}" id="latitude" name="latitude" />
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="profile_photo" class="form-label">Profile
                                            photo</label>
                                        <input type="file" accept=".png,.jpg,.jpeg,.gif"
                                            value="{{ old('profile_photo') }}" name="profile_photo[]" id="profile_photo"
                                            class="form-control">
                                        @error('profile_photo')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"><label for="cover_photo" class="form-label">Cover
                                            photo</label>
                                        <input type="file" accept=".png,.jpg,.jpeg,.gif"
                                            value="{{ old('cover_photo') }}" name="cover_photo[]" id="cover_photo"
                                            class="form-control">
                                        @error('cover_photo')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group"><label for="facebook" class="form-label">Facebook</label>
                                        <input type="url" value="{{ old('facebook',$prof->facebook) }}" name="facebook"
                                            id="facebook" class="form-control">
                                        @error('facebook')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"><label for="twitter" class="form-label">twitter</label>
                                        <input type="url" value="{{ old('twitter',$prof->twitter) }}" name="twitter"
                                            id="twitter" class="form-control">
                                        @error('twitter')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            {{-- <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group"><label for="division" class="form-label">District</label>
                                        <input type="text" value="{{ old('division',$prof->division) }}" name="division"
                                            id="division" class="form-control">
                                        @error('division')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div> --}}

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group"><label for="whatsapp" class="form-label">whatsapp</label>
                                        <input type="text" value="{{ old('whatsapp',$prof->whatsapp) }}" name="whatsapp"
                                            id="whatsapp" class="form-control">
                                        @error('whatsapp')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"><label for="youtube" class="form-label">youtube</label>
                                        <input type="url" value="{{ old('youtube',$prof->youtube) }}" name="youtube"
                                            id="youtube" class="form-control">
                                        @error('youtube')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group"><label for="instagram" class="form-label">instagram</label>
                                        <input type="url" value="{{ old('instagram',$prof->instagram) }}"
                                            name="instagram" id="instagram" class="form-control">
                                        @error('instagram')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"><label for="linkedin" class="form-label">Linkedin</label>
                                        <input type="url" value="{{ old('linkedin',$prof->linkedin) }}" name="linkedin"
                                            id="linkedin" class="form-control">
                                        @error('linkedin')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="adpost-card pb-2">
                            <div class="adpost-agree">
                                <div class="form-group"><input type="checkbox" class="form-check"></div>
                                <p>By clicking "Create Your Account", you agree to our <a href="#">TERMS & CONDITIONS
                                    </a> and <a href="#">PRIVACY POLICY</a> and acknowledge that you are the rightful
                                    owner of
                                    this item and using Trade to find a genuine agent.</p>
                            </div>
                            <div class="form-group text-right"><button class="btn btn-inline"><i
                                        class="fas fa-check-circle"></i><span>UPDATE PROFILE</span></button></div>
                        </div>
                        {{--
                    </form> --}}
                    {{ Form::close() }}

                </div>
                <div class="col-lg-2">
                </div>
            </div>
        </div>
    </section>

    @endsection
    <script>
        window.addEventListener('DOMContentLoaded', (event) => {
            const countries = $("#countries");
            const cities = JSON.parse('<?php echo json_encode($cities); ?>');
            countries.change(function(event) {
                console.clear()
                const country_id = event.currentTarget.options.selectedIndex;
                $("#city_id").empty();
                var option = $('<option></option>').text('');
                $("#city_id").append(option); 
                cities.forEach(element => {
                    if (country_id == element.country_id) {
                        var option = $('<option></option>').attr("value", element.id).text(element.name);
                        $("#city_id").append(option); 
                    }
                });
 
            }); 
        });
    </script>