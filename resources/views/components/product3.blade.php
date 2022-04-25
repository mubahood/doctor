<div class="row mb-0 pb-2 pt-3 product-card-1 standard pl-2 pr-2 ml-md-0 card p-0 rounded">
    <div class="col-12  p-0 rounded-top">
        <a href="<?= URL::asset('/') ?>{{ $item->slug }}">
            <img class="img-fluid rounded-top" src={{ $item->get_thumbnail() }} alt="product">
        </a>
    </div>
    <div class="col-12 pl-0 pr-0 ">
        <div class="product-content pl-0   mr-0 pr-0 pt-2 ">
            <a class="" style="border:none!important;" href="<?= URL::asset('/') ?>{{ $item->slug }}">
                <h2 class="m-0 h6  border-0 pl-2 pr-2 product-title" style="font-size: .8rem; border:none!important; ">{{ $item->name }}</h2>
            </a> 
            <div class="product-info  mt-0 p-0 border-0 ">
                <h5 class="product-price h6 border-0 pl-2 pr-2">{{ config('app.currency') }} {{ ($item->price) }}<span>  
            </div>
        </div>
    </div>
</div>
