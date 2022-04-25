@php
use App\Models\Product;
use App\Models\Attribute;
use App\Models\Utils;
use Illuminate\Support\Str;
use App\Models\Category;
use App\Models\Chat;

$slug = request()->segment(1);
$pro = Product::where('slug', $slug)->firstOrFail();
if ($pro) {
    if (!$pro->user) {
        dd('User not found.');
    }
}
$products = [];
$conds['category_id'] = $pro->category->id;
$products = Product::where($conds)->paginate(4);

$images = $pro->get_images();

$pro->init_attributes();
$attributes = json_decode($pro->attributes);
if ($attributes == null) {
    $attributes = [];
}

$url = $_SERVER['REQUEST_URI'];

$is_logged_in = false;

$user = Auth::user();
$message_link = url('/register');
$message_text = 'send message';
if ($user != null) {
    if (isset($user->id)) {
        $is_logged_in = true;
        if ($pro->user_id == $user->id) {
            $message_link = 'javascript:;';
            $message_text = 'This is your product.';
        } else {
            $chat_thred = Chat::get_chat_thread_id($user->id, $pro->user_id, $pro->id);
            $message_link = url('dashboard/chats/' . $chat_thred);
        }
    }
}
$first_seen = false;
@endphp
@extends('metro.layout.layout-main')
@section('main-content')
@section('footer')
    <script src="assets/plugins/custom/fslightbox/fslightbox.bundle.js"></script>
@endsection

<h1>{{ __('name') }}</h1>

<div class="row  mt-5">
    <div class="col-md-4 bg-white py-5 ">
        <div id="kt_carousel_1_carousel" class="carousel carousel-custom " data-bs-ride="carousel"
            data-bs-interval="8000">
            <div class="carousel-inner slider-arrow">
                @foreach ($images as $img)
                    @php
                        $active = '';
                        if (!$first_seen) {
                            $active = ' active ';
                            $first_seen = true;
                        }
                    @endphp
                    <div class="carousel-item  <?= $active ?>  ">

                        <a class="d-block overlay" data-fslightbox="gallery" href="{{ $img->thumbnail }}">
                            <div class="overlay-wrapper bgi-no-repeat bgi-position-center bgi-size-cover card-rounded">
                                <img class="d-block w-100" src="{{ $img->thumbnail }}" alt="Product photo">
                            </div>
                            <div class="overlay-layer card-rounded bg-dark bg-opacity-25 shadow">
                                <i class="bi bi-eye-fill text-white fs-3x"></i>
                            </div>
                        </a>

                    </div>
                @endforeach
            </div>
            <div class="p-0 m-0 carousel-indicators carousel-indicators-dots bg-dark">
                @php
                    $_count = 0;
                    $active_class = 'active';
                @endphp
                @foreach ($images as $img)
                    <div data-bs-target="#kt_carousel_1_carousel" data-bs-slide-to="{{ $_count }}"
                        class="ms-{{ $_count }} {{ $active_class }}">
                        {{-- <img class="d-block w-100" src="{{ $img->thumbnail }}" alt="details" alt="First slide"> --}}
                    </div>
                    @php
                        $_count++;
                        $active_class = '';
                    @endphp
                @endforeach
            </div>
        </div>



    </div>
    <div class="col-md-5 bg-white pt-5">

        <h1 class=" h1" style="font-weight: 500;">{{ $pro->name }}</h1>
        <div class="separator my-5"></div>
        <h2 class="ad-details-title display-5 text-dark h2">UGX {{ $pro->price }}</h2>
        <div class="separator my-5"></div>

        <table class="table table-striped table-sm">
            @foreach ($attributes as $item)
                @if ($item->type == 'text' || $item->type == 'textarea')
                    <tr>
                        <td>
                            <h6>{{ $item->name }}:</h6>
                        </td>
                        <td><span>{{ $item->value }} {{ $item->units }}</span></td>
                    </tr>
                @elseif($item->type == 'number')
                    <tr>
                        <td>
                            <h6>{{ $item->name }}: </h6>
                        </td>
                        <td>
                            <p>{{ $item->value }} {{ $item->units }}</p>
                        </td>
                    </tr>
                @elseif($item->type == 'select')
                    <tr>
                        <td>
                            <h6>{{ $item->name }}: </h6>
                        </td>
                        <td>
                            <p>{{ $item->value }} {{ $item->units }}</p>
                        </td>
                    </tr>
                @elseif($item->type == 'radio')
                    <tr>
                        <td>
                            <h6>{{ $item->name }}: </h6>
                        </td>
                        <td>
                            <p>{{ $item->value }} {{ $item->units }}</p>
                        </td>
                    </tr>
                @elseif($item->type == 'checkbox')
                    <tr>
                        <td>
                            <h6 class="mr-3">{{ $item->name }}: </h6>
                        </td>
                        <td> @php
                            if ($item->value) {
                                $i = 0;
                                foreach ($item->value as $key => $value) {
                                    $i++;
                                    echo $value;
                                    if ($i != count($item->value)) {
                                        echo ', ';
                                    } else {
                                        echo $value . '.';
                                    }
                                }
                            }
                        @endphp {{ $item->units }}</td>
                    </tr>
                @endif
            @endforeach


        </table>
    </div>
    <div class="col-md-3 bg-white pt-5">
        <div class="card  shadow-sm card-p-2 card-bordered">

            <div class="card-body py-5">
                Offered by: <b>{{ $pro->seller_name }}</b>
                <div class="separator my-5"></div>
                <a href="#"
                    class="btn btn-outline btn-outline-dashed btn-outline-danger btn-active-light-primary btn-lg rounded-0 d-block">
                    Show Phone Number
                </a>
                <div class="separator my-5"></div>
                @if ($is_logged_in)
                    <a href="{{ $message_link }}"
                        class="btn  btn-danger btn-lg rounded-0 d-block btn-active-light-primary"><i
                            class="las la-wallet fs-2 me-2"></i>
                        {{ $message_text }}</a>
                @else
                    <a href="{{ url('register') }}"
                        class="btn  btn-danger btn-lg rounded-0 d-block btn-active-light-primary"><i
                            class="las la-wallet fs-2 me-2"></i>
                        SEND MESSAGE</a>
                @endif

            </div>
        </div>

        <div class="card shadow-sm mt-5 card-p-3">
            <div class="card-body">
                <ul class="list-group">
                    <li class="list-group-item active bg-dark border-dark">Stay safe!</li>
                    <li class="list-group-item">Avoid offers that look unrealistic</li>
                    <li class="list-group-item">Chat with seller to clarify item details</li>
                    <li class="list-group-item">Meet in a safe &amp; public place</li>
                    <li class="list-group-item">Check the item before buying it</li>
                    <li class="list-group-item">Don’t pay in advance</li>
                    <li class="list-group-item">
                        <button type="button" class="btn btn-sm btn-light-dark ">
                            See all safety tips
                        </button>
                    </li>
                </ul>
            </div>

        </div>

    </div>


</div>
<div class="row bg-white mt-5 py-5">
    <div class="col-12">
        <h2>Description</h2>
        {{ $pro->description }}
    </div>
</div>

<style>
    .fslightbox-absoluted {
        background-color: #414E4E;
    }

</style>
@endsection
