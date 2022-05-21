<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\URL;

class Profile extends Model
{
    use HasFactory; 
    public function get_thumbnail()
    {
        $profile_photo = "";
        if ($this->profile_photo != null) {
            if (strlen($this->profile_photo) > 3) {
                $thumb = json_decode($this->profile_photo);

                if (isset($thumb->thumbnail)) {

                    $thumb->thumbnail = str_replace("public/", "", $thumb->thumbnail);
                    $thumb->thumbnail = str_replace("storage/", "", $thumb->thumbnail);
                    $thumb->thumbnail = str_replace("/storage", "", $thumb->thumbnail);
                    $thumb->thumbnail = str_replace("/", "", $thumb->thumbnail);
                    $profile_photo = URL::asset('storage/' . $thumb->thumbnail);
                }
            }
        }
        return $profile_photo;
    }

    public function category()
    {
        return $this->belongsTo(category::class, 'category_id');
    }

    public function country()
    {
        return $this->belongsTo(Country::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    protected $fillable = [
        'user_id',
    ];


    public static function boot()
    {
        parent::boot();

        self::creating(function ($model) {
        });

        self::created(function ($model) {
        });

        self::updating(function ($model) {
            // ... code here
        });

        self::updated(function ($model) {
            // ... code here
        });

        self::deleting(function ($model) {
            // ... code here
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }
}
