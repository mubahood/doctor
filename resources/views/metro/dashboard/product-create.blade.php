<?php
use App\Models\MenuItem;
use App\Models\Chat;
use App\Models\Product;
use App\Models\Category;
use App\Models\Country;
use App\Models\User;
use App\Models\Hospital;

$id = (string) Request::segment(3);
$u = Auth::user();

$_categories = [];
$cats = Category::where([])
    ->orderBy('name', 'Asc')
    ->get();
foreach ($cats as $key => $cat) {
    $parent = (int) $cat->parent;
    if ($parent < 1) {
        foreach ($cat->sub_categories as $_key => $sub_cat) {
            $_categories[$sub_cat->id] = $cat->name . ' - ' . $sub_cat->name;
        }
    }
}

$_doctors = [];
$users = User::where([])
    ->orderBy('name', 'Asc')
    ->get();
foreach ($users as $key => $u) {
    $user_type = (string) $u->user_type;
    if ($user_type == 'doctor') {
        $_doctors[$u->id] = $u->name;
    }
}

$_hospitals = [];
$hosps = Hospital::where([])
    ->orderBy('name', 'Asc')
    ->get();
foreach ($hosps as $key => $c) {
    $_hospitals[$c->id] = $c->name;
}

$chat_threads = Chat::get_chat_threads($u->id);

$item = new Product();

$item->name = 'Simple test product';
$item->nature_of_offer = 'For sale';

$item->fixed_price = 'Negotiable';
$item->price = 16000;
$item->quantity = 17;
$item->category_id = 8;
$item->city_id = 2;
$item->description = '<b>Simple Bold</b><span class="bg-danger">red</span><span style="color: nlue">BLUTE</span> Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium beatae eveniet, exercitationem doloribus magnam quam vel omnis quos aperiam quod ipsam aspernatur. Mollitia tempora sunt nisi distinctio reprehenderit praesentium voluptatibus.';

?>@extends('metro.layout.layout-dashboard')
@section('header')
@endsection
@section('dashboard-content')
    <form id="form" action="{{ url('dashboard/products') }}" class="form d-flex flex-column flex-lg-row" method="POST"
        enctype="multipart/form-data">
        @csrf

        <input type="hidden" name="task" value="create">
        <div class="d-flex flex-column gap-7 gap-lg-10 w-100 w-lg-300px mb-7 me-lg-10">
            <!--begin::Thumbnail settings-->
            <div class="card card-flush py-4">
                <div class="card-header">
                    <!--begin::Card title-->
                    <div class="card-title">
                        <h2 class="required">Service photo</h2>
                    </div>
                    <!--end::Card title-->
                </div>
                <div class="card-body text-center pt-0">
                    <div class="image-input image-input-empty image-input-outline mb-3" data-kt-image-input="true"
                        style="background-image: url(assets/media/svg/files/blank-image.svg)">
                        <div class="image-input-wrapper w-150px h-150px"></div>
                        <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                            data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change photo">
                            <i class="bi bi-pencil-fill fs-7"></i>
                            <input type="file" required name="avatar" accept=".png, .jpg, .jpeg" />
                            <input type="hidden" name="avatar_remove" />
                        </label>
                        <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                            data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="Cancel avatar">
                            <i class="bi bi-x fs-2"></i>
                        </span>
                        <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                            data-kt-image-input-action="remove" data-bs-toggle="tooltip" title="Remove avatar">
                            <i class="bi bi-x fs-2"></i>
                        </span>
                    </div>
                </div>
            </div>


        </div>
        <!--end::Aside column-->
        <!--begin::Main column-->
        <div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10">
            <!--begin:::Tabs-->
            <div class="d-flex flex-column gap-7 gap-lg-10">
                <!--begin::General options-->
                <div class="card card-flush py-2">
                    <!--begin::Card header-->
                    <div class="card-header">
                        <div class="card-title">
                            <h2>General</h2>
                        </div>
                    </div>
                    <div class="card-body pt-0">
                        <div class="mb-3 row">
                            <div class="col-md-6">
                                @include('metro.components.input-text', [
                                    'label' => 'Service Name',
                                    'required' => 'required',
                                    'hint' => 'A Service name is required and recommended to be unique.',
                                    'classes' => ' form-control-sm mb-0 ',
                                    'value' => $item->name,
                                    'attributes' => [
                                        'name' => 'name',
                                        'type' => 'text',
                                    ],
                                ])
                            </div>
                            <div class="col-md-6">
                                @include('metro.components.input-select', [
                                    'label' => 'Hosptal',
                                    'required' => 'required',
                                    'value' => $item->hospital_id,
                                    'options' => $_hospitals,
                                    'classes' => ' form-select-sm mb-0 ',
                                    'attributes' => [
                                        'name' => 'city_id',
                                    ],
                                ])
                            </div>
                        </div>



                        <div class="row mt-5">
                            <div class="col-md-4 mb-5">
                                @include('metro.components.input-select', [
                                    'label' => 'Product category',
                                    'value' => $item->category_id,
                                    'required' => 'required',
                                    'options' => $_categories,
                                    'hint' => 'Pick a right category',
                                    'classes' => ' form-select-sm mb-0 ',
                                    'attributes' => [
                                        'name' => 'category_id',
                                    ],
                                ])
                            </div>
                            <div class="col-md-4 mb-5">
                                @include('metro.components.input-select', [
                                    'label' => 'Doctor/Specialist',
                                    'value' => $item->user_id,
                                    'required' => 'required',
                                    'options' => $_doctors,
                                    'classes' => ' form-select-sm mb-0 ',
                                    'attributes' => [
                                        'name' => 'user_id',
                                    ],
                                ])
                            </div>

                            <div class="col-md-4 mb-5">
                                @include('metro.components.input-text', [
                                    'label' => 'Service price',
                                    'required' => 'required',
                                    'hint' => 'Unit price',
                                    'classes' => ' form-control-sm ',
                                    'value' => $item->get_price(),
                                    'attributes' => [
                                        'name' => 'price',
                                        'type' => 'number',
                                    ],
                                ])
                            </div>

                        </div>



                        <div>
                            <label class="form-label">Description</label>
                            <div id="kt_ecommerce_add_product_description" name="kt_ecommerce_add_product_description"
                                class="min-h-200px mb-2">
                                {!! $item->description !!}
                            </div>
                            <div class="text-muted fs-7">Set a description to the product for better visibility.
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <textarea name="description" id="description" hidden class="form-control hidden"></textarea>
            <div class="d-flex justify-content-end">
                <!--begin::Button-->
                <a href="../../demo1/dist/apps/ecommerce/catalog/products.html" id="kt_ecommerce_add_product_cancel"
                    class="btn btn-light me-5">Cancel</a>
                <!--end::Button-->
                <!--begin::Button-->
                <button type="submit" id="kt_ecommerce_add_product_submit" class="btn btn-primary">
                    <span class="indicator-label">Submit</span>
                    <span class="indicator-progress">Please wait...
                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                </button>
            </div>
        </div>
    </form>
@endsection
@section('footer')
    <script src="{{ url('/') }}/assets/js/custom/apps/ecommerce/catalog/save-product.js"></script>
    <script src="{{ url('/') }}/assets/js/widgets.bundle.js"></script>
    <script src="{{ url('/') }}/assets/js/custom/widgets.js"></script>
    <script src="{{ url('/') }}/assets/js/custom/apps/chat/chat.js"></script>
    <script src="{{ url('/') }}/assets/js/custom/utilities/modals/upgrade-plan.js"></script>
    <script src="{{ url('/') }}/assets/js/custom/utilities/modals/create-app.js"></script>
    <script src="{{ url('/') }}/assets/js/custom/utilities/modals/users-search.js"></script>
    <script>
        $description_field = $("#kt_ecommerce_add_product_description");
        $description = $("#description");

        function logSubmit(event) {
            $description.val($description_field.html());
        }

        const form = document.getElementById('form');
        form.addEventListener('submit', logSubmit);

        $(document).ready(function() {


            var myDropzone = new Dropzone("#kt_ecommerce_add_product_media", {
                url: "{{ url('api/upload-temp-file?user_id=' . $u->id) }}", // Set the url for your upload script location
                paramName: "file", // The name that will be used to transfer the file
                maxFiles: 10,
                maxFilesize: 10, // MB
                addRemoveLinks: true,

                accept: function(file, done) {
                    console.log(file);
                    done();
                }
            });

            myDropzone.on("removedfile", function(file) {
                alert('remove triggered');
            });

        });
    </script>
@endsection
