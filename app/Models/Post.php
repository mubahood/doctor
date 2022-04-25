<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory; 

    public function getCreatedAtAttribute($v)
    {
        return Carbon::parse($v)->diffForHumans();
    }
    
    public function getPostedByAttribute($v)
    {
        $u = Administrator::find($v);
        if($u == null){
            return $v;
        }
        return $u->name;
    }
    
    
    public function getPostCategoryIdAttribute($v)
    {

        $cat = PostCategory::find($v);
        if($cat!=null){
            return $cat->name;
        }
        return env('APP_NAME');
    }
    
    
}
