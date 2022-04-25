@extends('metro.layout.base-layout')

<body id="kt_body" class="bg-body">
    <div class="d-flex flex-column flex-root">
        <div class="d-flex flex-column flex-column-fluid bgi-position-y-bottom position-x-center bgi-no-repeat bgi-size-contain bgi-attachment-fixed"
            style="background-color: #F5F6F8">
            <div class="d-flex flex-center flex-column flex-column-fluid p-5 pb-md-10">
                <a href="{{ url("/") }}" class="mb-12">
                    <img alt="Logo" src="{{ url('/') }}/logo.png" class="h-40px" />
                </a>
                <div class="w-md-600px bg-body rounded shadow-lg p-5 py-md-15 px-md-10 mx-auto">
                    @yield('content')
                </div>
            </div>
            <div class="d-flex flex-center flex-column-auto p-10">
                <div class="d-flex align-items-center fw-bold fs-6">
                    <a href="javascript:;" class="text-muted text-hover-primary px-2">About</a>
                    <a href="javascript:;" class="text-muted text-hover-primary px-2">Contact</a>
                    <a href="javascript:;" class="text-muted text-hover-primary px-2">Contact Us</a>
                </div>
            </div>
        </div>
    </div>
</body>
