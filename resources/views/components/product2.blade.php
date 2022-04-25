<div class="row mb-0 border-bottom pb-2 pt-3 product-card-1 standard pl-2 pr-2 ml-md-2 mr-md-2">
    <div class="col-12 col-md-4 bg-success p-0">
        <a href="<?= URL::asset('/') ?>{{$item->slug}}">
            <img class="img-fluid" src={{$item->get_thumbnail()}} alt="product">
        </a>
    </div>
    <div class="col-8 pl-0 ">
        <div class="product-content pl-0   mr-0 pr-0 ">
            <h2 class="product-title m-0 h6"><a href="<?= URL::asset('/') ?>{{$item->slug}}">{{$item->name}}</a></h2>
            <div class="product-meta  mt-0 border-0   mb-0"><span><i
                        class="fas fa-map-marker-alt"></i>$item->country->name,
                    $item->city->name</span><span><i
                        class="fas fa-clock"></i>{{$item->created_at}}</span></div>
            <div class="product-info border-0 mt-0 p-0 ">
                <h5 class="product-price h6">{{ config('app.currency') }} {{($item->price)}}<span>/@if ($item->fixed_price)
                        Fixed
                        @else
                        Negotiable
                        @endif</span></h5> 
            </div>
        </div>
    </div>
</div> 