<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCountriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('countries', function (Blueprint $table) {
            $table->string('name');
            $table->string('iso2');
            $table->string('iso3')->nullable();
            $table->binary('flag');
            $table->string('currency')->nullable();
            $table->string('region')->nullable();
            $table->enum('publish',[1,0])->default(0);
            $table->softDeletes();
            $table->timestamps();
            
            $table->primary('iso2');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('countries');
    }
}
