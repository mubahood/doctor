@extends('metro.layout.layout-main')
<?php
use App\Models\Product;
$products = [];
$products = Product::all();
?>
@section('main-content')
    <div class="row">
        <div class="col-md-12 ">
            <img src="assets/images/slides/slider_1.jpeg" class="img-fluid ml-2 ml-md-5 mr-2 mr-md-5">
        </div>

        <h2 class="text-center my-6 h1">Browse By Category</h2>
        <div class="row mt-2">
            @for ($i = 1; $i < 13; $i++)
                <div class="col-3 col-md-2">
                    @include('metro.components.category-item', [
                        'name' => 'Title here',
                        'img' => "assets/images/slides/$i.png",
                        'link' => '#',
                    ])
                </div>
            @endfor
        </div>


        <h2 class="text-center my-6 h1">Recommend For You</h2>
        <div class="row mt-2">
            @foreach ($products as $item)
                <div class="col-6 col-md-2">
                    @include('metro.components.product-item', [
                        'item' => $item
                    ])
                </div>
            @endforeach
        </div>
    </div>
@endsection
