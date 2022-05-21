<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;
use phpDocumentor\Reflection\Types\This;
use Psy\CodeCleaner\ValidConstructorPass;

use function PHPUnit\Framework\fileExists;

class Product extends Model
{
    use HasFactory;
    
    public function doctor()
    {
        return $this->belongsTo(Administrator::class,'doctor_id');
    }
    
    public function hospital()
    {
        return $this->belongsTo(Hospital::class);
    }

    public static function get_nearest_products($loc){
         
        $p2 = $loc['lati']*$loc['long'];
        if($p2<0){
            $p2 = (-1)*($p2);
        }

        $pros = Product::where('sub_category_id',$loc['cat_id'])->get();
        $distances = [];
        foreach ($pros as $key => $val) {
            $p1 = ((double)($val->latitude)) * ((double)($val->longitude));
            if($p1<0){
                $p1 = (-1)*($p1);
            }
            $p = $p1 - $p2;
            if($p < 0){
                $p = (-1)*($p);
            }
            $distances[$val->id.""] = $p;
        }

        asort($distances);

        $_hospitals = [];
        foreach ($distances as $key => $dis) {
            $hos = Product::find($key);
            if($hos == null){
                continue;
            }
            $hos->distance = $dis;
            $_hospitals[] = $hos;
        }
        $i = 1;
        return $_hospitals;
    }


    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->diffForHumans();
    }


    public function getQuantityAttribute($value)
    {
        return (int)($value);
    } 


    public function getPriceAttribute($value)
    {
        return number_format((int)($value));
    }

   
    public static function on_update ($p) {
        $cat = Category::find($p->sub_category_id);
        $u = User::find($p->user_id);
        $hos = Hospital::find($p->hospital_id);

        if($p->name == null || (strlen($p->name)<2) ){
            if($cat!=null && $u!=null){
                $p->name = $cat->name." By ".$u->name;
            }
        }

        $p->category_id = $p->sub_category_id;
        if($cat!=null){
            if( ((int)($cat->parent)) > 0  ){
                $p->category_id = $cat->parent;    
            }
        }
        
        if($hos!=null){
            $p->location_id = $hos->location_id;
            $p->latitude = $hos->latitude;
            $p->longitude = $hos->longitude;
        }
        
        $p->slug = Utils::make_slug($p->name);
        $p->status = 1;
        
        return $p;
    }


    public static function boot()
    {
        parent::boot();

        self::creating(function ($p) {
            $p = Product::on_update($p); 
            return $p;
        });

        self::updating(function ($p) {
            $p = Product::on_update($p); 
            return $p;
        });



     
        static::deleting(function ($model) {

            $thumbs = json_decode($model->images);
            if ($thumbs != null) {
                foreach ($thumbs as $key => $value) {
                    if (isset($value->thumbnail)) {
                        if (Storage::delete($value->thumbnail)) {
                            //echo "GOOD thumbnail <hr>";
                        }
                    }

                    if (isset($value->src)) {
                        if (Storage::delete($value->src)) {
                            // echo "GOOD  src <hr>";
                        }
                    }
                }
            }
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function location()
    {
        return $this->belongsTo(Location::class);
    }


    public function category()
    {
        return $this->belongsTo(Category::class, "category_id");
    }

    public function country()
    {
        return $this->belongsTo(Country::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function reviews()
    {
        return $this->hasMany(ProductReview::class);
    }


    public function sub_category()
    {
        return $this->belongsTo(Category::class, "sub_category_id");
    }

    public function get_name_short($min_length = 50)
    {
        if (strlen($this->name) > $min_length) {
            return substr($this->name, 0, $min_length) . "...";
        }
        return $this->name;
    }
    public function get_thumbnail()
    {

        $thumbnail = url('storage/no_image.png');
        if ($this->thumbnail != null) {
            if (strlen($this->thumbnail) > 3) {
                $thumb = json_decode($this->thumbnail);
                if (isset($thumb->thumbnail)) {
                    $thumbnail = url('storage/'.$thumb->thumbnail);
                }
            }
        }
        return $thumbnail;
    }

    public function get_images()
    {
        $images = [];
        if ($this->images != null) {
            if (strlen($this->images) > 3) {
                $images_json = json_decode($this->images);
                foreach ($images_json as $key => $img) {
                    $img->src = url($img->src);
                    $img->thumbnail = url($img->thumbnail);
                    $images[] = $img;
                }
            }
        }
        return $images;
    }


    protected $appends = [
        'seller_name',
        'category_name',
        'city_name',
    ];

    public function getCityNameAttribute($value)
    {
        $city_id = (int)($this->city_id);
        $city = City::find($city_id);
        if ($city == null) {
            return "-";
        }
        $c = $city->country;
        if ($c != null) {
            return $c->name . ", " . $city->name;
        }
        return $city->name;
    }


    public function getCategoryNameAttribute()
    {

        $name = "-";
        $cat = Category::find($this->category_id);
        if ($cat == null) {
            return "-";
        } else {
            if (
                isset($cat->parent) &&
                ($cat->parent > 0)
            ) {
                $name = $cat->name;
                $_cat = Category::find($cat->parent);
                if ($_cat != null) {
                    $name = $_cat->name . ", " . $cat->name;
                }
            }
        }
        return $name;
    }

    public function getSellerNameAttribute()
    {
        $u = User::find($this->user_id);
        if ($u == null) {
            $u = new User();
        }
        if ($u->company_name == null || (strlen($u->company_name) < 2)) {
            return $u->name;
        } else {
            return $u->company_name;
        }
    }


    public function init_attributes()
    {

        $attributes = json_decode($this->attributes['attributes']);
        if ($attributes == null) {
            $attributes = [];
        }
        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Nature of offer';
        $att->units = '';
        $attributes[] = $att;


        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Quantity available';
        $att->units = '';
        $att->value = $this->quantity;;
        $attributes[] = $att;


        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Category';
        $att->units = '';
        $att->value = $this->category_name;;
        $attributes[] = $att;


        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Location';
        $att->units = '';
        $att->value = $this->city_name;
        $attributes[] = $att;


        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Offered by';
        $att->units = '';
        $att->value = $this->seller_name;
        $attributes[] = $att;


        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Posted';
        $att->units = '';
        $att->value = $this->created_at;
        $attributes[] = $att;

        $this->attributes['attributes'] =  json_encode($attributes);
    }

    public function get_price(){
        return ((int)( str_replace(',','',$this->price) ));
    }

    public function get_quantity(){
        return ((int)( str_replace(',','',$this->quantity) ));
    }

    protected $fillable = [
        'name',
        'user_id',
        'category_id',
        'sub_category_id',
        'price',
        'description',
        'city_id',
        'country_id',
        'slug',
        'thumbnail',
        'status',
        'attributes',
        'images',
        'city',
    ];
}
