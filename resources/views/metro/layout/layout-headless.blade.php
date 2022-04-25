@extends('metro.layout.base-layout')
<body id="kt_body" class="" style="">
    <div class="d-flex flex-column flex-root">
        <div class="page d-flex flex-row flex-column-fluid">
            <div class="wrapper d-flex flex-column flex-row-fluid bf-dark" id="kt_wrapper">
                @yield('content')
            </div>
        </div>
    </div>
</body>
