@php
use App\Models\Product;
use App\Models\Profile;
use App\Models\Utils;


$slug = request()->segment(1);
$url = $_SERVER['REQUEST_URI'];

$profile = Profile::where('username', $slug)->firstOrFail();
$products = Product::where('user_id',$profile->user_id)->get();
//$products = Product::where('user_id',2)->get();

$imgs = json_decode($profile->profile_photo);
$profile_pic = "assets/images/avatar/03.jpg";
if($imgs->src){
$profile_pic = Utils::get_file_url($imgs->src);
}
@endphp
@extends('layouts.layout')

@section('title', $profile->name)

@section('head')
<link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/ad-details.css') }}">
@endsection

@section('content')


<section class="inner-section ad-details-part pt-3 mb-0 pb-0 ">
    <div class="container mt-3">

        <div class="row">
            <div class="col-lg-8 pt-0 ">

                <div class="row ad-standard pt-0 mt-0 ">
                    <div class="card-body p-0 mb-3" style="height: 300px; overflow-y: hidden;">
                        <img width="100%" src="{{$profile_pic}}" alt="avatar">
                    </div>

                    @if (count($products)<=0) <div class="card w-100 mt-3">
                        <div class="card-body ">
                            <h3>This agent has not uploaded any product.</h3>
                        </div>
                </div>
                @endif

                @foreach ($products as $item)
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 mb-2">
                    <x-product2 :item="$item" />
                </div>
                @endforeach

            </div>



        </div>

        <div class="modal fade" id="number">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Contact Phone Number</h4><button class="fas fa-times" data-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <h3 class="modal-number">{{$profile->phone_number}}</h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4">

            <div class="common-card">
                <div class="card-header">
                    <h1 class="card-title h5">{{ $profile->company_name }}</h1>
                </div>
                <div class="ad-details-author">
                    <a href="mailto:{{$profile->email}}" class="author-img active"><img width="100" height="100"
                            src="{{$profile_pic}}" alt="avatar"></a>
                    <div class="author-meta">
                        <h4><a href="/{{$profile->user->profile->username}}">
                                {{$profile->user->profile->first_name}}
                                {{$profile->user->profile->last_name}}
                            </a></h4>
                        <h5>joined since: {{$profile->user->created_at->diffForHumans()}}</h5>
                    </div>
                    <div class="author-widget">

                        <a href="mailto:{{$profile->email}}" title="Message" class="fas fa-envelope"></a><button
                            type="button" title="Follow" class="follow fas fa-heart"></button><button type="button"
                            title="Number" class="fas fa-phone" data-toggle="modal"
                            data-target="#number"></button><button type="button" title="Share" class="fas fa-share-alt"
                            data-toggle="modal" data-target="#profile-share"></button>
                    </div>
                    <ul class="author-list">
                        <li>
                            <h6>Phone number</h6>
                            <p>{{$profile->phone_number}}</p>
                        </li>
                        <li>
                            <h6>Email address</h6>
                            <p>{{$profile->email}}</p>
                        </li>
                        <li>
                            <h6>Location</h6>
                            <p>{{$profile->location}}</p>
                        </li>
                        <li>
                            <h6>Services</h6>
                            <p>{{$profile->services}}</p>
                        </li>
                        <li>
                            <h6>Facebook</h6>
                            <p><a href="{{$profile->facebook}}" target="_blank">Facebook</a></p>
                        </li>
                        @if ($profile->twitter)
                        <li>
                            <h6>Twitter</h6>
                            <p><a href="{{$profile->twitter}}" target="_blank">Twitter</a></p>
                        </li>
                        @endif
                        @if ($profile->whatsapp)
                        <li>
                            <h6>Whatsapp</h6>
                            <p><a href="{{$profile->whatsapp}}" target="_blank">Whatsapp</a></p>
                        </li>
                        @endif
                    </ul>
                    <h6 class="mt-3 mb-2">About</h6>
                    <p class="text-left">{{$profile->about}}</p>
                </div>
            </div> 
      
        </div>
    </div>
    </div>
</section>
@php
$related_products = Product::where('category_id', $profile->category_id)->get();
@endphp





@endsection