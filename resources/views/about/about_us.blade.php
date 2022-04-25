@extends('layouts.layout')




@section('content')
@section('title', "GO-Print - About us")

<section class="inner-section ad-details-part pt-3 mb-0 pb-0 ">
    <div class="container">


        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 mb-md-4 mt-md-4">
                <div class="common-card pt-4 ">


                    <h1 class="text-center h2">Welcome to @php
                        echo config('app.name')
                        @endphp</h1>
                    <p>
                        @php
                        echo config('app.name')
                        @endphp is a website where you can buy and sell almost everything. The best
                        deals are often done with people who live in your own city or on your own street, so on
                        @php
                        echo config('app.name')
                        @endphp it's easy to buy and sell locally. All you have to do is select your region.
                    </p>
                    <br>
                    <p>
                        It takes you less than 2 minutes to post an ad on {{ config('app.name') }}. You can sign up for a free account
                        and post ads easily every time.
                    </p>
                    <br>
                    
                    <p>
                        @php
                        echo config('app.name')
                        @endphp has the widest selection of popular second hand items all over Uganda, which
                        makes it easy to find exactly what you are looking for. So if you're looking for a car, mobile
                        phone, house, computer or maybe a pet, you will find the best deal on {{ config('app.name') }}.
                    </p>
                    <br>
                    <p class="text-left">

                        @php
                        echo config('app.name')
                        @endphp does not specialize in any specific category - here you can buy and sell items in
                        more than 50 different categories. We also carefully review all ads that are being published, to
                        make sure the quality is up to our standards..</p>

                    <br>
                    <p class="text-center"> If you'd like to get in touch with us, go to <a href="/contact">Contact us.</a></p>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</section>

@endsection