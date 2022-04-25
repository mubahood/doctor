<?php
use App\Models\Banner;
use App\Models\User;
$show_logo = true;
$u = auth()->user();
if ($u == null) {
    $u = new User();
}

$acive_classes = ' active bg-light border-bottom border-5 fw-bolder border-primary rounded-0 ';

$banners_all = Banner::all();
$banners_1 = [];
$banners_2 = [];
$banners_3 = [];
$banners_3_tab_active = '';
$banners_2_tab_active = '';
$banners_1_tab_active = '';

$tab_seg = (int) request()->segment(2);

foreach ($banners_all as $key => $value) {
    if ($value->id < 17) {
        if ($value->id < 17) {
            $banners_1[] = $value;
            if ($tab_seg == ((int) $value->id)) {
                $banners_1_tab_active = 'my-active-menu';
            }
        }
    } elseif ($value->id < 17 * 2) {
        $banners_2[] = $value;
        if ($tab_seg == ((int) $value->id)) {
            $banners_2_tab_active = 'my-active-menu';
        }
    } elseif ($value->id < 17 * 3) {
        $banners_3[] = $value;
        if ($tab_seg == ((int) $value->id)) {
            $banners_3_tab_active = 'my-active-menu';
        }
    }
}

/*
    "id" => 1
    "created_at" => "2022-02-25 14:04:35"
    "updated_at" => "2022-03-02 16:28:32"
    "section" => "Section #1"
    "position" => "1"
    "name" => "Branding"
    "sub_title" => "Trending Travel Mug"
    "type" => "Category"
    "category_id" => "1"
    "product_id" => "1"
    "image" => "public/storage/slide_1.png"
    "clicks" => "1"
    */

?>
<div id="kt_header" style="" class="header align-items-stretch">
    <div class="container-xxl d-flex align-items-stretch justify-content-between">
        @if (request()->segment(1) != 'dashboard')
            <div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0 me-lg-15">
                <a href="{{ url('/') }}">
                    <img alt="Logo" src="{{ url('/') }}/logo.png" class="h-30px h-lg-30px" />
                </a>
            </div>
        @endif

        <div class="d-flex align-items-stretch justify-content-between flex-lg-grow-1">
            <div class="d-flex align-items-stretch" id="kt_header_nav">
                @if (request()->segment(1) != 'dashboard')
                    <div class="header-menu align-items-stretch" data-kt-drawer="true" data-kt-drawer-name="header-menu"
                        data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true"
                        data-kt-drawer-width="{default:'200px', '300px': '250px'}" data-kt-drawer-direction="end"
                        data-kt-drawer-toggle="#kt_header_menu_mobile_toggle" data-kt-swapper="true"
                        data-kt-swapper-mode="prepend"
                        data-kt-swapper-parent="{default: '#kt_body', lg: '#kt_header_nav'}">
                        <div class="menu menu-lg-rounded menu-column menu-lg-row menu-state-bg menu-title-gray-700 menu-state-title-primary menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-400 fw-bold my-5 my-lg-0 align-items-stretch"
                            id="#kt_header_menu" data-kt-menu="true">
                            <div data-kt-menu-trigger="hover" data-kt-menu-placement="bottom-start"
                                class="menu-item menu-lg-down-accordion me-lg-1">
                                <span class="menu-link py-3 {{ $banners_1_tab_active }} ">
                                    <span class="menu-title">Crops</span>
                                    <span class="menu-arrow d-lg-none"></span>
                                </span>
                                <div
                                    class="menu-sub menu-sub-lg-down-accordion menu-sub-lg-dropdown rounded-0 py-lg-4 w-lg-225px">
                                    @foreach ($banners_1 as $item)
                                        <?php
                                        $active = '';
                                        if ($tab_seg == $item->id) {
                                            $active = 'active';
                                        } ?>
                                        <div class="menu-item   ">
                                            <a class="menu-link py-3 {{ $active }} "
                                                href="{{ url('banner/' . $item->id) }}"
                                                title="{{ $item->sub_title }}" data-bs-toggle="tooltip"
                                                data-bs-trigger="hover" data-bs-dismiss="click"
                                                data-bs-placement="right">
                                                <span class="menu-title fw-light">{{ $item->name }}</span>
                                            </a>
                                        </div>
                                    @endforeach

                                </div>
                            </div>
                            <div data-kt-menu-trigger="hover" data-kt-menu-placement="bottom-start"
                                class="menu-item menu-lg-down-accordion me-lg-1">
                                <span class="menu-link py-3 {{ $banners_2_tab_active }}">
                                    <span class="menu-title">Livestock</span>
                                    <span class="menu-arrow d-lg-none"></span>
                                </span>
                                <div
                                    class="menu-sub menu-sub-lg-down-accordion menu-sub-lg-dropdown rounded-0 py-lg-4 w-lg-225px">
                                    @foreach ($banners_2 as $item)
                                        <?php
                                        $active = '';
                                        if ($tab_seg == $item->id) {
                                            $active = 'active';
                                        } ?>
                                        <div class="menu-item  ">
                                            <a class="menu-link py-3 {{ $active }}"
                                                href="{{ url('banner/' . $item->id) }}"
                                                title="{{ $item->sub_title }}" data-bs-toggle="tooltip"
                                                data-bs-trigger="hover" data-bs-dismiss="click"
                                                data-bs-placement="right">
                                                <span class="menu-title fw-light">{{ $item->name }}</span>
                                            </a>
                                        </div>
                                    @endforeach

                                </div>
                            </div>
                            <div data-kt-menu-trigger="hover" data-kt-menu-placement="bottom-start"
                                class="menu-item menu-lg-down-accordion me-lg-1">
                                <span class="menu-link py-3 {{ $banners_3_tab_active }}">
                                    <span class="menu-title">Farm servcices</span>
                                    <span class="menu-arrow d-lg-none"></span>
                                </span>

                                <div
                                    class="menu-sub menu-sub-lg-down-accordion menu-sub-lg-dropdown rounded-0 py-lg-4 w-lg-225px">
                                    @foreach ($banners_3 as $item)
                                        <?php
                                        $active = '';
                                        if ($tab_seg == $item->id) {
                                            $active = 'active';
                                        } ?>
                                        <div class="menu-item  ">
                                            <a class="menu-link py-3 {{ $active }}"
                                                href="{{ url('banner/' . $item->id) }}"
                                                title="{{ $item->sub_title }}" data-bs-toggle="tooltip"
                                                data-bs-trigger="hover" data-bs-dismiss="click"
                                                data-bs-placement="right">
                                                <span class="menu-title fw-light">{{ $item->name }}</span>
                                            </a>
                                        </div>
                                    @endforeach

                                </div>

                            </div>
                        </div>
                    </div>
                @endif
            </div>
            <!--end::Navbar-->
            <!--begin::Toolbar wrapper-->
            <div class="d-flex align-items-stretch flex-shrink-0">
                <!--begin::Search-->

                @if (request()->segment(1) != 'dashboard')
                    <div class="d-flex align-items-stretch ms-1 ms-lg-3">
                        <!--begin::Search-->
                        <div id="kt_header_search" class="d-flex align-items-stretch" data-kt-search-keypress="true"
                            data-kt-search-min-length="2" data-kt-search-enter="enter" data-kt-search-layout="menu"
                            data-kt-menu-trigger="auto" data-kt-menu-overflow="false" data-kt-menu-permanent="true"
                            data-kt-menu-placement="bottom-end">
                            <!--begin::Search toggle-->
                            <div class="d-flex align-items-center" data-kt-search-element="toggle"
                                id="kt_header_search_toggle">
                                <div
                                    class="btn btn-icon btn-icon-muted btn-active-light btn-active-color-primary w-30px h-30px w-md-40px h-md-40px">
                                    <!--begin::Svg Icon | path: icons/duotune/general/gen021.svg-->
                                    <span class="svg-icon svg-icon-1">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none">
                                            <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2"
                                                rx="1" transform="rotate(45 17.0365 15.1223)" fill="black" />
                                            <path
                                                d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                                fill="black" />
                                        </svg>
                                    </span>
                                    <!--end::Svg Icon-->
                                </div>
                            </div>
                            <!--end::Search toggle-->
                            <!--begin::Menu-->
                            <div data-kt-search-element="content"
                                class="menu menu-sub menu-sub-dropdown p-7 w-325px w-md-375px rounded-0">
                                <!--begin::Wrapper-->
                                <div data-kt-search-element="wrapper">
                                    <!--begin::Form-->
                                    <form data-kt-search-element="form" class="w-100 position-relative mb-3"
                                        autocomplete="off">
                                        <!--begin::Icon-->
                                        <!--begin::Svg Icon | path: icons/duotune/general/gen021.svg-->
                                        <span
                                            class="svg-icon svg-icon-2 svg-icon-lg-1 svg-icon-gray-500 position-absolute top-50 translate-middle-y ms-0">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none">
                                                <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2"
                                                    rx="1" transform="rotate(45 17.0365 15.1223)" fill="black" />
                                                <path
                                                    d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                                    fill="black" />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                        <!--end::Icon-->
                                        <!--begin::Input-->
                                        <input type="text" class="search-input form-control form-control-flush ps-10"
                                            name="search" value="" placeholder="Search..."
                                            data-kt-search-element="input" />
                                        <!--end::Input-->
                                        <!--begin::Spinner-->
                                        <span class="position-absolute top-50 end-0 translate-middle-y lh-0 d-none me-1"
                                            data-kt-search-element="spinner">
                                            <span
                                                class="spinner-border h-15px w-15px align-middle text-gray-400"></span>
                                        </span>
                                        <!--end::Spinner-->
                                        <!--begin::Reset-->
                                        <span
                                            class="btn btn-flush btn-active-color-primary position-absolute top-50 end-0 translate-middle-y lh-0 d-none"
                                            data-kt-search-element="clear">
                                            <!--begin::Svg Icon | path: icons/duotune/arrows/arr061.svg-->
                                            <span class="svg-icon svg-icon-2 svg-icon-lg-1 me-0">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none">
                                                    <rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1"
                                                        transform="rotate(-45 6 17.3137)" fill="black" />
                                                    <rect x="7.41422" y="6" width="16" height="2" rx="1"
                                                        transform="rotate(45 7.41422 6)" fill="black" />
                                                </svg>
                                            </span>
                                            <!--end::Svg Icon-->
                                        </span>
                                        <!--end::Reset-->
                                        <!--begin::Toolbar-->
                                        <div class="position-absolute top-50 end-0 translate-middle-y"
                                            data-kt-search-element="toolbar">
                                        </div>
                                        <!--end::Toolbar-->
                                    </form>
                                    <!--end::Form-->
                                    <!--begin::Separator-->
                                    <div class="separator border-gray-200 mb-6"></div>
                                    <!--end::Separator-->
                                    <!--begin::Recently viewed-->
                                    <div data-kt-search-element="results" class="d-none">
                                        <!--begin::Items-->
                                        <div class="scroll-y mh-200px mh-lg-350px">
                                            <!--begin::Category title-->
                                            <h3 class="fs-5 text-muted m-0 pb-5"
                                                data-kt-search-element="category-title">
                                                Users</h3>
                                            <!--end::Category title-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <img src="{{ url('/') }}/assets/media/avatars/300-6.jpg"
                                                        alt="" />
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column justify-content-start fw-bold">
                                                    <span class="fs-6 fw-bold">Karina Clark</span>
                                                    <span class="fs-7 fw-bold text-muted">Marketing Manager</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <img src="{{ url('/') }}/assets/media/avatars/300-2.jpg"
                                                        alt="" />
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column justify-content-start fw-bold">
                                                    <span class="fs-6 fw-bold">Olivia Bold</span>
                                                    <span class="fs-7 fw-bold text-muted">Software Engineer</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <img src="{{ url('/') }}/assets/media/avatars/300-9.jpg"
                                                        alt="" />
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column justify-content-start fw-bold">
                                                    <span class="fs-6 fw-bold">Ana Clark</span>
                                                    <span class="fs-7 fw-bold text-muted">UI/UX Designer</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <img src="{{ url('/') }}/assets/media/avatars/300-14.jpg"
                                                        alt="" />
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column justify-content-start fw-bold">
                                                    <span class="fs-6 fw-bold">Nick Pitola</span>
                                                    <span class="fs-7 fw-bold text-muted">Art Director</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <img src="{{ url('/') }}/assets/media/avatars/300-11.jpg"
                                                        alt="" />
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column justify-content-start fw-bold">
                                                    <span class="fs-6 fw-bold">Edward Kulnic</span>
                                                    <span class="fs-7 fw-bold text-muted">System Administrator</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Category title-->
                                            <h3 class="fs-5 text-muted m-0 pt-5 pb-5"
                                                data-kt-search-element="category-title">
                                                Customers</h3>
                                            <!--end::Category title-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <span class="symbol-label bg-light">
                                                        <img class="w-20px h-20px"
                                                            src="{{ url('/') }}/assets/media/svg/brand-logos/volicity-9.svg"
                                                            alt="" />
                                                    </span>
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column justify-content-start fw-bold">
                                                    <span class="fs-6 fw-bold">Company Rbranding</span>
                                                    <span class="fs-7 fw-bold text-muted">UI Design</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <span class="symbol-label bg-light">
                                                        <img class="w-20px h-20px"
                                                            src="{{ url('/') }}/assets/media/svg/brand-logos/tvit.svg"
                                                            alt="" />
                                                    </span>
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column justify-content-start fw-bold">
                                                    <span class="fs-6 fw-bold">Company Re-branding</span>
                                                    <span class="fs-7 fw-bold text-muted">Web Development</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <span class="symbol-label bg-light">
                                                        <img class="w-20px h-20px"
                                                            src="{{ url('/') }}/assets/media/svg/misc/infography.svg"
                                                            alt="" />
                                                    </span>
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column justify-content-start fw-bold">
                                                    <span class="fs-6 fw-bold">Business Analytics App</span>
                                                    <span class="fs-7 fw-bold text-muted">Administration</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <span class="symbol-label bg-light">
                                                        <img class="w-20px h-20px"
                                                            src="{{ url('/') }}/assets/media/svg/brand-logos/leaf.svg"
                                                            alt="" />
                                                    </span>
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column justify-content-start fw-bold">
                                                    <span class="fs-6 fw-bold">EcoLeaf App Launch</span>
                                                    <span class="fs-7 fw-bold text-muted">Marketing</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <span class="symbol-label bg-light">
                                                        <img class="w-20px h-20px"
                                                            src="{{ url('/') }}/assets/media/svg/brand-logos/tower.svg"
                                                            alt="" />
                                                    </span>
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column justify-content-start fw-bold">
                                                    <span class="fs-6 fw-bold">Tower Group Website</span>
                                                    <span class="fs-7 fw-bold text-muted">Google Adwords</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Category title-->
                                            <h3 class="fs-5 text-muted m-0 pt-5 pb-5"
                                                data-kt-search-element="category-title">
                                                Projects</h3>
                                            <!--end::Category title-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <span class="symbol-label bg-light">
                                                        <!--begin::Svg Icon | path: icons/duotune/general/gen005.svg-->
                                                        <span class="svg-icon svg-icon-2 svg-icon-primary">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                height="24" viewBox="0 0 24 24" fill="none">
                                                                <path opacity="0.3"
                                                                    d="M19 22H5C4.4 22 4 21.6 4 21V3C4 2.4 4.4 2 5 2H14L20 8V21C20 21.6 19.6 22 19 22ZM12.5 18C12.5 17.4 12.6 17.5 12 17.5H8.5C7.9 17.5 8 17.4 8 18C8 18.6 7.9 18.5 8.5 18.5L12 18C12.6 18 12.5 18.6 12.5 18ZM16.5 13C16.5 12.4 16.6 12.5 16 12.5H8.5C7.9 12.5 8 12.4 8 13C8 13.6 7.9 13.5 8.5 13.5H15.5C16.1 13.5 16.5 13.6 16.5 13ZM12.5 8C12.5 7.4 12.6 7.5 12 7.5H8C7.4 7.5 7.5 7.4 7.5 8C7.5 8.6 7.4 8.5 8 8.5H12C12.6 8.5 12.5 8.6 12.5 8Z"
                                                                    fill="black" />
                                                                <rect x="7" y="17" width="6" height="2" rx="1"
                                                                    fill="black" />
                                                                <rect x="7" y="12" width="10" height="2" rx="1"
                                                                    fill="black" />
                                                                <rect x="7" y="7" width="6" height="2" rx="1"
                                                                    fill="black" />
                                                                <path d="M15 8H20L14 2V7C14 7.6 14.4 8 15 8Z"
                                                                    fill="black" />
                                                            </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->
                                                    </span>
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column">
                                                    <span class="fs-6 fw-bold">Si-Fi Project by AU Themes</span>
                                                    <span class="fs-7 fw-bold text-muted">#45670</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <span class="symbol-label bg-light">
                                                        <!--begin::Svg Icon | path: icons/duotune/general/gen032.svg-->
                                                        <span class="svg-icon svg-icon-2 svg-icon-primary">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                height="24" viewBox="0 0 24 24" fill="none">
                                                                <rect x="8" y="9" width="3" height="10" rx="1.5"
                                                                    fill="black" />
                                                                <rect opacity="0.5" x="13" y="5" width="3" height="14"
                                                                    rx="1.5" fill="black" />
                                                                <rect x="18" y="11" width="3" height="8" rx="1.5"
                                                                    fill="black" />
                                                                <rect x="3" y="13" width="3" height="6" rx="1.5"
                                                                    fill="black" />
                                                            </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->
                                                    </span>
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column">
                                                    <span class="fs-6 fw-bold">Shopix Mobile App Planning</span>
                                                    <span class="fs-7 fw-bold text-muted">#45690</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <span class="symbol-label bg-light">
                                                        <!--begin::Svg Icon | path: icons/duotune/communication/com012.svg-->
                                                        <span class="svg-icon svg-icon-2 svg-icon-primary">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                height="24" viewBox="0 0 24 24" fill="none">
                                                                <path opacity="0.3"
                                                                    d="M20 3H4C2.89543 3 2 3.89543 2 5V16C2 17.1046 2.89543 18 4 18H4.5C5.05228 18 5.5 18.4477 5.5 19V21.5052C5.5 22.1441 6.21212 22.5253 6.74376 22.1708L11.4885 19.0077C12.4741 18.3506 13.6321 18 14.8167 18H20C21.1046 18 22 17.1046 22 16V5C22 3.89543 21.1046 3 20 3Z"
                                                                    fill="black" />
                                                                <rect x="6" y="12" width="7" height="2" rx="1"
                                                                    fill="black" />
                                                                <rect x="6" y="7" width="12" height="2" rx="1"
                                                                    fill="black" />
                                                            </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->
                                                    </span>
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column">
                                                    <span class="fs-6 fw-bold">Finance Monitoring SAAS
                                                        Discussion</span>
                                                    <span class="fs-7 fw-bold text-muted">#21090</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                            <!--begin::Item-->
                                            <a href="#"
                                                class="d-flex text-dark text-hover-primary align-items-center mb-5">
                                                <!--begin::Symbol-->
                                                <div class="symbol symbol-40px me-4">
                                                    <span class="symbol-label bg-light">
                                                        <!--begin::Svg Icon | path: icons/duotune/communication/com006.svg-->
                                                        <span class="svg-icon svg-icon-2 svg-icon-primary">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                height="24" viewBox="0 0 24 24" fill="none">
                                                                <path opacity="0.3"
                                                                    d="M22 12C22 17.5 17.5 22 12 22C6.5 22 2 17.5 2 12C2 6.5 6.5 2 12 2C17.5 2 22 6.5 22 12ZM12 7C10.3 7 9 8.3 9 10C9 11.7 10.3 13 12 13C13.7 13 15 11.7 15 10C15 8.3 13.7 7 12 7Z"
                                                                    fill="black" />
                                                                <path
                                                                    d="M12 22C14.6 22 17 21 18.7 19.4C17.9 16.9 15.2 15 12 15C8.8 15 6.09999 16.9 5.29999 19.4C6.99999 21 9.4 22 12 22Z"
                                                                    fill="black" />
                                                            </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->
                                                    </span>
                                                </div>
                                                <!--end::Symbol-->
                                                <!--begin::Title-->
                                                <div class="d-flex flex-column">
                                                    <span class="fs-6 fw-bold">Dashboard Analitics Launch</span>
                                                    <span class="fs-7 fw-bold text-muted">#34560</span>
                                                </div>
                                                <!--end::Title-->
                                            </a>
                                            <!--end::Item-->
                                        </div>
                                        <!--end::Items-->
                                    </div>
                                    <div class="mb-5" data-kt-search-element="main">
                                        <div class="d-flex flex-stack fw-bold mb-4">
                                            <span class="text-muted fs-6 me-2">Recently Searched:</span>
                                        </div>
                                        <div class="scroll-y mh-200px mh-lg-325px">
                                            <div class="d-flex flex-column">
                                                <a href="#"
                                                    class="fs-6 text-gray-800 text-hover-primary fw-bold">BoomApp
                                                    by Keenthemes</a>
                                                <span class="fs-7 text-muted fw-bold">4 days ago</span>
                                            </div>

                                            <div class="d-flex flex-column mt-2">
                                                <a href="#"
                                                    class="fs-6 text-gray-800 text-hover-primary fw-bold">Arabica
                                                    cofee</a>
                                                <span class="fs-7 text-muted fw-bold">4 days ago</span>
                                            </div>

                                            <div class="d-flex flex-column mt-2">
                                                <a href="#" class="fs-6 text-gray-800 text-hover-primary fw-bold">Free
                                                    seed</a>
                                                <span class="fs-7 text-muted fw-bold">4 days ago</span>
                                            </div>

                                            <div class="d-flex flex-column mt-2">
                                                <a href="#"
                                                    class="fs-6 text-gray-800 text-hover-primary fw-bold">Maize</a>
                                                <span class="fs-7 text-muted fw-bold">6 days ago</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div data-kt-search-element="empty" class="text-center d-none">
                                        <!--begin::Icon-->
                                        <div class="pt-10 pb-10">
                                            <!--begin::Svg Icon | path: icons/duotune/files/fil024.svg-->
                                            <span class="svg-icon svg-icon-4x opacity-50">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none">
                                                    <path opacity="0.3"
                                                        d="M14 2H6C4.89543 2 4 2.89543 4 4V20C4 21.1046 4.89543 22 6 22H18C19.1046 22 20 21.1046 20 20V8L14 2Z"
                                                        fill="black" />
                                                    <path d="M20 8L14 2V6C14 7.10457 14.8954 8 16 8H20Z" fill="black" />
                                                    <rect x="13.6993" y="13.6656" width="4.42828" height="1.73089"
                                                        rx="0.865447" transform="rotate(45 13.6993 13.6656)"
                                                        fill="black" />
                                                    <path
                                                        d="M15 12C15 14.2 13.2 16 11 16C8.8 16 7 14.2 7 12C7 9.8 8.8 8 11 8C13.2 8 15 9.8 15 12ZM11 9.6C9.68 9.6 8.6 10.68 8.6 12C8.6 13.32 9.68 14.4 11 14.4C12.32 14.4 13.4 13.32 13.4 12C13.4 10.68 12.32 9.6 11 9.6Z"
                                                        fill="black" />
                                                </svg>
                                            </span>
                                            <!--end::Svg Icon-->
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Message-->
                                        <div class="pb-15 fw-bold">
                                            <h3 class="text-gray-600 fs-5 mb-2">No result found</h3>
                                            <div class="text-muted fs-7">Please try again with a different query</div>
                                        </div>
                                        <!--end::Message-->
                                    </div>
                                    <!--end::Empty-->
                                </div>

                                <!--end::Preferences-->
                                <!--begin::Preferences-->

                                <!--end::Preferences-->
                            </div>
                            <!--end::Menu-->
                        </div>
                        <!--end::Search-->
                    </div>
                    <!--end::Search-->

                    <a href="{{ url('dashboard/chats') }}" class="d-flex align-items-center ms-1 ms-lg-3">
                        <!--begin::Menu wrapper-->
                        <div class="btn btn-icon btn-icon-muted btn-active-light btn-active-color-primary w-30px h-30px w-md-40px h-md-40px position-relative"
                            id="kt_drawer_chat_toggle">
                            <!--begin::Svg Icon | path: icons/duotune/communication/com012.svg-->
                            <span class="svg-icon svg-icon-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none">
                                    <path opacity="0.3"
                                        d="M20 3H4C2.89543 3 2 3.89543 2 5V16C2 17.1046 2.89543 18 4 18H4.5C5.05228 18 5.5 18.4477 5.5 19V21.5052C5.5 22.1441 6.21212 22.5253 6.74376 22.1708L11.4885 19.0077C12.4741 18.3506 13.6321 18 14.8167 18H20C21.1046 18 22 17.1046 22 16V5C22 3.89543 21.1046 3 20 3Z"
                                        fill="black" />
                                    <rect x="6" y="12" width="7" height="2" rx="1" fill="black" />
                                    <rect x="6" y="7" width="12" height="2" rx="1" fill="black" />
                                </svg>
                            </span>
                            <!--end::Svg Icon-->
                            <span
                                class="bullet bullet-dot bg-success h-6px w-6px position-absolute translate-middle top-0 start-50 animation-blink"></span>
                        </div>
                        <!--end::Menu wrapper-->
                    </a>

                    <div class="d-flex align-items-center ms-1 ms-lg-3">
                        <!--begin::Menu wrapper-->
                        <div class="btn btn-icon btn-icon-muted btn-active-light btn-active-color-primary w-30px h-30px w-md-40px h-md-40px"
                            data-kt-menu-trigger="click" data-kt-menu-attach="parent"
                            data-kt-menu-placement="bottom-end">
                            <!--begin::Svg Icon | path: icons/duotune/general/gen025.svg-->
                            <span class="svg-icon svg-icon-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none">
                                    <rect x="2" y="2" width="9" height="9" rx="2" fill="black" />
                                    <rect opacity="0.3" x="13" y="2" width="9" height="9" rx="2" fill="black" />
                                    <rect opacity="0.3" x="13" y="13" width="9" height="9" rx="2" fill="black" />
                                    <rect opacity="0.3" x="2" y="13" width="9" height="9" rx="2" fill="black" />
                                </svg>
                            </span>
                            <!--end::Svg Icon-->
                        </div>
                        <!--begin::Menu-->
                        <div class="menu menu-sub menu-sub-dropdown menu-column w-250px w-lg-325px"
                            data-kt-menu="true">
                            <!--begin::Heading-->
                            <div class="d-flex flex-column flex-center bgi-no-repeat rounded-top px-9 py-10"
                                style="background-image:url('{{ url('assets/media/misc/pattern-1.jpg') }}')">
                                <!--begin::Title-->
                                <h3 class="text-white fw-bold mb-3">More Apps</h3>
                                <!--end::Title-->
                                <!--begin::Status-->
                                <span class="badge bg-primary py-2 px-3">You have 25 pending tasks</span>
                                <!--end::Status-->
                            </div>
                            <!--end::Heading-->
                            <!--begin:Nav-->
                            <div class="row g-0">
                                <!--begin:Item-->
                                <div class="col-6 text-center">
                                    <a href="javascript:;"
                                        class="d-flex flex-column flex-center h-100 p-6 bg-hover-light border-end border-bottom text-center">
                                        <!--begin::Svg Icon | path: icons/duotune/finance/fin009.svg-->
                                        <span class="svg-icon svg-icon-3x svg-icon-primary mb-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none">
                                                <path opacity="0.3"
                                                    d="M15.8 11.4H6C5.4 11.4 5 11 5 10.4C5 9.80002 5.4 9.40002 6 9.40002H15.8C16.4 9.40002 16.8 9.80002 16.8 10.4C16.8 11 16.3 11.4 15.8 11.4ZM15.7 13.7999C15.7 13.1999 15.3 12.7999 14.7 12.7999H6C5.4 12.7999 5 13.1999 5 13.7999C5 14.3999 5.4 14.7999 6 14.7999H14.8C15.3 14.7999 15.7 14.2999 15.7 13.7999Z"
                                                    fill="black" />
                                                <path
                                                    d="M18.8 15.5C18.9 15.7 19 15.9 19.1 16.1C19.2 16.7 18.7 17.2 18.4 17.6C17.9 18.1 17.3 18.4999 16.6 18.7999C15.9 19.0999 15 19.2999 14.1 19.2999C13.4 19.2999 12.7 19.2 12.1 19.1C11.5 19 11 18.7 10.5 18.5C10 18.2 9.60001 17.7999 9.20001 17.2999C8.80001 16.8999 8.49999 16.3999 8.29999 15.7999C8.09999 15.1999 7.80001 14.7 7.70001 14.1C7.60001 13.5 7.5 12.8 7.5 12.2C7.5 11.1 7.7 10.1 8 9.19995C8.3 8.29995 8.79999 7.60002 9.39999 6.90002C9.99999 6.30002 10.7 5.8 11.5 5.5C12.3 5.2 13.2 5 14.1 5C15.2 5 16.2 5.19995 17.1 5.69995C17.8 6.09995 18.7 6.6 18.8 7.5C18.8 7.9 18.6 8.29998 18.3 8.59998C18.2 8.69998 18.1 8.69993 18 8.79993C17.7 8.89993 17.4 8.79995 17.2 8.69995C16.7 8.49995 16.5 7.99995 16 7.69995C15.5 7.39995 14.9 7.19995 14.2 7.19995C13.1 7.19995 12.1 7.6 11.5 8.5C10.9 9.4 10.5 10.6 10.5 12.2C10.5 13.3 10.7 14.2 11 14.9C11.3 15.6 11.7 16.1 12.3 16.5C12.9 16.9 13.5 17 14.2 17C15 17 15.7 16.8 16.2 16.4C16.8 16 17.2 15.2 17.9 15.1C18 15 18.5 15.2 18.8 15.5Z"
                                                    fill="black" />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                        <span class="fs-5 fw-bold text-gray-800 mb-0">Farm Managemt</span>
                                        <span class="fs-7 text-gray-400">Digitally Manage your farm</span>
                                    </a>
                                </div>
                                <!--end:Item-->
                                <!--begin:Item-->
                                <div class="col-6">
                                    <a href="javascript:;"
                                        class="d-flex flex-column flex-center h-100 p-6 bg-hover-light border-bottom">
                                        <!--begin::Svg Icon | path: icons/duotune/communication/com010.svg-->
                                        <span class="svg-icon svg-icon-3x svg-icon-primary mb-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none">
                                                <path
                                                    d="M6 8.725C6 8.125 6.4 7.725 7 7.725H14L18 11.725V12.925L22 9.725L12.6 2.225C12.2 1.925 11.7 1.925 11.4 2.225L2 9.725L6 12.925V8.725Z"
                                                    fill="black" />
                                                <path opacity="0.3"
                                                    d="M22 9.72498V20.725C22 21.325 21.6 21.725 21 21.725H3C2.4 21.725 2 21.325 2 20.725V9.72498L11.4 17.225C11.8 17.525 12.3 17.525 12.6 17.225L22 9.72498ZM15 11.725H18L14 7.72498V10.725C14 11.325 14.4 11.725 15 11.725Z"
                                                    fill="black" />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                        <span class="fs-5 fw-bold text-gray-800 mb-0">Administration</span>
                                        <span class="fs-7 text-gray-400">Console</span>
                                    </a>
                                </div>
                                <!--end:Item-->
                                <!--begin:Item-->
                                <div class="col-6">
                                    <a href="javascript:;"
                                        class="d-flex flex-column flex-center h-100 p-6 bg-hover-light border-end">
                                        <!--begin::Svg Icon | path: icons/duotune/abstract/abs042.svg-->
                                        <span class="svg-icon svg-icon-3x svg-icon-primary mb-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none">
                                                <path
                                                    d="M18 21.6C16.6 20.4 9.1 20.3 6.3 21.2C5.7 21.4 5.1 21.2 4.7 20.8L2 18C4.2 15.8 10.8 15.1 15.8 15.8C16.2 18.3 17 20.5 18 21.6ZM18.8 2.8C18.4 2.4 17.8 2.20001 17.2 2.40001C14.4 3.30001 6.9 3.2 5.5 2C6.8 3.3 7.4 5.5 7.7 7.7C9 7.9 10.3 8 11.7 8C15.8 8 19.8 7.2 21.5 5.5L18.8 2.8Z"
                                                    fill="black" />
                                                <path opacity="0.3"
                                                    d="M21.2 17.3C21.4 17.9 21.2 18.5 20.8 18.9L18 21.6C15.8 19.4 15.1 12.8 15.8 7.8C18.3 7.4 20.4 6.70001 21.5 5.60001C20.4 7.00001 20.2 14.5 21.2 17.3ZM8 11.7C8 9 7.7 4.2 5.5 2L2.8 4.8C2.4 5.2 2.2 5.80001 2.4 6.40001C2.7 7.40001 3.00001 9.2 3.10001 11.7C3.10001 15.5 2.40001 17.6 2.10001 18C3.20001 16.9 5.3 16.2 7.8 15.8C8 14.2 8 12.7 8 11.7Z"
                                                    fill="black" />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                        <span class="fs-5 fw-bold text-gray-800 mb-0">Projects</span>
                                        <span class="fs-7 text-gray-400">Pending Tasks</span>
                                    </a>
                                </div>

                                <div class="col-6">
                                    <a href="javascript:;"
                                        class="d-flex flex-column flex-center h-100 p-6 bg-hover-light">
                                        <!--begin::Svg Icon | path: icons/duotune/finance/fin006.svg-->
                                        <span class="svg-icon svg-icon-3x svg-icon-primary mb-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none">
                                                <path opacity="0.3"
                                                    d="M20 15H4C2.9 15 2 14.1 2 13V7C2 6.4 2.4 6 3 6H21C21.6 6 22 6.4 22 7V13C22 14.1 21.1 15 20 15ZM13 12H11C10.5 12 10 12.4 10 13V16C10 16.5 10.4 17 11 17H13C13.6 17 14 16.6 14 16V13C14 12.4 13.6 12 13 12Z"
                                                    fill="black" />
                                                <path
                                                    d="M14 6V5H10V6H8V5C8 3.9 8.9 3 10 3H14C15.1 3 16 3.9 16 5V6H14ZM20 15H14V16C14 16.6 13.5 17 13 17H11C10.5 17 10 16.6 10 16V15H4C3.6 15 3.3 14.9 3 14.7V18C3 19.1 3.9 20 5 20H19C20.1 20 21 19.1 21 18V14.7C20.7 14.9 20.4 15 20 15Z"
                                                    fill="black" />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                        <span class="fs-5 fw-bold text-gray-800 mb-0">Customers</span>
                                        <span class="fs-7 text-gray-400">Latest cases</span>
                                    </a>
                                </div>
                                <!--end:Item-->
                            </div>
                            <!--end:Nav-->
                            <!--begin::View more-->
                            <div class="py-2 text-center border-top">
                                <a href="../../demo1/dist/pages/user-profile/activity.html"
                                    class="btn btn-color-gray-600 btn-active-color-primary">My Dashboard
                                    <!--begin::Svg Icon | path: icons/duotune/arrows/arr064.svg-->
                                    <span class="svg-icon svg-icon-5">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none">
                                            <rect opacity="0.5" x="18" y="13" width="13" height="2" rx="1"
                                                transform="rotate(-180 18 13)" fill="black" />
                                            <path
                                                d="M15.4343 12.5657L11.25 16.75C10.8358 17.1642 10.8358 17.8358 11.25 18.25C11.6642 18.6642 12.3358 18.6642 12.75 18.25L18.2929 12.7071C18.6834 12.3166 18.6834 11.6834 18.2929 11.2929L12.75 5.75C12.3358 5.33579 11.6642 5.33579 11.25 5.75C10.8358 6.16421 10.8358 6.83579 11.25 7.25L15.4343 11.4343C15.7467 11.7467 15.7467 12.2533 15.4343 12.5657Z"
                                                fill="black" />
                                        </svg>
                                    </span>
                                    <!--end::Svg Icon-->
                                </a>
                            </div>
                            <!--end::View more-->
                        </div>
                        <!--end::Menu-->
                        <!--end::Menu wrapper-->
                    </div>
                @endif


                <div class="d-flex align-items-center ms-1 ms-lg-3" id="kt_header_user_menu_toggle">

                    @if ($u->id < 1)
                        <a class="cursor-pointer symbol symbol-30px symbol-md-40px bg-light-primary border border-primary"
                            href="{{ url('register') }}">
                            <img src="{{ url('user.png') }}" alt="user" />
                        </a>
                    @else
                        <div class="cursor-pointer symbol symbol-30px symbol-md-40px" data-kt-menu-trigger="click"
                            data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
                            <img src="{{ $u->avatar }}" alt="user" />
                        </div>
                    @endif

                    <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-primary fw-bold py-4 fs-6 w-275px rounded-0"
                        data-kt-menu="true">
                        <div class="menu-item px-3">
                            <div class="menu-content d-flex align-items-center px-3">
                                <div class="symbol symbol-50px me-5">
                                    <img alt="Logo" src="{{ $u->avatar }}" />
                                </div>
                                <div class="d-flex flex-column">
                                    <div class="fw-bolder d-flex align-items-center fs-5">{{ $u->name }}
                                        <span
                                            class="badge badge-light-primary fw-bolder fs-8 px-2 py-1 ms-2">{{ $u->user_type }}</span>
                                    </div>
                                    <a href="javacripti:;"
                                        class="fw-bold text-muted text-hover-primary fs-7">{{ $u->email }}</a>
                                </div>
                            </div>
                        </div>
                        <div class="separator my-2"></div>
                        <div class="menu-item px-5">
                            <a href="{{ url('dashboard/users/' . $u->id . '/edit') }}" class="menu-link px-5">My
                                Profile</a>
                        </div>
                        <div class="menu-item px-5">
                            <a href="{{ url('dashboard/products') }}" class="menu-link px-5">
                                <span class="menu-text">My Products</span>
                            </a>
                        </div>

                        <div class="separator my-2"></div>
                        <div class="menu-item px-5" data-kt-menu-trigger="hover" data-kt-menu-placement="left-start">
                            <a href="#" class="menu-link px-5">
                                <span class="menu-title position-relative">Language
                                    <span
                                        class="fs-8 rounded bg-light px-3 py-2 position-absolute translate-middle-y top-50 end-0">English
                            </a>
                            <!--begin::Menu sub-->
                            <div class="menu-sub menu-sub-dropdown w-175px py-4">
                                <!--begin::Menu item-->
                                <div class="menu-item px-3">
                                    <a href="javascript:;" class="menu-link d-flex px-5 active">
                                        <span class="symbol symbol-20px me-4">
                                            <img class="rounded-1"
                                                src="{{ url('/') }}/assets/media/flags/united-states.svg"
                                                alt="" />
                                        </span>English</a>
                                </div>
                                <!--end::Menu item-->
                                <!--begin::Menu item-->
                                <div class="menu-item px-3">
                                    <a href="javascript:;" class="menu-link d-flex px-5">
                                        <span class="symbol symbol-20px me-4">
                                            <img class="rounded-1"
                                                src="{{ url('/') }}/assets/media/flags/spain.svg" alt="" />
                                        </span>Swahili</a>
                                </div>
                                <!--end::Menu item-->
                                <!--begin::Menu item-->
                                <div class="menu-item px-3">
                                    <a href="javascript:;" class="menu-link d-flex px-5">
                                        <span class="symbol symbol-20px me-4">
                                        </span>Luganda</a>
                                </div>
                                <!--end::Menu item-->
                                <!--begin::Menu item-->
                                <div class="menu-item px-3">
                                    <a href="javascript:;" class="menu-link d-flex px-5">
                                        <span class="symbol symbol-20px me-4">
                                        </span>Luo</a>
                                </div>
                                <!--end::Menu item-->
                                <!--begin::Menu item-->
                                <div class="menu-item px-3">
                                    <a href="javascript:;" class="menu-link d-flex px-5">
                                        <span class="symbol symbol-20px me-4">
                                        </span>Lusoga</a>
                                </div>
                                <!--end::Menu item-->
                            </div>
                            <!--end::Menu sub-->
                        </div>
                        <!--end::Menu item-->
                        <!--begin::Menu item-->
                        <div class="menu-item px-5 my-1">
                            <a href="javascript:;" class="menu-link px-5">Account
                                Settings</a>
                        </div>
                        <!--end::Menu item-->
                        <!--begin::Menu item-->
                        <div class="menu-item px-5">
                            <a href="{{ url('/logout') }}" class="menu-link px-5">Sign Out</a>
                        </div>
                        <!--end::Menu item-->
                        <!--begin::Menu separator-->
                        <div class="separator my-2"></div>
                        <!--end::Menu separator-->
                        <!--begin::Menu item-->
                        <div class="menu-item px-5">
                            <div class="menu-content px-5">
                                <label
                                    class="form-check form-switch form-check-custom form-check-solid pulse pulse-success"
                                    for="kt_user_menu_dark_mode_toggle">
                                    <input class="form-check-input w-30px h-20px" type="checkbox" value="1" name="mode"
                                        id="kt_user_menu_dark_mode_toggle" data-kt-url="{{ url('/') }}" />
                                    <span class="pulse-ring ms-n1"></span>
                                    <span class="form-check-label text-gray-600 fs-7">Dark Mode</span>
                                </label>
                            </div>
                        </div>
                        <!--end::Menu item-->
                    </div>
                    <!--end::User account menu-->
                    <!--end::Menu wrapper-->
                </div>
                <!--end::User menu-->
                <!--begin::Header menu toggle-->
                <div class="d-flex align-items-center d-lg-none ms-2 me-n3" title="Show header menu">
                    <div class="btn btn-icon btn-active-light-primary w-30px h-30px w-md-40px h-md-40px"
                        id="kt_header_menu_mobile_toggle">
                        <!--begin::Svg Icon | path: icons/duotune/text/txt001.svg-->
                        <span class="svg-icon svg-icon-1">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                fill="none">
                                <path
                                    d="M13 11H3C2.4 11 2 10.6 2 10V9C2 8.4 2.4 8 3 8H13C13.6 8 14 8.4 14 9V10C14 10.6 13.6 11 13 11ZM22 5V4C22 3.4 21.6 3 21 3H3C2.4 3 2 3.4 2 4V5C2 5.6 2.4 6 3 6H21C21.6 6 22 5.6 22 5Z"
                                    fill="black" />
                                <path opacity="0.3"
                                    d="M21 16H3C2.4 16 2 15.6 2 15V14C2 13.4 2.4 13 3 13H21C21.6 13 22 13.4 22 14V15C22 15.6 21.6 16 21 16ZM14 20V19C14 18.4 13.6 18 13 18H3C2.4 18 2 18.4 2 19V20C2 20.6 2.4 21 3 21H13C13.6 21 14 20.6 14 20Z"
                                    fill="black" />
                            </svg>
                        </span>
                        <!--end::Svg Icon-->
                    </div>
                </div>
                <!--end::Header menu toggle-->
            </div>
            <!--end::Toolbar wrapper-->
        </div>
        <!--end::Wrapper-->
    </div>
    <!--end::Container-->
</div>
