<?php
$title = isset($title) && strlen($title) > 2 ? $title : 'No title';
$has_image = isset($image) && $image != null && $image != 'null' && strlen($image) > 2 ? true : false;
$image = $has_image ? $image : '';

$has_sub_title = isset($sub_title) && strlen($sub_title) > 2 ? true : false;
$sub_title = $has_sub_title ? $sub_title : '';

?><div class="d-flex align-items-center">
    <div class="me-5 position-relative">
        @if ($has_image) 

        <div class="symbol symbol-35px me-4">
            <div class="symbol symbol-35px symbol-circle">
                <img alt="Pic" src="{{$image}}" /> 
            </div> 
        </div>
 
        @else
            <div class="symbol symbol-40px symbol-circle">
                <span
                    class="symbol-label bg-light-primary text-primary fw-bold text-uppercase">{{ Str::substr($title, 0, 2) }}</span>

            </div>
        @endif
    </div>
    <div class="d-flex flex-column justify-content-center">
        <span class="mb-1 text-gray-800 text-hover-primary">{{ $title }}</span>
        @if ($has_sub_title)
            <div class="fw-bold fs-6 text-gray-400">{{$sub_title}}</div>
        @endif
    </div>
</div>
