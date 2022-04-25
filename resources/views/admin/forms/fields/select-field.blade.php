<?php
$name = isset($name) && strlen($name) > 0 ? $name : 'name';
$value = isset($value) && strlen($value) > 0 ? $value : '';
$label = isset($label) && strlen($label) > 0 ? $label : 'label';
$attributes = isset($attributes) && count($attributes) > 0 ? $attributes : [];
$options = isset($options) && count($options) > 0 ? $options : [];
$required = isset($required) ? $required : '';

?>
<div class="fv-row mb-10">
    <label class="d-flex align-items-center fs-5 fw-bold mb-2" for="{{ $name }}">
        <span class="{{ $required }}">{{ $label }}</span>

    </label>
 
    <select id="{{ $name }}" @foreach ($attributes as $k => $val) {{ $k . '=' . $val }} @endforeach
        class="form-select form-select-solid" data-placeholder="Select an option" name="{{ $name }}"  data-control="select2">
        <option></option>
        @foreach ($options as $key => $item)
            <option value="{{ $key }}">{{ $item }}</option>
        @endforeach
    </select>

 
</div>
