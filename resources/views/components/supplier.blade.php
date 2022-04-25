<div class="product-card standard">
    <div class="product-media">
        <div class="product-img"><img src={{$item->get_thumbnail()}} alt="product"> </div>
        <div class="cross-vertical-badge product-badge"><i class="fas fa-clipboard-check"></i><span>recommend</span>
        </div>
    </div>
    <div class="product-content">
        <h2 class="product-title h5"><a href="{{($item->username)}}">{{$item->company_name}}</a></h2>
         
        <div class="product-meta"><span>
                <i class="fas fa-map-marker-alt"></i>
                City/Province:
                {{$item->country->name}},
                {{$item->city->name}}</span><span><i
                    class="fas fa-clock"></i>{{$item->created_at->diffForHumans()}}</span></div>
        <div class="product-info">
            <span> 
                <a href="{{($item->username)}}" class="border p-1  rounded  pl-3 pr-3">VISIT SHOP</a>

            </span>
            <div class="product-btn"><a href="{{($item->username)}}" title="Compare"
                    class="fas fa-compress"></a><button type="button" title="Wishlist" class="far fa-heart"></button>
            </div>
        </div>
    </div>
</div>