@php

$_title = isset($title) ? $title : 'No title';
$_img = isset($item) ? $item->get_thumbnail() : 'no_image.jpg';
$_link = isset($item) ? url($item->slug) : 'javascript:;';
@endphp
<a href="{{ $_link }}">
    <img src="{{ $_img }}" class="img-fluid ml-2 ml-md-5 mr-2 mr-md-5 " alt="{{ $_title }}">
    <h3 class="text-center mb-2 mb-md-5 text-gray-700 h2">{{ $_title }}</h3>
</a>
