@php
$rows = isset($rows) && !empty($rows) ? $rows : [];
$head = isset($head) && !empty($head) ? $head : [];
$delete_link = isset($delete_link) && !empty($delete_link) ? $delete_link : '';

@endphp

@section('tools')
    @include('metro.components.search')
    @if (isset($create_link))
        <a href="{{ $create_link }}" class="btn btn-sm btn-primary">Create</a>
    @endif
@endsection

<div class="card">
    <div class="card-body pt-0">
        <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_customers_table">
            <thead>
                <tr class="text-start text-gray-400 fw-bolder fs-7 text-uppercase gs-0">
                    @foreach ($head as $h)
                        <th>{!! $h !!}</th>
                    @endforeach
                    @if (isset($has_actions) && $has_actions)
                        <th>Actions</th>
                    @endif
                </tr>
            </thead>
            <tbody class="fw-bold text-gray-600">
                @foreach ($rows as $r)
                    @php
                        $id = 0;
                    @endphp
                    <tr>
                        @foreach ($r as $k => $d) 
                            @php
                                if ( $k == 'edit_link' || $k == 'view_link') {
                                    continue;
                                } 
                                if ($id == 0 || $k == 'edit_link') {
                                    $id = $d;
                                    continue;
                                }
                            @endphp
                            <th>{!! $d !!}</th>
                        @endforeach

                        @if (isset($has_actions) && $has_actions)
                            <td class="text-end">
                                <button type="button" class="btn btn-icon   btn-light-primary btn-active-light-primary"
                                    data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
                                    <i class="las la-ellipsis-v fs-1 text-dark"></i>
                                </button>
                                <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-bold fs-7 w-125px py-4"
                                    data-kt-menu="true">
 


                                    @if (isset( $r['view_link'] ))
                                        <div class="menu-item px-3">
                                            <a href="{{ $r['view_link'] }}"
                                                class="menu-link px-3">View</a>
                                        </div>
                                    @endif


                                    @if (isset( $r['edit_link'] ))
                                        <div class="menu-item px-3">
                                            <a href="{{ $r['edit_link'] }}"
                                                class="menu-link px-3">Edit</a>
                                        </div>
                                    @endif

                                    @if (strlen($delete_link) > 3)
                                        <div class="menu-item px-3">
                                            <a data-id="{{ $r[0] }}" href="#"
                                                class="menu-link px-3 text-danger delete">Delete</a>
                                        </div>
                                    @endif

                                </div>
                            </td>
                        @endif

                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

@section('footer')
    <script>
        $(document).ready(function() {
            var t = $('#kt_customers_table');
            t.DataTable();
            var s = $('#s');
            s.keyup(function(e) {
                t.DataTable().search(e.target.value).draw();
            });



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
                var url = "{{ $delete_link }}";
                var token = "{{ csrf_token() }}";
                $.post(url, {
                        _token: token,
                        'delete': id
                    },
                    function(data) {

                    });
            }

        });
    </script>
@endsection
