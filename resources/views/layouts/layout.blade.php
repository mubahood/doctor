<?php
use App\Models\Category;
use App\Models\Product;
// check if is a product page
$is_product_page = false;
if( request()->segment(1) != null){
    $slug = request()->segment(1);
    $_pro = Product::where('slug', $slug)->first();
    if($_pro!=null && $_pro->id != null){
        if($_pro->id>0){
            $is_product_page = true;
        }
    }
}

 
?>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Muhindo Mubaraka">
    <meta name="title" content="JO-Trace">
    <meta name="keywords"
        content="classicads, classified, ads, classified ads, listing, business, directory, jobs, marketing, portal, advertising, local, posting, ad listing, ad posting,">
    <title>@yield('title')</title>
    <link rel="icon" href="<?= URL::asset('assets/') ?>/images/favicon.png">
    <link rel="stylesheet" href="{{ URL::asset('/assets/fonts/flaticon/flaticon.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('/assets/fonts/font-awesome/fontawesome.css') }}">
    {{--
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/slick.min.css') }}"> --}}
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/bootstrap.min.css') }}">

 
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/main.css') }}">



    <link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/index.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/ad-details.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/simple-lightbox.css') }}">
    @yield('head')
</head>



<?php 
$this_url = url("/");
if(isset($_SERVER['PATH_INFO'])){
$this_url = url($_SERVER['PATH_INFO']);
}

$key_word = "";
if(isset($_GET['search'])){
if(strlen(isset($_GET['search']))>0){
$key_word = trim($_GET['search']);

}
} 
 
 ?>




<?php if(!Request::ajax()){ ?>

<body>
    @if ("login" != request()->segment(1))
    @if (
        "register" != request()->segment(1) &&
        "password-reset" != request()->segment(1) 
    )
    <header class="header-part">
        <div class="container">
            <div class="header-content">
                <div class="header-left"><button type="button" class="header-widget sidebar-btn"><i
                            class="fas fa-align-left"></i></button><a href="<?= URL::asset('/') ?>"
                        class="header-logo"><img src="<?= URL::asset('assets/') ?>/images/logo-1.png" alt="logo"></a>

                </div>
                <form action="{{$this_url}}" class="header-form" action="/">
                    <div class="header-search pl-3">
                        <input name="search" type="search" value="{{$key_word}}"
                            placeholder="Search, Whatever you need...">
                        <button type="submit" title="Search Submit "><i class="fas fa-search"></i></button>
                    </div>
                </form>
                <div class="header-right">
                    @auth
                    <ul class="header-list">

                        <li class="header-item"><a type="button" href="{{url("messages")}}" class="header-widget"><i
                                    class="fas fa-envelope"></i><sup>0</sup></a> 
                        </li>
                    </ul>

                    <a href="<?= url('/dashboard') ?>" class="header-widget header-user"><img
                            src="<?= URL::asset('assets/') ?>/images/user.png" alt="user"><span class="text-white">My
                            Account</span></a><button type="button" class="header-widget search-btn"><i
                            class="fas fa-search"></i></button>
                    @endauth
                    @guest

                    <a href="{{ url("/register") }}" class="header-user border rounded  text-white border-white mr-3  login-btn">
                        <span class="login-btn pr-3 pl-3 pt-2 pb-2 d-block text-white" style="color: white!important">Register</span>
                    </a>

                    <a href="{{ url("/login") }}"
                        class="header-widget header-user border rounded text-white border-white login-btn login-btn"><span
                            class="login-btn pr-2 pt-2 pb-2  " style="color: white!important">Sign in</span></a>
                    @endguest

                    <a href="<?= url('/post-ad') ?>" class="btn btn-inline post-btn"><i
                            class="fas fa-plus-circle"></i><span>post ad</span></a>
                </div>
            </div>
        </div>
    </header>
    {{-- <div class="progress loading" style="height: 5px;">
        <div class="progress-bar progress-bar-striped progress-bar-animated progress-bar-animated" role="progressbar"
            style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
    </div> --}}

    <aside class="sidebar-part">
        <div class="sidebar-body">
            <div class="sidebar-header"><a href="<?= URL::asset('/') ?>" class="sidebar-logo"><img
                        src="<?= URL::asset('assets/') ?>/images/logo.png" alt="logo"></a><button
                    class="sidebar-cross"><i class="fas fa-times"></i></button></div>
            <div class="sidebar-content">
                <div class="sidebar-profile">

                    @auth
                    @php
                    if(strlen(Auth::user()->name)<1){ Auth::user()->name = null;
                        }
                        @endphp
                        <a href="/" class="sidebar-avatar"><img src="<?= URL::asset('assets/') ?>/images/avatar/01.jpg"
                                alt="avatar"></a>
                        <h4><a href="#" class="sidebar-name">{{ Auth::user()->name ?? Auth::user()->email }}</a></h4>
                        @endauth


                        <a href="<?= URL::asset('/') ?>" class="btn btn-inline sidebar-post"><i
                                class="fas fa-plus-circle"></i><span>post your
                                ad</span></a>
                </div>
                <div class="sidebar-menu">
                    <ul class="nav nav-tabs">
                        <li><a href="#main-menu" class="nav-link active" data-toggle="tab">Categories</a></li>
                        <li><a href="#author-menu" class="nav-link" data-toggle="tab">My Account</a></li>
                    </ul>
                    <div class="tab-pane active" id="main-menu">
                        <ul class="navbar-list">
                            @php
                            $cats = Category::all();
                            @endphp
                            @foreach ($cats as $item)
                            @php
                            if($item->parent == null){
                            $parent = 0;
                            }else{
                            $parent = (int)($item->parent);
                            }

                            if($parent>=1){
                            continue;
                            }
                            @endphp
                            <li class="navbar-item navbar-dropdown"><a class="navbar-link"
                                    href="#"><span>{{$item->name}}</span><i class="fas fa-plus"></i></a>
                                <ul class="dropdown-list">
                                    @foreach ($item->sub_categories as $sub_item)
                                    <li class="navbar-item"><a class="navbar-link" href="/{{ $sub_item->slug }}">
                                            <span style="color: black!important">
                                                {{$sub_item->name}}
                                            </span>
                                            <span style="color: black!important">{{ count($sub_item->products) }}</span>
                                        </a>
                                    </li>
                                    @endforeach
                            </li>
                        </ul>
                        </li>
                        @endforeach

                        </ul>
                    </div>
                    <div class="tab-pane" id="author-menu">
                        @guest
                        <ul class="navbar-list text-center">

                            <a href="<?= URL::asset('/login') ?>" class="btn btn-inline sidebar-post mt-4"><i
                                    class="fas fa-sign-in-alt"></i><span>LOGIN</span></a>
                        </ul>
                        @endguest
                        @auth
                        @php
                        $id = Auth::id();
                        @endphp
                        <ul class="navbar-list">
                            <li class="navbar-item"><a class="navbar-link" href="/dashboard">My Ads</a></li>
                            <li class="navbar-item navbar-dropdown"><a class="navbar-link"
                                    href="/messages"><span>Messages</span><span>0</span></a></li>
                            <li class="navbar-item"><a class="navbar-link" href="{{ url('profile-edit') }}/{{ $id }}">My
                                    profile</a>
                            </li>
                            <li class="navbar-item"><a class="navbar-link" href="/logout">Logout</a></li>

                        </ul>
                        @endauth
                    </div>
                </div>
                <div class="sidebar-footer">
                    <p>All Rights Reserved By <a href="javascript:;">GO-Print</a></p> 
                </div>
            </div>
        </div>
    </aside>
    @endif
    @endif

    <?php
}
    ?>
    <div>
        @yield('content')
    </div>



    <?php
if(!Request::ajax()){
?>
    @if ("messages" != request()->segment(1))

    @if (
    "login" != request()->segment(1)
    )

    @if ( "register" != request()->segment(1)
    )

    @if (
    "dashboard" != request()->segment(1) &&
    "post-ad" != request()->segment(1)
    )

    @guest
    @if (!$is_product_page)
    <nav class="mobile-nav">
        <div class="container">
            <div class="mobile-group">
                <a href="<?= URL::asset('/') ?>" class="mobile-widget"><i class="fas fa-home"></i><span>Home</span></a>
                <a href="javascript:;" class="mobile-widget sidebar-btn"><i
                        class="fas fa-bars"></i><span>Categories</span></a>
                <a href="<?= URL::asset('/post-ad') ?>" class="mobile-widget plus-btn"><i
                        class="fas fa-plus"></i><span>Post Ad</span></a>
                <a href="<?= URL::asset('/register') ?>" class="mobile-widget"><i class="fas fa-user"></i><span>Join
                        Me</span><sup>0</sup></a>
                <a href="<?= URL::asset('/about') ?>" class="mobile-widget"><i
                        class="fas fa-info-circle"></i><span>About Us</span></a>
            </div>
        </div>
    </nav>
    @endif

    @endguest
    @auth
    @if (!$is_product_page)
    <nav class="mobile-nav">
        <div class="container">
            <div class="mobile-group">
                <a href="<?= URL::asset('/') ?>" class="mobile-widget"><i class="fas fa-home"></i><span>Home</span></a>
                <a href="javascript:;" class="mobile-widget sidebar-btn"><i
                        class="fas fa-bars"></i><span>Categories</span></a>
                <a href="<?= URL::asset('/post-ad') ?>" class="mobile-widget plus-btn"><i
                        class="fas fa-plus"></i><span>Post Ad</span></a>
                <a href="<?= URL::asset('/register') ?>" class="mobile-widget"><i
                        class="fas fa-comments"></i><span>Chats</span><sup>0</sup></a>
                <a href="<?= URL::asset('/dashboard') ?>" class="mobile-widget"><i class="fas fa-store"></i><span>My
                        Ads</span></a>
            </div>
        </div>
    </nav>
    @endif
    @endauth

    @if (!$is_product_page)
    @endif
    <nav class="mobile-nav  p-0 m-0">
        <div class="mobile-group p-0 m-0 text-center">
            @yield('mobile-nav')
        </div>
    </nav>
    @endif





    @if (
    "dashboard" != request()->segment(1) &&
    "post-ad" != request()->segment(1)
    )
    <footer class="footer-part pt-4 border-top border-primary">
        <div class="container">

            <div class="row pb-2 pb-md-4">
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="footer-content">
                        <ul class="footer-widget">
                            <li>
                                <i class="fas fa-dollar-sign"></i>
                                <a class="text-dark" href="{{ url('sell-fast') }}">How to sell on
                                    <?= config('app.domain') ?>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="footer-content">
                        <ul class="footer-widget">
                            <li>
                                <i class="fas fa-info-circle"></i>
                                <a class="text-dark" href="<?= URL::asset('/about') ?>">About us</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="footer-content">
                        <ul class="footer-widget">
                            <li>
                                <i class="fas fa-address-book"></i>
                                <a class="text-dark" href="<?= URL::asset('/contact') ?>">Contact us</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="footer-content">
                        <ul class="footer-widget">
                            <li>
                                <i class="fas fa-store"></i>
                                <a class="text-dark" href="<?= URL::asset('/about') ?>">Download our App on
                                    Playstore</a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
        <div class="footer-end">
            <div class="container">
                <div class="footer-end-content">
                    <p>All Copyrights Reserved &copy; 2022 </p>
                    <ul class="footer-social">
                        <li><a href="<?= config('app.facebook') ?>"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="<?= config('app.twitter') ?>"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="<?= config('app.youtube') ?>"><i class="fab fa-youtube"></i></a></li>
                        <li><a href="<?= config('app.instagram') ?>"><i class="fab fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    @endif

    <div class="modal fade" id="currency">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Choose a Currency</h4><button class="fas fa-times" data-dismiss="modal"></button>
                </div>
                <div class="modal-body"><button class="modal-link active">United States Doller (USD) -
                        $</button><button class="modal-link">Euro (EUR) - €</button><button class="modal-link">British
                        Pound (GBP) -
                        £</button><button class="modal-link">Australian Dollar (AUD) - A$</button><button
                        class="modal-link">Canadian Dollar (CAD) - C$</button></div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="language">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Choose a Language</h4><button class="fas fa-times" data-dismiss="modal"></button>
                </div>
                <div class="modal-body"><button class="modal-link active">English</button><button
                        class="modal-link">bangali</button><button class="modal-link">arabic</button><button
                        class="modal-link">germany</button><button class="modal-link">spanish</button></div>
            </div>
        </div>
    </div>

    @endif
    @endif

    @endif

    <?php
    if(!Request::ajax()){
?>

    <script src="{{ URL::asset('/assets/js/vendor/jquery-1.12.4.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/js/vendor/popper.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/js/vendor/bootstrap.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/js/custom/main.js') }} "></script>
    {{-- <script src="{{ URL::asset('vendor/laravel-admin/jquery-pjax/jquery.pjax.js') }} "></script> --}}
    {{-- <script src="{{ URL::asset('/assets/js/vendor/slick.min.js') }} "></script> --}}




    <script>
        $(document).ready(function () {
            ('.loading').hide(); 
        });
    </script>

    <?php
    }
    ?>


</body>

</html>

<?php
}
    ?>

@yield('foot')