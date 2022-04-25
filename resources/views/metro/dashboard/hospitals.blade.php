<?php
use App\Models\Hospital;
use App\Models\Location;

$_options = Location::get_locations();

$edit_item = new Hospital();
$id = ((int) Request::segment(3));
if ($id > 0) {
    $edit_item = Hospital::find($id);
}
if ($edit_item == null) {
    $edit_item = new Hospital();
}

?>@extends('metro.layout.layout-dashboard')

@section('header')
    <link rel="stylesheet" href="{{ url('assets/css/vendor/nestable.css') }}">
@endsection

@section('footer')
    <script src="{{ url('assets/js/vendor/nestable.js') }}"></script>
    <script>
        $(document).ready(function() {


            $('.delete').click(function(e) {

                var id = e.currentTarget.dataset.id;
                e.preventDefault();

                Swal.fire({
                    name: 'Are you sure you want to delete this item?',
                    text: "You won't be able to revert this action!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        delete_item(id)
                        Swal.fire(
                            'Deleted!',
                            'Item has been deleted.',
                            'success'
                        ).then((r) => {
                                window.Hospital.reload();
                            }

                        )
                    }
                })
            });

            function delete_item(id) {
                var url = "{{ url('/dashboard/categories') }}";
                var token = "{{ csrf_token() }}";
                $.post(url, {
                        _token: token,
                        'delete': id
                    },
                    function(data) {

                    });
            }


            $("#menu-tree-save").click(function() {
                var serialize = $('#menu-tree').nestable('serialize');
                var url = "{{ url('/dashboard/categories') }}";
                var token = "{{ csrf_token() }}";

                $.post(url, {
                        _token: token,
                        _order: JSON.stringify(serialize)
                    },
                    function(data) {
                        console.log(data);
                        //$.pjax.reload('#pjax-container');
                        toastr.success('Save succeeded !');
                    });
            });

            $('.dd').nestable({
                maxDepth: 2
            });

        });
    </script>
@endsection
@section('dashboard-content')
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h2 class="card-title">Hospitals</h2>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-stroped ">
                        <thead>
                            <td>#</td>
                            <td>Name</td>
                            <td>Location</td>
                            <td>Doctors</td>
                            <td>Action</td>
                        </thead>
                        <tbody>
                            @foreach (Hospital::all() as $item)
                                <tr>
                                    <td> {{$item->id}} </td>
                                    <td> {{$item->name}} </td>
                                    <td> {{$item->location}} </td>
                                    <td> 11 </td>
                                    <td> 
                                        <a href="{{ url('dashboard/hospitals/'.$item->id) }}" class="text-primary">Edit</a> , 
                                        <a href="{{ url('dashboard/hospitals') }}" class="text-danger">Delete</a>  
                                    
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="card-footer">
                        <button type="button" id="menu-tree-save" class="btn btn-primary float-right">Submit</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <form enctype="multipart/form-data" method="POST" action="{{ url('dashboard/hospitals') }}"
                class="form-horizontal" accept-charset="UTF-8">
                @csrf

                @if ($id > 0)
                    <input type="hidden" value="{{ $id }}" name="edit">
                @else
                    <input type="hidden" value="{{ $id }}" name="create" value="create">
                @endif
                <div class="card shadow-sm ">
                    <div class="card-header">
                        <h2 class="card-title">Create</h2>
                    </div>

                    <div class="card-body">

                        @include('metro.components.input-text', [
                            'label' => 'Name',
                            'required' => 'required',
                            'value' => $edit_item->name,
                            'attributes' => [
                                'name' => 'name',
                                'type' => 'text',
                            ],
                        ])
                        <br>

                        @include('metro.components.input-select', [
                            'label' => 'Hospital location',
                            'value' => $edit_item->location_id,
                            'options' => $_options,
                            'attributes' => [
                                'name' => 'location_id',
                            ],
                        ])
                        <br>
                       

                        <div class="row">
                            <div class="col-md-6">
                                @include('metro.components.input-text', [
                                    'label' => 'GPS Longitude',
                                    'required' => 'required',
                                    'classes' => 'mt-0',
                                    'value' => $edit_item->details,
                                    'attributes' => [
                                        'name' => 'longitude',
                                        'type' => 'text',
                                    ],
                                ])

                            </div>
                            <div class="col-md-6">

                                @include('metro.components.input-text', [
                                    'label' => 'GPS Latitude',
                                    'required' => 'required',
                                    'classes' => 'mt-0',
                                    'value' => $edit_item->details,
                                    'attributes' => [
                                        'name' => 'latitude',
                                        'type' => 'text',
                                    ],
                                ])


                            </div>

                        </div>

                        <br>

                        @include('metro.components.input-text', [
                            'label' => 'Details',
                            'required' => 'required',
                            'classes' => 'mt-0',
                            'value' => $edit_item->details,
                            'attributes' => [
                                'name' => 'details',
                                'type' => 'text',
                            ],
                        ])


                        <div class="image-input image-input-empty image-input-outline mb-3 mt-5" data-kt-image-input="true"
                            style="background-image: url(assets/media/svg/files/blank-image.svg)">
                            <label for="avatar" class="mb-2">Thumbnail</label>
                            <div class="image-input-wrapper w-150px h-150px"></div>
                            <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                                data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                <i class="bi bi-pencil-fill fs-7"></i>
                                <input id="avatar" type="file" name="avatar" accept=".png, .jpg, .jpeg" />
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
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary float-right">Submit</button>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
    </div>

    </div>
@endsection
