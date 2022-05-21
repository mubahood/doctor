<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MenuItem extends Model
{
    use HasFactory;
    public function kids()
    {
        return $this->hasMany(MenuItem::class, 'parent_id');
    }

    public static function boot()
    { 
        parent::boot();
        static::deleting(function ($model) {
            if($model->kids!=null && (!empty($model->kids))){
                foreach ($model->kids as $key => $kid) {
                    $kid->parent_id = 0;
                    $kid->save();
                }
            }
        });
    }

}
