<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAppointmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('appointments', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->integer('hospitial_id')->nullable()->default(1);
            $table->integer('doctor_id')->nullable()->default(1);
            $table->integer('client_id')->nullable()->default(1);
            $table->string('status')->nullable();
            $table->string('price')->nullable();
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->string('order_location')->nullable();
            $table->string('category_id')->nullable();
            $table->string('appointment_time')->nullable();
            $table->text('details')->nullable(); 

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('appointments'); 
    }
}
