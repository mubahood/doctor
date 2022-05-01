<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Appointment extends Model
{
    use HasFactory;

    public function client()
    {
        return $this->belongsTo(User::class, 'client_id');
    }
    public function doctor()
    {
        return $this->belongsTo(User::class, 'doctor_id');
    }
    public function hospital()
    {
        return $this->belongsTo(Hospital::class, 'hospital_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    protected $with = ['client', 'doctor', 'hospital'];
    /*
        "created_at": "2022-04-23T17:30:52.000000Z",
        "updated_at": "2022-04-23T17:30:52.000000Z",
        "doctor_id": 1,
        "status": "Pending",
        "price": "12000",
        "latitude": "121.11",
        "longitude": "0.21",
        "order_location": null,
        "": "1",
        "appointment_time": "",
        "details": "Simple",
        

        */
}
