<?php
use App\Models\MenuItem;
$_options = [];
$menus = MenuItem::where([])
    ->orderBy('order', 'Asc')
    ->get();
foreach ($menus as $key => $value) {
    $parent_id = (int) $value->parent_id;
    if ($parent_id < 1) {
        $_options[$value->id] = $value->title;
    }
}

$edit_item = new MenuItem();
$id = ((int) Request::segment(3));
if ($id > 0) {
    $edit_item = MenuItem::find($id);
}
if ($edit_item == null) {
    $edit_item = new MenuItem();
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
                    title: 'Are you sure you want to delete this item?',
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
                                window.location.reload();
                            }

                        )
                    }
                })
            });

            function delete_item(id) {
                var url = "{{ url('/dashboard/menu') }}";
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
                var url = "{{ url('/dashboard/menu') }}";
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
                <div class="caord-header">
                    <h2 class="card-title">Menu items</h2>
                </div>
                <div class="card-body">
                    <div id="menu-tree" class="dd">
                        <ol class="dd-list">
                            @foreach ($menus as $item)
                                @if (((int) $item->parent_id) < 1)
                                    <li class="dd-item" data-id="{{ $item->id }}">
                                        <div class="dd-handle d-flex justify-content-between align-items-center">
                                            <span>{{ $item->title }}</span>
                                            <span>
                                                <a class="dd-nodrag"
                                                    href="{{ url('dashboard/menu/' . $item->id) }}">Edit</a>
                                                <a class="dd-nodrag text-danger delete" data-id="{{ $item->id }}"
                                                    href="#">Delete</a>
                                            </span>
                                        </div>
                                        @php
                                            $kids = MenuItem::where('parent_id', $item->id)->get();
                                        @endphp
                                        @if (count($kids) > 0)
                                            <ol class="dd-list">
                                                @foreach ($kids as $kid)
                                                    <li class="dd-item" data-id="{{ $kid->id }}">
                                                        <div
                                                            class=" dd-handle d-flex justify-content-between align-items-center">
                                                            <span>{{ $kid->title }}</span>
                                                            <span>
                                                                <a class="dd-nodrag"
                                                                    href="{{ url('dashboard/menu/' . $kid->id) }}">Edit</a>
                                                                <a class="dd-nodrag text-danger  delete"
                                                                    data-id="{{ $item->id }}" href="#">Delete</a>
                                                            </span>
                                                        </div>

                                                    </li>
                                                @endforeach
                                            </ol>
                                        @endif

                                    </li>
                                @endif
                            @endforeach


                        </ol>
                    </div>
                    <div class="card-footer">
                        <button type="button" id="menu-tree-save" class="btn btn-primary float-right">Submit</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <form id="widget-form-62518c21c450d" method="POST" action="{{ url('dashboard/menu') }}"
                class="form-horizontal" accept-charset="UTF-8">
                @csrf

                @if ($id > 0)
                    <input type="hidden" value="{{ $id }}" name="edit">
                @else
                    <input type="hidden" value="{{ $id }}" name="create">
                @endif
                <div class="card shadow-sm ">
                    <div class="card-header">
                        <h2 class="card-title">Create</h2>
                    </div>

                    <div class="card-body">
                        @include('metro.components.input-select', [
                            'label' => 'Parent',
                            'value' => $edit_item->parent_id,
                            'options' => $_options,
                            'attributes' => [
                                'name' => 'parent_id',
                                'type' => 'text',
                            ],
                        ])
                        <br>
                        @include('metro.components.input-text', [
                            'label' => 'Title',
                            'required' => 'required',
                            'value' => $edit_item->title,
                            'attributes' => [
                                'name' => 'title',
                                'type' => 'text',
                            ],
                        ])


                        <br>
                        @include('metro.components.input-text', [
                            'label' => 'Icon',
                            'required' => 'required',
                            'value' => $edit_item->icon,
                            'attributes' => [
                                'name' => 'icon',
                                'type' => 'text',
                            ],
                        ])

                        <br>
                        @include('metro.components.input-text', [
                            'label' => 'Slug',
                            'required' => 'required',
                            'value' => $edit_item->uri,
                            'attributes' => [
                                'name' => 'uri',
                                'type' => 'text',
                            ],
                        ])

                        <br>
                        @include('metro.components.input-select', [
                            'label' => 'Role',
                            'value' => $edit_item->parent_id,
                            'options' => [
                                'admin' => 'Admin',
                                'doctor' => 'Doctor',
                                'user' => 'Client',
                                'both' => 'All',
                            ],
                            'attributes' => [
                                'name' => 'role',
                                'type' => 'text',
                            ],
                        ])


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
