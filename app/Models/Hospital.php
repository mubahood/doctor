<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hospital extends Model
{
    use HasFactory;

    public function location()
    {
        return $this->belongsTo(Location::class);
    }


    public static function get_items()
    {
        $items = Hospital::where([])
            ->orderBy('name', 'Asc')
            ->get();
        $_items = [];
        foreach ($items as $key => $value) {
            $_items[$value->id] = $value->name;
        }
        return $_items;
    }


} 
