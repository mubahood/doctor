@extends('metro.layout.layout-dashboard')

@section('dashboard-content')
    <div class="card">
        <div class="card-body">
            {!! $dataTable->table() !!}
        </div>
    </div>
@endsection

@section('footer')
    {{ $dataTable->scripts() }}
 
@endsection
