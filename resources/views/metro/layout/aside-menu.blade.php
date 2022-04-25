<?php
use App\Models\MenuItem;
$u = auth()->user();
if ($u == null) {
    $u = new User();
}

$menu_items = MenuItem::where([])
    ->orderBy('order', 'Asc')
    ->get();

?><div id="kt_aside" class="aside aside-light aside-hoverable" data-kt-drawer="true"
    data-kt-drawer-name="aside" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true"
    data-kt-drawer-width="{default:'200px', '300px': '250px'}" data-kt-drawer-direction="start"
    data-kt-drawer-toggle="#kt_aside_mobile_toggle">
    <!--begin::Brand-->
    <div class="aside-logo flex-column-auto" id="kt_aside_logo">
        <!--begin::Logo-->
        <a href="{{ url('/') }}" class="">
            <img alt="Logo" src="{{ url('/') }}/logo.png" class="h-50px logo" />
        </a>
        <!--end::Logo-->
        <!--begin::Aside toggler-->
        <div id="kt_aside_toggle" class="btn btn-icon w-auto px-0 btn-active-color-primary aside-toggle"
            data-kt-toggle="true" data-kt-toggle-state="active" data-kt-toggle-target="body"
            data-kt-toggle-name="aside-minimize">
            <!--begin::Svg Icon | path: icons/duotune/arrows/arr079.svg-->
            <span class="svg-icon svg-icon-1 rotate-180">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                    <path opacity="0.5"
                        d="M14.2657 11.4343L18.45 7.25C18.8642 6.83579 18.8642 6.16421 18.45 5.75C18.0358 5.33579 17.3642 5.33579 16.95 5.75L11.4071 11.2929C11.0166 11.6834 11.0166 12.3166 11.4071 12.7071L16.95 18.25C17.3642 18.6642 18.0358 18.6642 18.45 18.25C18.8642 17.8358 18.8642 17.1642 18.45 16.75L14.2657 12.5657C13.9533 12.2533 13.9533 11.7467 14.2657 11.4343Z"
                        fill="black" />
                    <path
                        d="M8.2657 11.4343L12.45 7.25C12.8642 6.83579 12.8642 6.16421 12.45 5.75C12.0358 5.33579 11.3642 5.33579 10.95 5.75L5.40712 11.2929C5.01659 11.6834 5.01659 12.3166 5.40712 12.7071L10.95 18.25C11.3642 18.6642 12.0358 18.6642 12.45 18.25C12.8642 17.8358 12.8642 17.1642 12.45 16.75L8.2657 12.5657C7.95328 12.2533 7.95328 11.7467 8.2657 11.4343Z"
                        fill="black" />
                </svg>
            </span>
            <!--end::Svg Icon-->
        </div>
        <!--end::Aside toggler-->
    </div>

    <div class="aside-menu flex-column-fluid">
        <!--begin::Aside Menu-->
        <div class="hover-scroll-overlay-y my-5 my-lg-5" id="kt_aside_menu_wrapper" data-kt-scroll="true"
            data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-height="auto"
            data-kt-scroll-dependencies="#kt_aside_logo, #kt_aside_footer" data-kt-scroll-wrappers="#kt_aside_menu"
            data-kt-scroll-offset="0">
            <!--begin::Menu-->
            <div class="menu menu-column menu-title-gray-800 menu-state-title-primary menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-500"
                id="#kt_aside_menu" data-kt-menu="true" data-kt-menu-expand="false">


                @foreach ($menu_items as $item)
                    @if ($item->parent_id < 1)
                        @php
                            if ($u->user_type != 'admin') {
                                if ($item->role != 'both' && $item->accept != 'user') {
                                    continue;
                                }
                            }
                        @endphp

                        @if (count($item->kids) > 0)
                            @php
                                
                                $show = '';
                                $_seg = request()->segment(2);
                                
                                foreach ($item->kids as $_kid) {
                                    if (strpos($_kid->uri, $_seg)) {
                                        $show = ' show ';
                                    }
                                }
                            @endphp

                            <div data-kt-menu-trigger="click"
                                class="menu-item menu-accordion menu-item {{ $show }}">



                                <span class="menu-link ">
                                    <span class="menu-icon">
                                        {!! $item->icon !!}
                                    </span>



                                    <span class="menu-title">{{ $item->title }}</span>
                                    <span class="menu-arrow"></span>
                                </span>
                                <div class="menu-sub menu-sub-accordion menu-active-bg">
                                    @foreach ($item->kids as $kid)
                                        @php
                                            $active = '';
                                            $_seg = request()->segment(2);
                                            
                                            if (strpos($kid->uri, $_seg)) {
                                                $active = ' active ';
                                            }
                                        @endphp

                                        <div class="menu-item">
                                            <a class="menu-link {{ $active }}" href="{{ url($kid->uri) }}">
                                                <span class="menu-bullet">
                                                    <span class="bullet bullet-dot"></span>
                                                </span>
                                                <span class="menu-title">{{ $kid->title }}</span>
                                            </a>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @else
                            @php
                                $active = '';
                                $_seg = request()->segment(2);
                                if ($item->uri == '/dashboard/') {
                                    //$active = ' active ';
                                } elseif (strpos($item->uri, $_seg)) {
                                    $active = ' active ';
                                }
                            @endphp
                            <div class="menu-item">
                                <a class="menu-link {{ $active }}" href="{{ url($item->uri) }}">
                                    <span class="menu-icon">
                                        {!! $item->icon !!}
                                    </span>
                                    <span class="menu-title">{{ $item->title }}</span>
                                </a>
                            </div>
                        @endif
                    @endif
                @endforeach
            </div>
        </div>
    </div>
    <div class="aside-footer flex-column-auto pt-5 pb-7 px-5" id="kt_aside_footer">
        <a href="javascript:;" class="btn btn-custom btn-primary w-100" data-bs-toggle="tooltip" data-bs-trigger="hover"
            data-bs-dismiss-="click" title="200+ in-house components and 3rd-party plugins">
            <span class="btn-label">Help &amp; Support</span>
            <span class="svg-icon btn-icon svg-icon-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                    <path opacity="0.3"
                        d="M19 22H5C4.4 22 4 21.6 4 21V3C4 2.4 4.4 2 5 2H14L20 8V21C20 21.6 19.6 22 19 22ZM12.5 18C12.5 17.4 12.6 17.5 12 17.5H8.5C7.9 17.5 8 17.4 8 18C8 18.6 7.9 18.5 8.5 18.5L12 18C12.6 18 12.5 18.6 12.5 18ZM16.5 13C16.5 12.4 16.6 12.5 16 12.5H8.5C7.9 12.5 8 12.4 8 13C8 13.6 7.9 13.5 8.5 13.5H15.5C16.1 13.5 16.5 13.6 16.5 13ZM12.5 8C12.5 7.4 12.6 7.5 12 7.5H8C7.4 7.5 7.5 7.4 7.5 8C7.5 8.6 7.4 8.5 8 8.5H12C12.6 8.5 12.5 8.6 12.5 8Z"
                        fill="black" />
                    <rect x="7" y="17" width="6" height="2" rx="1" fill="black" />
                    <rect x="7" y="12" width="10" height="2" rx="1" fill="black" />
                    <rect x="7" y="7" width="6" height="2" rx="1" fill="black" />
                    <path d="M15 8H20L14 2V7C14 7.6 14.4 8 15 8Z" fill="black" />
                </svg>
            </span>
        </a>
    </div>
</div>
