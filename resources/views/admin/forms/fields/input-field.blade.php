<?php
$name = isset($name) && strlen($name) > 0 ? $name : 'name';
$value = isset($value) && strlen($value) > 0 ? $value : '';
$label = isset($label) && strlen($label) > 0 ? $label : 'label';
$attributes = isset($attributes) && count($attributes) > 0 ? $attributes : [];
$required = isset($required) ? $required : '';

?>
<div class="fv-row mb-10"> 
    <label class="d-flex align-items-center fs-5 fw-bold mb-2" for="{{$name}}">
        <span class="{{$required}}">{{$label}}</span>
        
    </label> 
    <input id="{{$name}}" 
    @foreach ($attributes as $k => $val)
        {{ $k.'='.$val }}
    @endforeach
    class="form-control form-control form-control-solid" name="{{$name}}" value="{{$value}}" {{$required}} />
    <!--end::Input-->
</div>
