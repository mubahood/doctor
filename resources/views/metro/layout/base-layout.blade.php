<!DOCTYPE html>
<html lang="en">

<head>
    <title>Metronic - the world's #1 selling Bootstrap Admin Theme Ecosystem for HTML, Vue, React, Angular &amp;
        Laravel by Keenthemes</title>
    <meta charset="utf-8" />
    <meta name="description"
        content="The most advanced Bootstrap Admin Theme on Themeforest trusted by 94,000 beginners and professionals. Multi-demo, Dark Mode, RTL support and complete React, Angular, Vue &amp; Laravel versions. Grab your copy now and get life-time updates for free." />
    <meta name="keywords"
        content="Metronic, bootstrap, bootstrap 5, Angular, VueJs, React, Laravel, admin themes, web design, figma, web development, free templates, free admin themes, bootstrap theme, bootstrap template, bootstrap dashboard, bootstrap dak mode, bootstrap button, bootstrap datepicker, bootstrap timepicker, fullcalendar, datatables, flaticon" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:type" content="article" />
    <meta property="og:title"
        content="Metronic - Bootstrap 5 HTML, VueJS, React, Angular &amp; Laravel Admin Dashboard Theme" />
    <meta property="og:url" content="https://keenthemes.com/metronic" />
    <meta property="og:site_name" content="Keenthemes | Metronic" />
    <link rel="canonical" href="https://preview.keenthemes.com/metronic8" />
    <link rel="shortcut icon" href="assets/media/logos/favicon.ico" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
    <link href="{{ url('/') }}/assets/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet"
        type="text/css" />
    <link href="{{ url('/') }}/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('/') }}/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />


    @yield('header')

    <style>
        .my-active-menu {
            border-bottom: var(--bs-blue) 5px solid;
            background-color: rgb(235, 235, 235);
        }
        .menu-link{
            border-radius: 0px!important;
        }

    </style>
</head>

@yield('base-content')


<script src="{{ url('/') }}/assets/plugins/global/plugins.bundle.js"></script>
<script src="{{ url('/') }}/assets/js/scripts.bundle.js"></script>
<script src="{{ url('/') }}/assets/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>
<script src="{{ url('/') }}/assets/plugins/custom/datatables/datatables.bundle.js"></script>

{{-- <script src="{{ url('/') }}/assets/js/widgets.bundle.js"></script>
<script src="{{ url('/') }}/assets/js/custom/widgets.js"></script>
<script src="{{ url('/') }}/assets/js/custom/apps/chat/chat.js"></script>
<script src="{{ url('/') }}/assets/js/custom/utilities/modals/upgrade-plan.js"></script>
<script src="{{ url('/') }}/assets/js/custom/utilities/modals/create-app.js"></script>
<script src="{{ url('/') }}/assets/js/custom/utilities/modals/users-search.js"></script> --}}
@yield('footer')

</html>
