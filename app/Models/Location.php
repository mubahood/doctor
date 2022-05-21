<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    use HasFactory;


    public function kids()
    {
        return $this->hasMany(Location::class, 'parent');
    }

    public function mother()
    {
        return $this->belongsTo(Location::class, 'parent');
    }

    public static function get_locations()
    {
        $locations = Location::where([])
            ->orderBy('name', 'Asc')
            ->get();
        $_items = [];
        foreach ($locations as $key => $value) {
            $parent = (int) $value->parent;
            if ($parent > 0) {
                $name = "";
                if ($value->mother != null) {
                    $name = $value->mother->name . " - ";
                }
                $_items[$value->id] = $name . $value->name;
            }
        }
        return $_items;
    }
    public static function boot()
    {
        parent::boot();
        static::deleting(function ($model) {
            if ($model->kids != null && (!empty($model->kids))) {
                foreach ($model->kids as $key => $kid) {
                    if ($kid->parent_id == $model->id) {
                        $kid->parent_id = 0;
                        $kid->save();
                    }
                }
            }
        });
    }
}
