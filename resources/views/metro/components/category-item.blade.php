@php
    $_title = isset($title) ? $title : "No title";
    $_img = isset($img) ? $img : "no_image.jpg";
    $_link = isset($link) ? $link : "javascript:;";
@endphp
<img src="{{$_img}}" class="img-fluid ml-2 ml-md-5 mr-2 mr-md-5 rounded-circle" alt="{{$_title}}">
<h3 class="text-center mb-2 mb-md-5 text-gray-700 h2">{{$_title}}</h3>