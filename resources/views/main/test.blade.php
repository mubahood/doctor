@extends('layouts.layout')

@section('title', 'Page Title')

@section('sidebar')
@parent

<p>This is appended to the master sidebar.</p>
@endsection

@section('content')




@php
use Illuminate\Support\Facades\Auth;
use App\Models\Product;
use App\Models\Profile;
use App\Models\City;
use App\Models\Category;
use App\Models\Country;
$cats = Category::all();

@endphp
<style>
    .product-widget-dropitem {
        margin: 0px;
        margin-top: .6rem;
    }

    .product-widget-dropdown {
        padding: 0px;
        margin: 0px;
    }

    .product-widget-dropdown li a {
        padding: 0px;
        margin: 0px;
        margin-left: 1.5rem;
    }

    .product-widget-dropdown li a:hover {
        background-color: white;
    }
</style>

{{-- {!! Form::open(['url' => 'test']) !!} --}}
@php
$counties = Country::all();
$country = $counties[0];
echo Form::model($country, ['url' => 'test'])
@endphp

<div class="row">
    <div class="col-4"></div>
    <div class="col-4 p-3">
        <div class="m-2">
            <div class="form-group">
                {{Form::label('name', 'Country name', ['class' => 'awesome']);}}
                {{
                Form::email('name', $value = null, $attributes = [
                'class' => 'form-control'
                ]);

                }}

                {{
                    Form::selectRange('number', 10, 20);
                }}
            </div>
        </div>
    </div>
    <div class="col-4"></div>
</div>

{!! Form::close() !!}



@endsection