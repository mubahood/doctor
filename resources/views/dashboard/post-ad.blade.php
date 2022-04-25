@extends('layouts.layout')



@section('head')

 
{{--
<link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/ad-post.css') }}">
<link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/bootstrap-icons.min.css') }} " />
<link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/fileinput.css') }} " /> --}}
{{--
<link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/fontawesome.css') }} " /> --}}
{{--
<link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/theme.css') }} " /> --}}

@endsection

@section('content')
@php
use App\Models\Category;
use App\Models\Country;
use App\Models\City;
$seg = request()->segment(2);
$cats = Category::where('slug', $seg)->firstOrFail();
$countries = Country::all();
$cities = City::all();
@endphp
<section class="adpost-part pt-0">
    <div class="container">



        <div class="row">
            <div class="col-lg-10">
                <form method="POST" action="{{ url('post-ad') }}" enctype="multipart/form-data" class="adpost-form">
                    @csrf
                    <input type="text" name="category_id" id="category_id" value="{{ $cats->id }}" hidden>

                    <div class="adpost-card mt-4">
                        <div class="row border-bottom pb-3 mb-3">
                            <div class="col-md-6">
                                <div class="">
                                    <h4>Fill in the details</h4>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class=" text-right text-dark">
                                    <img width="20" src="{{URL::asset('storage')." /".$cats->image}}"> {{ $cats->name }}
                                </div>
                            </div>
                        </div>

                        <div class="row " style="margin-top: 2rem">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">



                                @foreach ($cats->attributes as $item)
                                <div class="row">
                                    <div class="col-lg-12">

                                        @if ($item->type == "checkbox")
                                        <div class="form-group"><label class="form-label" for="{{ $item->name }}">
                                                @if ($item->is_required)
                                                <span class="text-danger">*</span>
                                                @endif
                                                {{$item->name}}
                                            </label>
                                            @php
                                            $_options = (explode(",",$item->options));
                                            @endphp
                                            <div class="row">
                                                @for ($i = 0; $i < count($_options); $i++) <div class="col-md-4">
                                                    <small class="d-block">
                                                        <input type="checkbox" value="{{ $_options[$i]  }}"
                                                            id="{{ $_options[$i] }}" name="{{ " __".$item->id."[]" }}"
                                                        @if ($item->is_required)
                                                        required
                                                        @endif >
                                                        <label for="{{ $_options[$i] }}">{{ $_options[$i] }}</label>
                                                    </small>
                                            </div>
                                            @endfor
                                        </div>
                                        @error('name')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    @endif

                                    @if ($item->type == "radio")
                                    <div class="form-group">
                                        <label class="form-label" for="{{ $item->name }}">
                                            @if ($item->is_required)
                                            <span class="text-danger">*</span>
                                            @endif
                                            {{$item->name}}
                                        </label>

                                        @php
                                        $_options = (explode(",",$item->options));
                                        @endphp
                                        @for ($i = 0; $i < count($_options); $i++) <small class="d-block">
                                            <input type="radio" value="{{ $_options[$i] }}" id="{{ $_options[$i] }}"
                                                name="{{ " __".$item->id }}"
                                            @if ($item->is_required)
                                            required
                                            @endif >
                                            <label for="{{ $_options[$i] }}">{{ $_options[$i] }}</label>
                                            </small>
                                            @endfor
                                            @error('name')
                                            <div class="alert alert-danger">{{ $message }}</div>
                                            @enderror
                                    </div>
                                    @endif


                                    @if ($item->type == "select")
                                    <div class="form-group"><label class="form-label" for="{{ $item->name }}">
                                            @if ($item->is_required)
                                            <span class="text-danger">*</span>
                                            @endif
                                            {{$item->name}}
                                        </label>

                                        <select value="{{ old(" __".$item->id ) }}" id="{{ $item->name }}"
                                            name="{{ "__".$item->id }}" @if ($item->is_required)
                                            required
                                            @php
                                            $_options = (explode(",",$item->options));
                                            @endphp
                                            @endif class="form-control">
                                            <option value=""></option>
                                            @for ($i = 0; $i < count($_options); $i++) <option
                                                value="{{$_options[$i]}}">{{$_options[$i]}}</option>
                                                @endfor
                                        </select>
                                        @error('name')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    @endif

                                    @if ($item->type == "text")
                                    <div class="form-group"><label class="form-label" for="{{ $item->name }}">
                                            @if ($item->is_required)
                                            <span class="text-danger">*</span>
                                            @endif
                                            {{$item->name}}
                                        </label>

                                        <input type="text" value="{{ old(" __".$item->id ) }}" id="{{ $item->name }}"
                                        name="{{ "__".$item->id }}" @if ($item->is_required)
                                        required
                                        @endif class="form-control">
                                        @error('name')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    @endif

                                    @if($item->type == "number")
                                    <div class="form-group"><label class="form-label" for="{{ $item->name }}">
                                            @if ($item->is_required)
                                            <span class="text-danger">*</span>
                                            @endif
                                            {{$item->name}}

                                            @if ($item->units)
                                            <small>({{$item->units}})</small>
                                            @endif
                                        </label>
                                        <input type="number" value="{{ old(" __".$item->id ) }}" id="{{ $item->name }}"
                                        name="{{ "__".$item->id }}" @if ($item->is_required)
                                        required
                                        @endif class="form-control">
                                        @error('name')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    @endif

                                    @if($item->type == "textarea")
                                    <div class="form-group"><label class="form-label" for="{{ $item->name }}">
                                            @if ($item->is_required)
                                            <span class="text-danger">*</span>
                                            @endif

                                            {{$item->name}}

                                            @if ($item->units)
                                            <small>({{$item->units}})</small>
                                            @endif
                                        </label>
                                        <textarea name="{{ " __".$item->id }}" id="{{ $item->name }}" @if ($item->is_required)
                                                required
                                                @endif class="form-control">{{ old("__".$item->id ) }}</textarea>
                                        @error('name')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    @endif

                                </div>


                            </div>
                            @endforeach


                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group"><label class="form-label" for="name">Product title
                                        </label><input type="text" class="form-control" id="name" required name="name"
                                            placeholder="Enter your pricing amount">
                                        @error('name')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group"><label class="form-label">Product photos</label>
                                        <input type="file" id="input-b6a" name="images[]" required
                                            accept=".jpeg,.jpg,.png,.gif" required
                                            data-allowed-file-extensions='["jpeg", "jpg","png","gif"]' multiple>
                                        @error('images')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"><label class="form-label">Country</label>
                                        <select name="country_id" required class="form-control  custom-select"
                                            id="countries">
                                            <option selected>Select Country</option>
                                            @foreach ($countries as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('country_id')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"><label for="city_id" class="form-label">City</label>
                                        <select name="city_id" class="form-control  custom-select" required
                                            id="city_id">
                                            <option selected>Select city</option>
                                            @foreach ($cities as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('city_id')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group"><label class="form-label" for="price">
                                            Price (in UGX)</label><input type="number" class="form-control" id="price" required
                                            name="price" placeholder="Enter your pricing amount">
                                        @error('price')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group"><label class="form-label">Service
                                            description</label><textarea class="form-control"
                                            placeholder="Describe your service here" required
                                            value="{{ old('description') }}" name="description"></textarea>
                                        @error('description')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>

                            </div>

                            <div class="row mb-5">
                                <div class="col-12">
                                    <button class="btn btn-primary btn-lg float-right"><i
                                            class="fas fa-check-circle"></i><span>Upload
                                            Product</span></button>
                                </div>

                            </div>
                        </div>



                        <div class="col-md-2"></div>
                    </div>

            </div>



            </form>
        </div>
    </div>
    </div>
</section>

@endsection
<script>
    window.addEventListener('DOMContentLoaded', (event) => {

   


        $("#input-b6a").fileinput({
            dropZoneEnabled: false,
             maxFileCount: 10,
            uploadUrl: "http://localhost/file-upload.php",
            enableResumableUpload: true,
            resumableUploadOptions: {
               // uncomment below if you wish to test the file for previous partial uploaded chunks
               // to the server and resume uploads from that point afterwards
               // testUrl: "http://localhost/test-upload.php"
            },
            uploadExtraData: {
                'uploadToken': 'SOME-TOKEN', // for access control / security 
            },
            maxFileCount: 5,
            allowedFileTypes: ['image'],    // allow only images
            showCancel: true,
            initialPreviewAsData: true,
            overwriteInitial: false,
            // initialPreview: [],          // if you have previously uploaded preview files
            // initialPreviewConfig: [],    // if you have previously uploaded preview files
            theme: 'fas',

        }).on('fileuploaded', function(event, previewId, index, fileId) {
            console.log('File Uploaded', 'ID: ' + fileId + ', Thumb ID: ' + previewId);
        }).on('fileuploaderror', function(event, data, msg) {
            console.log('File Upload Error', 'ID: ' + data.fileId + ', Thumb ID: ' + data.previewId);
        }).on('filebatchuploadcomplete', function(event, preview, config, tags, extraData) {
            console.log('File Batch Uploaded', preview, config, tags, extraData);
        });
 

        const countries = $("#countries");
            const cities = JSON.parse('<?php echo json_encode($cities); ?>');
            countries.change(function(event) {
                console.clear()
                const country_id = event.currentTarget.options.selectedIndex;
                $("#city_id").empty();
                var option = $('<option></option>').text('');
                $("#city_id").append(option); 
                cities.forEach(element => {
                    if (country_id == element.country_id) {
                        var option = $('<option></option>').attr("value", element.id).text(element.name);
                        $("#city_id").append(option); 
                    }
                });
 
            }); 
    });
</script>
@section('foot')



<script src="{{ url('vendor/laravel-admin/bootstrap-fileinput/js/fileinput.min.js?v=4.5.2') }} " type="text/javascript">
</script>
<script src="{{ url('vendor/laravel-admin/AdminLTE/bootstrap/js/bootstrap.min.js') }} " type="text/javascript"></script>
<script src="{{ url('vendor/laravel-admin/sweetalert2/dist/sweetalert2.min.js') }} " type="text/javascript"></script>
{{-- <script src="{{ URL::asset('/assets/js/vendor/fileinput.min.js') }}" type="text/javascript"></script>
<script src="{{ URL::asset('/assets/js/vendor/sortable.js') }}" type="text/javascript"></script>
<script src="{{ URL::asset('/assets/js/vendor/fileinput.js') }}" type="text/javascript"></script>
<script src="{{ URL::asset('/assets/js/vendor/es.js') }}" type="text/javascript"></script>
<script src="{{ URL::asset('/assets/js/vendor/fr.js') }}" type="text/javascript"></script>
<script src="{{ URL::asset('/assets/js/vendor/theme.js') }}" type="text/javascript"></script> --}}
@endsection