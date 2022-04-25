<?php
$name = isset($name) && strlen($name) > 0 ? $name : 'name';
$value = isset($value) && strlen($value) > 0 ? $value : '';
$label = isset($label) && strlen($label) > 0 ? $label : 'label';
$attributes = isset($attributes) && count($attributes) > 0 ? $attributes : [];
$options = isset($options) && count($options) > 0 ? $options : [];
$required = isset($required) ? $required : '';

?>
<div class="fv-row mb-0">
    <label class="d-flex align-items-center fs-5 fw-bold mb-5" for="{{ $name }}">
        <span class="{{ $required }}">{{ $label }}</span>

    </label>
    <div class="image-input image-input-empty" data-kt-image-input="true"
        style="background-image: url({{ url('no_image.jpg') }})">
        <!--begin::Image preview wrapper-->
        <div class="image-input-wrapper w-125px h-125px"></div>
        <!--end::Image preview wrapper-->

        <!--begin::Edit button-->
        <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
            data-kt-image-input-action="change" data-bs-toggle="tooltip" data-bs-dismiss="click"
            title="Change {{ $label }}">
            <i class="bi bi-pencil-fill fs-7"></i>

            <!--begin::Inputs-->
            <input type="file" id="{{ $name }}" name={{ $name }} accept=".png, .jpg, .jpeg" />
            <input type="hidden" name="{{ $name }}_remove" />
            <!--end::Inputs-->
        </label>
        <!--end::Edit button-->

        <!--begin::Cancel button-->
        <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
            data-kt-image-input-action="cancel" data-bs-toggle="tooltip" data-bs-dismiss="click"
            title="{{ $label }}">
            <i class="bi bi-x fs-2"></i>
        </span>
        <!--end::Cancel button-->

        <!--begin::Remove button-->
        <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
            data-kt-image-input-action="remove" data-bs-toggle="tooltip" data-bs-dismiss="click"
            title="Remove {{ $label }}">
            <i class="bi bi-x fs-2"></i>
        </span>
        <!--end::Remove button-->
    </div>
</div>
