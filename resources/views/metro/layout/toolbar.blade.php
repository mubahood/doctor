@php
$seg = request()->segment(2);
@endphp<div class="toolbar" id="kt_toolbar">
    <div id="kt_toolbar_container" class="container-fluid d-flex flex-stack">
        <div data-kt-swapper="true" data-kt-swapper-mode="prepend"
            data-kt-swapper-parent="{default: '#kt_content_container', 'lg': '#kt_toolbar_container'}"
            class="page-title d-flex align-items-center flex-wrap me-3 mb-5 mb-lg-0">
            <h1 class="d-flex align-items-center text-dark fw-bolder fs-3 my-1 text-capitalize">
                {{ $seg }}
            </h1>

        </div>
        <div class="d-flex align-items-center gap-2 gap-lg-3">
            @yield('tools')
        </div>
    </div>
</div>
