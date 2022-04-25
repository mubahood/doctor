<?php
use App\Models\Category;

$categories = [];
$cats = Category::all();
foreach ($cats as $key => $cat) {
    if (((int) $cat->parent) < 1) {
        continue;
    }
    $cats[$cat->id] = $cat->name;
}
?>

@extends('admin.forms.form-layout')
@section('title', 'Creating - Product category')
@section('action', admin_url('/categories'))


@section('content')
    <div class="row">
        <div class="col-md-4">
            @include('admin.forms.fields.input-field', [
                'name' => 'name',
                'value' => '',
                'required' => 'required',
                'label' => 'Category name',
                'attributes' => [
                    'type' => 'text',
                ],
            ])
        </div>

        <div class="col-md-4">
            @include('admin.forms.fields.select-field', [
                'name' => 'parent_id',
                'value' => '',
                'options' => $cats,
                'label' => 'Parent category',
                'attributes' => [],
            ])
        </div>

        <div class="col-md-4">
            @include('admin.forms.fields.input-field', [
                'name' => 'description',
                'value' => '',
                'required' => 'required',
                'label' => 'Category description',
                'attributes' => [
                    'type' => 'text',
                ],
            ])
        </div>


    </div>

    <div class="row">
        <div class="col-12">
            @include('admin.forms.fields.image-field', [
                'name' => 'description',
                'value' => '',
                'label' => 'Category photo',
                'attributes' => [
                    'type' => 'text',
                ],
            ])
        </div>
    </div>

@endsection
