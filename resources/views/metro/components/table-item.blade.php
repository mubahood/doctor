@php
    $_title = isset($title) ? $title : "No title";
    $_max = isset($max) ? $max : 15;
    $_img = isset($img) ? $img : url("no_image.png");
    $_link = isset($link) ? $link : "javascript:;";

    $_title = Str::of($_title)->limit($_max);

@endphp<div class="d-flex align-items-center">
    <a href="{{ $_link }}" class="symbol symbol-50px">
        <span class="symbol-label" style="background-image:url({{$_img}});"></span>
    </a>
    <div class="ms-5">
        <a href="{{ $_link }}"
            class="text-gray-800 text-hover-primary fs-5 fw-bolder"
            data-kt-ecommerce-product-filter="product_name">{{ $_title }}</a> 
    </div>
</div>
