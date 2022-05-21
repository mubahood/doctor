<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    use HasFactory;


    protected $fillable = [
        'name',
        'longitude',
        'latitude',
        'details',
        'image',
        'listed',
    ];
    
    public function country()
    {
        return $this->belongsTo(Country::class);
    }

    public function products()
    {

        return $this->hasMany(Product::class);
    }
}
