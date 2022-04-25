<?php
use App\Models\MenuItem;
use App\Models\Chat;
use App\Models\Product;

$id = (string) Request::segment(3);
$u = Auth::user();
$chat_thread = [];
$product_id = 0;
$receiver_id = 0;
$chat_is_enabled = ' disabled ';
$product = new Product();

if ($id != null) {
    if (strlen($id) > 1) {
        $product_id = Chat::get_chat_thread_product_id($id);
        $product = Product::find($product_id);
        if ($product == null) {
            $product = new Product();
        } else {
            $product_id = $product->id;
            $chat_is_enabled = '';

            $_ids = $vals = explode('-', $id);
            if (isset($_ids[0]) && $_ids[1]) {
                if (((int) $_ids[0]) == ((int) $u->id)) {
                    $receiver_id = $_ids[1];
                } else {
                    $receiver_id = $_ids[0];
                }
            }
        }

        $chat_thread = Chat::get_chat_thread($id, $u->id, false);
    }
}

$chat_threads = Chat::get_chat_threads($u->id);
?>@extends('metro.layout.layout-dashboard')

@section('header')
@endsection



@section('dashboard-content')
    <div class="d-flex flex-column flex-lg-row">
        <div class="flex-column flex-lg-row-auto w-100 w-lg-300px w-xl-400px mb-10 mb-lg-0">
            <div class="card card-flush">
                <div class="card-header pt-7" id="kt_chat_contacts_header">
                    <form class="w-100 position-relative" autocomplete="off">
                        <span
                            class="svg-icon svg-icon-2 svg-icon-lg-1 svg-icon-gray-500 position-absolute top-50 ms-5 translate-middle-y">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1"
                                    transform="rotate(45 17.0365 15.1223)" fill="black" />
                                <path
                                    d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                    fill="black" />
                            </svg>
                        </span>
                        <input type="text" class="form-control form-control-solid px-15" name="search" value=""
                            placeholder="Search by username or email..." />
                    </form>
                </div>
                <div class="card-body pt-5" id="kt_chat_contacts_body">
                    <div class="scroll-y me-n5 pe-5 h-200px h-lg-auto" data-kt-scroll="true"
                        data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-max-height="auto"
                        data-kt-scroll-dependencies="#kt_header, #kt_toolbar, #kt_footer, #kt_chat_contacts_header"
                        data-kt-scroll-wrappers="#kt_content, #kt_chat_contacts_body" data-kt-scroll-offset="5px">
                        @foreach ($chat_threads as $thread)
                            <a href="{{ url('/dashboard/chats/' . $thread->thread) }}"
                                class="d-flex flex-stack py-4 bg-hover-light">
                                <div class="d-flex align-items-center">
                                    <div class="symbol symbol-45px symbol-circle">
                                        <img alt="Pic" src="{{ $thread->receiver_pic }}" />
                                    </div>
                                    <div class="ms-5">
                                        <span class="fs-5 fw-bolder text-gray-900  mb-2">
                                            {{ $thread->display_name }}
                                        </span>
                                        <div class="fw-bold text-muted">{{ $thread->body }}</div>
                                    </div>
                                </div>
                                <div class="d-flex flex-column align-items-end ms-2">
                                    @if ($thread->unread_count > 0)
                                        <span class="badge badge-circle badge-success">{{ $thread->unread_count }}</span>
                                    @endif
                                    <span class="text-muted fs-7 mb-1">{{ $thread->created_at }}</span>
                                </div>
                            </a>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

        <div class="flex-lg-row-fluid ms-lg-7 ms-xl-10">
            <!--begin::Messenger-->
            <div class="card" id="kt_chat_messenger">
                <!--begin::Card header-->
                <div class="card-header" id="kt_chat_messenger_header">
                    <!--begin::Title-->
                    <div class="card-title">
                        <!--begin::User-->
                        <div class="d-flex justify-content-center flex-column me-3">
                            <a href="#" class="fs-4 fw-bolder text-gray-900 text-hover-primary me-1 mb-2 lh-1">Brian
                                Cox => {{ count($chat_thread) }} <=< /a>
                                    <!--begin::Info-->
                                    <div class="mb-0 lh-1">
                                        <span class="badge badge-success badge-circle w-10px h-10px me-1"></span>
                                        <span class="fs-7 fw-bold text-muted">Active</span>
                                    </div>
                                    <!--end::Info-->
                        </div>
                        <!--end::User-->
                    </div>
                    <!--end::Title-->
                    <!--begin::Card toolbar-->
                    <div class="card-toolbar">
                        <!--begin::Menu-->

                        <div class="me-n3">
                            <button class="btn btn-sm btn-icon btn-active-light-primary" data-kt-menu-trigger="click"
                                data-kt-menu-placement="bottom-end">
                                <i class="bi bi-three-dots fs-2"></i>
                            </button>
                            <!--begin::Menu 3-->
                            <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-bold w-200px py-3"
                                data-kt-menu="true">
                                <!--begin::Heading-->
                                <div class="menu-item px-3">
                                    <div class="menu-content text-muted pb-2 px-3 fs-7 text-uppercase">Contacts</div>
                                </div>
                                <!--end::Heading-->
                                <!--begin::Menu item-->
                                <div class="menu-item px-3">
                                    <a href="#" class="menu-link px-3" data-bs-toggle="modal"
                                        data-bs-target="#kt_modal_users_search">Add Contact</a>
                                </div>
                                <!--end::Menu item-->
                                <!--begin::Menu item-->
                                <div class="menu-item px-3">
                                    <a href="#" class="menu-link flex-stack px-3" data-bs-toggle="modal"
                                        data-bs-target="#kt_modal_invite_friends">Invite Contacts
                                        <i class="fas fa-exclamation-circle ms-2 fs-7" data-bs-toggle="tooltip"
                                            title="Specify a contact email to send an invitation"></i></a>
                                </div>
                                <!--end::Menu item-->
                                <!--begin::Menu item-->
                                <div class="menu-item px-3" data-kt-menu-trigger="hover"
                                    data-kt-menu-placement="right-start">
                                    <a href="#" class="menu-link px-3">
                                        <span class="menu-title">Groups</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <!--begin::Menu sub-->
                                    <div class="menu-sub menu-sub-dropdown w-175px py-4">
                                        <!--begin::Menu item-->
                                        <div class="menu-item px-3">
                                            <a href="#" class="menu-link px-3" data-bs-toggle="tooltip"
                                                title="Coming soon">Create Group</a>
                                        </div>
                                        <!--end::Menu item-->
                                        <!--begin::Menu item-->
                                        <div class="menu-item px-3">
                                            <a href="#" class="menu-link px-3" data-bs-toggle="tooltip"
                                                title="Coming soon">Invite Members</a>
                                        </div>
                                        <!--end::Menu item-->
                                        <!--begin::Menu item-->
                                        <div class="menu-item px-3">
                                            <a href="#" class="menu-link px-3" data-bs-toggle="tooltip"
                                                title="Coming soon">Settings</a>
                                        </div>
                                        <!--end::Menu item-->
                                    </div>
                                    <!--end::Menu sub-->
                                </div>
                                <!--end::Menu item-->
                                <!--begin::Menu item-->
                                <div class="menu-item px-3 my-1">
                                    <a href="#" class="menu-link px-3" data-bs-toggle="tooltip"
                                        title="Coming soon">Settings</a>
                                </div>
                                <!--end::Menu item-->
                            </div>
                            <!--end::Menu 3-->
                        </div>
                        <!--end::Menu-->
                    </div>
                    <!--end::Card toolbar-->
                </div>
                <!--end::Card header-->
                <!--begin::Card body-->
                <div class="card-body" id="kt_chat_messenger_body">
                    <!--begin::Messages-->
                    <div class="scroll-y me-n5 pe-5 h-300px h-lg-auto" data-kt-element="messages" data-kt-scroll="true"
                        data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-max-height="auto"
                        data-kt-scroll-dependencies="#kt_header, #kt_toolbar, #kt_footer, #kt_chat_messenger_header, #kt_chat_messenger_footer"
                        data-kt-scroll-wrappers="#kt_content, #kt_chat_messenger_body" data-kt-scroll-offset="5px">


                        <!--begin::Message(template for out)-->
                        <div class="d-flex justify-content-end mb-10 d-none" data-kt-element="template-out">
                            <!--begin::Wrapper-->
                            <div class="d-flex flex-column align-items-end">
                                <!--begin::User-->
                                <div class="d-flex align-items-center mb-2">
                                    <!--begin::Details-->
                                    <div class="me-3">
                                        <span class="text-muted fs-7 mb-1">Just now</span>
                                        <a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary ms-1">You</a>
                                    </div>
                                    <!--end::Details-->
                                    <!--begin::Avatar-->
                                    <div class="symbol symbol-35px symbol-circle">
                                        <img alt="Pic" src="assets/media/avatars/300-1.jpg" />
                                    </div>
                                    <!--end::Avatar-->
                                </div>
                                <!--end::User-->
                                <!--begin::Text-->
                                <div class="p-5 rounded bg-light-primary text-dark fw-bold mw-lg-400px text-end"
                                    data-kt-element="message-text"></div>
                                <!--end::Text-->
                            </div>
                            <!--end::Wrapper-->
                        </div>
                        <!--end::Message(template for out)-->
                        <!--begin::Message(template for in)-->
                        <div class="d-flex justify-content-start mb-10 d-none" data-kt-element="template-in">
                            <!--begin::Wrapper-->
                            <div class="d-flex flex-column align-items-start">
                                <!--begin::User-->
                                <div class="d-flex align-items-center mb-2">
                                    <!--begin::Avatar-->
                                    <div class="symbol symbol-35px symbol-circle">
                                        <img alt="Pic" src="assets/media/avatars/300-25.jpg" />
                                    </div>
                                    <!--end::Avatar-->
                                    <!--begin::Details-->
                                    <div class="ms-3">
                                        <a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary me-1">Brian
                                            Cox</a>
                                        <span class="text-muted fs-7 mb-1">Just now</span>
                                    </div>
                                    <!--end::Details-->
                                </div>
                                <!--end::User-->
                                <!--begin::Text-->
                                <div class="p-5 rounded bg-light-info text-dark fw-bold mw-lg-400px text-start"
                                    data-kt-element="message-text">Right before vacation season we have the next Big Deal
                                    for you.</div>
                                <!--end::Text-->
                            </div>
                            <!--end::Wrapper-->
                        </div>
                        <!--end::Message(template for in)-->

                        @foreach ($chat_thread as $c)
                            @if (((int) $c->sender) != $u->id)
                                <div class="d-flex justify-content-start mb-10">
                                    <div class="d-flex flex-column align-items-start">
                                        <div class="d-flex align-items-center mb-2">
                                            <div class="symbol symbol-35px symbol-circle">
                                                <img alt="Pic" src="{{ $c->receiver_pic }}" />
                                            </div>
                                            <div class="ms-3">
                                                <a href="#"
                                                    class="fs-5 fw-bolder text-gray-900 text-hover-primary me-1">{{ $c->receiver_name }}</a>
                                                <span class="text-muted fs-7 mb-1">{{ $c->created_at }}</span>
                                            </div>
                                        </div>
                                        <div class="p-5 rounded bg-light-info text-dark fw-bold mw-lg-400px text-start"
                                            data-kt-element="message-text">{!! $c->body !!}</div>
                                    </div>
                                </div>
                            @else
                                <div class="d-flex justify-content-end mb-10">
                                    <div class="d-flex flex-column align-items-end">
                                        <div class="d-flex align-items-center mb-2">
                                            <div class="me-3">
                                                <span class="text-muted fs-7 mb-1">{{ $c->created_at }}</span>
                                                <a href="#"
                                                    class="fs-5 fw-bolder text-gray-900 text-hover-primary ms-1">You</a>
                                            </div>
                                            <div class="symbol symbol-35px symbol-circle">
                                                <img alt="Pic" src="{{ $c->sender_pic }}" />
                                            </div>
                                        </div>
                                        <div class="p-5 rounded bg-light-primary text-dark fw-bold mw-lg-400px text-end"
                                            data-kt-element="message-text">{!! $c->body !!}</div>
                                    </div>
                                </div>
                            @endif
                        @endforeach


                    </div>
                </div>
                <!--end::Card body-->
                <!--begin::Card footer-->
                <div class="card-footer pt-4" id="kt_chat_messenger_footer">
                    <!--begin::Input-->
                    <textarea autofocus class="form-control {{ $chat_is_enabled }} form-control-flush mb-3" {{ $chat_is_enabled }}
                        rows="1" data-kt-element="input" placeholder="Type a message"></textarea>
                    <!--end::Input-->
                    <!--begin:Toolbar-->
                    <div class="d-flex flex-stack">
                        <!--begin::Actions-->
                        <div class="d-flex align-items-center me-2">
                            <button class="btn btn-sm btn-icon btn-active-light-primary me-1" type="button"
                                data-bs-toggle="tooltip" title="Coming soon">
                                <i class="bi bi-paperclip fs-3"></i>
                            </button>
                            <button class="btn btn-sm btn-icon btn-active-light-primary me-1" type="button"
                                data-bs-toggle="tooltip" title="Coming soon">
                                <i class="bi bi-upload fs-3"></i>
                            </button>
                        </div>
                        <!--end::Actions-->
                        <!--begin::Send-->
                        <button class="btn btn-primary {{ $chat_is_enabled }}" {{ $chat_is_enabled }} type="button"
                            data-kt-element="send">Send</button>
                        <!--end::Send-->
                    </div>
                    <!--end::Toolbar-->
                </div>
                <!--end::Card footer-->
            </div>
            <!--end::Messenger-->
        </div>
        <!--end::Content-->
    </div>
@endsection


@section('footer')
    <script src="{{ url('assets/js/widgets.bundle.js') }}"></script>
    <script src="{{ url('assets/js/custom/widgets.js') }}"></script>
    {{-- <script src="{{ url('assets/js/custom/apps/chat/chat.js') }}"></script> --}}
    <script src="{{ url('assets/js/custom/utilities/modals/upgrade-plan.js') }}"></script>
    <script src="{{ url('assets/js/custom/utilities/modals/create-app.js') }}"></script>
    <script src="{{ url('assets/js/custom/utilities/modals/users-search.js') }}"></script>

    <script>
        $(document).ready(function() {




            "use strict";
            var KTAppChat = function() {
                var e = function(e) {
                    var t = e.querySelector('[data-kt-element="messages"]'),
                        n = e.querySelector('[data-kt-element="input"]');
                    if (0 !== n.value.length) {

                        var url = "{{ url('/api/chats') }}";
                        var sender_id = "{{ $u->id }}";
                        var receiver_id = "{{ $receiver_id }}";
                        var product_id = "{{ $product_id }}";


                        $.post(url, {
                                'sender': sender_id,
                                'receiver': receiver_id,
                                'product_id': product_id,
                                'body': n.value,
                            },
                            function(data) {

                            });


                        var o, a = t.querySelector('[data-kt-element="template-out"]'),
                            l = t.querySelector('[data-kt-element="template-in"]');
                        (o = a.cloneNode(!0)).classList.remove("d-none"), o.querySelector(
                                '[data-kt-element="message-text"]').innerText = n.value, n.value = "", t
                            .appendChild(o), t.scrollTop = t.scrollHeight, setTimeout((function() {
                                // (o = l.cloneNode(!0)).classList.remove("d-none"), o.querySelector(
                                //         '[data-kt-element="message-text"]').innerText =
                                //     "Thank you for your awesome support!", t.appendChild(o), t
                                //     .scrollTop = t.scrollHeight
                            }), 2e3)
                    }
                };
                return {
                    init: function(t) {
                        ! function(t) {
                            t && (KTUtil.on(t, '[data-kt-element="input"]', "keydown", (function(n) {
                                if (13 == n.keyCode) return e(t), n.preventDefault(), !1
                            })), KTUtil.on(t, '[data-kt-element="send"]', "click", (function(n) {
                                e(t)
                            })))
                        }(t)
                    }
                }
            }();
            KTUtil.onDOMContentLoaded((function() {
                KTAppChat.init(document.querySelector("#kt_chat_messenger")), KTAppChat.init(document
                    .querySelector("#kt_drawer_chat_messenger"))
            }));
        });
    </script>
@endsection
