<?php
use App\Models\MenuItem;
use App\Models\Chat;
use App\Models\User;
use App\Models\Category;
use App\Models\Country;

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

$_locations = [];
$countries = Country::where([])
    ->orderBy('name', 'Asc')
    ->get();
foreach ($countries as $key => $c) {
    foreach ($c->cities as $_key => $_c) {
        $_locations[$_c->id] = $c->name . ' - ' . $_c->name;
    }
}

$chat_threads = Chat::get_chat_threads($u->id);

$item = new User();
$item = $u;
// $u->name = 'Muhindo';	
// $u->name = 'Muhindo';	
// $u->last_name = 'Mubarak';	
// $u->phone_number = '+8801632257698';	
// $u->company_name = 'Muhindo and sons';	
// $u->category_id = 1;	
// $u->services = 'My services details go here';	
// $u->about = 'About my business';
// $u->sub_county = 1;	
// $u->district = 'Kasese';
	

?>@extends('metro.layout.layout-dashboard')
@section('header')
@endsection
@section('dashboard-content')
    <form id="form" action="{{ url('dashboard/profile') }}" class="form d-flex flex-column flex-lg-row" method="POST"
        enctype="multipart/form-data">
        @csrf

        <input type="hidden" hidden name="id" value="{{ $u->id }}">

        <input type="hidden" name="task" value="create">
        <div class="d-flex flex-column gap-7 gap-lg-10 w-100 w-lg-300px mb-7 me-lg-10">
            <!--begin::Thumbnail settings-->
            <div class="card card-flush py-4">
                <!--begin::Card header-->
                <div class="card-header">
                    <!--begin::Card title-->
                    <div class="card-title">
                        <h2>Your Logo</h2>
                    </div>
                    <!--end::Card title-->
                </div>
                <!--end::Card header-->
                <!--begin::Card body-->
                <div class="card-body text-center pt-0">
                    <!--begin::Image input-->
                    <div class="image-input image-input-empty image-input-outline mb-3" data-kt-image-input="true"
                        style="background-image: url(assets/media/svg/files/blank-image.svg)">
                        <!--begin::Preview existing avatar-->
                        <div class="image-input-wrapper w-150px h-150px"></div>
                        <!--end::Preview existing avatar-->
                        <!--begin::Label-->
                        <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                            data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                            <i class="bi bi-pencil-fill fs-7"></i>
                            <!--begin::Inputs-->
                            <input type="file" name="avatar" accept=".png, .jpg, .jpeg" />
                            <input type="hidden" name="avatar_remove" />
                            <!--end::Inputs-->
                        </label>
                        <!--end::Label-->
                        <!--begin::Cancel-->
                        <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                            data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="Cancel avatar">
                            <i class="bi bi-x fs-2"></i>
                        </span>
                        <!--end::Cancel-->
                        <!--begin::Remove-->
                        <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                            data-kt-image-input-action="remove" data-bs-toggle="tooltip" title="Remove avatar">
                            <i class="bi bi-x fs-2"></i>
                        </span>
                        <!--end::Remove-->
                    </div>
                    <!--end::Image input-->
                    <!--begin::Description-->
                    <div class="text-muted fs-7">Set your company profile image. Only *.png, *.jpg and *.jpeg image files
                        are accepted</div>
                    <!--end::Description-->
                </div>
                <!--end::Card body-->
            </div>

        </div>
        <!--end::Aside column-->
        <!--begin::Main column-->
        <div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10">
            <!--begin:::Tabs-->
            <ul class="nav nav-custom nav-tabs nav-line-tabs nav-line-tabs-2x border-0 fs-4 fw-bold mb-n2">
                <!--begin:::Tab item-->
                <li class="nav-item">
                    <a class="nav-link text-active-primary pb-4 active" data-bs-toggle="tab"
                        href="#kt_ecommerce_add_product_general">Profile info</a>
                </li>
                <!--end:::Tab item-->
                <!--begin:::Tab item-->
                <li class="nav-item">
                    <a class="nav-link text-active-primary pb-4" data-bs-toggle="tab"
                        href="#kt_ecommerce_add_product_advanced">Account info</a>
                </li>
                <!--end:::Tab item-->
            </ul>
            <!--end:::Tabs-->
            <!--begin::Tab content-->
            <div class="tab-content">
                <!--begin::Tab pane-->
                <div class="tab-pane fade show active" id="kt_ecommerce_add_product_general" role="tab-panel">
                    <div class="d-flex flex-column gap-7 gap-lg-10">
                        <!--begin::General options-->
                        <div class="card card-flush py-2">

                            <div class="card-header">
                                <div class="card-title">
                                    <h2>Profile info</h2>
                                </div>
                            </div>

                            <div class="card-body ">
                                <div class="mb-3 row">
                                    <div class="col-md-4">
                                        @include('metro.components.input-text', [
                                            'label' => 'Surname',
                                            'required' => 'required',
                                            'hint' => 'What\'s your surname?',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->name,
                                            'attributes' => [
                                                'name' => 'name',
                                                'type' => 'text',
                                            ],
                                        ])
                                    </div>
                                    <div class="col-md-4 ">
                                        @include('metro.components.input-text', [
                                            'label' => 'Last name',
                                            'required' => 'required',
                                            'hint' => 'What\'s your last name?',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->last_name,
                                            'attributes' => [
                                                'name' => 'last_name',
                                                'type' => 'text',
                                            ],
                                        ])
                                    </div>
                                    <div class="col-md-4 ">
                                        @include('metro.components.input-text', [
                                            'label' => 'Phone number',
                                            'required' => 'required',
                                            'hint' => 'What\'s your contact?',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->phone_number,
                                            'attributes' => [
                                                'name' => 'phone_number',
                                                'type' => 'tel',
                                            ],
                                        ])
                                    </div>
                                </div>


                                <div class="mb-3 row">
                                    <div class="col-md-4">
                                        @include('metro.components.input-text', [
                                            'label' => 'Farm/Group/Enterprise name',
                                            'required' => 'required',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->company_name,
                                            'attributes' => [
                                                'name' => 'company_name',
                                                'type' => 'text',
                                            ],
                                        ])
                                    </div>

                                    <div class="col-md-4">
                                        @include('metro.components.input-select', [
                                            'label' => 'Product category',
                                            'value' => $item->category_id,
                                            'required' => 'required',
                                            'options' => $_categories,
                                            'hint' => 'What\'s your main operation field?',
                                            'classes' => ' form-select-sm mb-0 ',
                                            'attributes' => [
                                                'name' => 'category_id',
                                            ],
                                        ])
                                    </div>

                                    <div class="col-md-4 ">
                                        @include('metro.components.input-text', [
                                            'label' => 'Other services',
                                            'hint' => 'Which other things do you deal in?',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->services,
                                            'attributes' => [
                                                'name' => 'services',
                                                'type' => 'tel',
                                            ],
                                        ])
                                    </div>
                                </div>


                                <div>
                                    <label class="form-label">Details About your farm/enterprise </label>
                                    <div id="kt_ecommerce_add_product_description"
                                        name="kt_ecommerce_add_product_description" class="min-h-200px mb-2">
                                        {!! $item->about !!}
                                    </div>
                                    <div class="text-muted fs-7">Set a description to the about for better visibility on
                                        internet.</div>
                                </div>



                                <div class="mb-3 row">


                                    <div class="col-md-4 mt-5">
                                        @include('metro.components.input-select', [
                                            'label' => 'Farm/emterprise Location',
                                            'required' => 'required',
                                            'value' => $item->sub_county,
                                            'options' => $_locations,
                                            'hint' => 'Whare is your farm/emterprise?',
                                            'classes' => ' form-select-sm mb-0 ',
                                            'attributes' => [
                                                'name' => 'sub_county',
                                            ],
                                        ])
                                    </div>

                                    <div class="col-md-8 mt-5">
                                        @include('metro.components.input-text', [
                                            'label' => 'Address line',
                                            'required' => 'required',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->address,
                                            'attributes' => [
                                                'name' => 'address',
                                                'type' => 'text',
                                            ],
                                        ])
                                    </div>

                                </div>

                            </div>
                        </div>

                        <div class="card card-flush py-4">
                            <div class="card-header">
                                <div class="card-title">
                                    <h2>Social Media</h2>
                                </div>
                            </div>
                            <div class="card-body pt-0">
                                <!--begin::Input group-->

                                <div class="mb-3 row">
                                    <div class="col-md-4">
                                        @include('metro.components.input-text', [
                                            'label' => 'Facebook profile link',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->facebook,
                                            'attributes' => [
                                                'name' => 'facebook',
                                                'type' => 'text',
                                            ],
                                        ])
                                    </div>

                                    <div class="col-md-4">
                                        @include('metro.components.input-text', [
                                            'label' => 'Twitter profile link',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->twitter,
                                            'attributes' => [
                                                'name' => 'twitter',
                                                'type' => 'text',
                                            ],
                                        ])
                                    </div>

                                    <div class="col-md-4">
                                        @include('metro.components.input-text', [
                                            'label' => 'Whatsapp number',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->whatsapp,
                                            'attributes' => [
                                                'name' => 'whatsapp',
                                                'type' => 'text',
                                            ],
                                        ])
                                    </div>


                                </div>


                                <div class="mb-3 row">
                                    <div class="col-md-4 mt-3">
                                        @include('metro.components.input-text', [
                                            'label' => 'Youtube channel link',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->youtube,
                                            'attributes' => [
                                                'name' => 'youtube',
                                                'type' => 'text',
                                            ],
                                        ])
                                    </div>

                                    <div class="col-md-4 mt-3">
                                        @include('metro.components.input-text', [
                                            'label' => 'Instagram profile link',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->instagram,
                                            'attributes' => [
                                                'name' => 'instagram',
                                                'type' => 'text',
                                            ],
                                        ])
                                    </div>

                                    <div class="col-md-4 mt-3">
                                        @include('metro.components.input-text', [
                                            'label' => 'Linkedin profile link',
                                            'classes' => ' form-control-sm mb-0 ',
                                            'value' => $item->linkedin,
                                            'attributes' => [
                                                'name' => 'linkedin',
                                                'type' => 'text',
                                            ],
                                        ])
                                    </div>


                                </div>
                                <div class="text-muted fs-7">How can you be found on social media?</div>
                                <!--end::Description-->
                            </div>
                            <!--end::Card header-->
                        </div>

                    </div>
                </div>
                <!--end::Tab pane-->
                <!--begin::Tab pane-->
                <div class="tab-pane fade" id="kt_ecommerce_add_product_advanced" role="tab-panel">
                    <div class="d-flex flex-column gap-7 gap-lg-10">
                        <!--begin::Inventory-->
                        <div class="card card-flush py-4">
                            <!--begin::Card header-->
                            <div class="card-header">
                                <div class="card-title">
                                    <h2>Account info</h2>
                                </div>
                            </div>
                            <div class="card-body pt-0">
                                <div class="mb-10 fv-row">
                                    <label class="required form-label">Old password</label>
                                    <input type="text" name="sku" class="form-control mb-2" placeholder="SKU Number"
                                        value="" />
                                </div>

                                <div class="mb-10 fv-row">
                                    <label class="required form-label">New password</label>

                                    <div class="d-flex gap-3">
                                        <input type="number" name="shelf" class="form-control mb-2" placeholder="On shelf"
                                            value="" />
                                        <input type="number" name="warehouse" class="form-control mb-2"
                                            placeholder="In warehouse" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!--end::Tab pane-->
            </div>
            <textarea name="about" id="description" hidden class="form-control hidden"></textarea>
            <div class="d-flex justify-content-end">
                <!--begin::Button-->
                <a href="../../demo1/dist/apps/ecommerce/catalog/products.html" id="kt_ecommerce_add_product_cancel"
                    class="btn btn-light me-5">Cancel</a>
                <!--end::Button-->
                <!--begin::Button-->
                <button type="submit" id="kt_ecommerce_add_product_submit" class="btn btn-primary">
                    <span class="indicator-label">Save Changes</span>
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
