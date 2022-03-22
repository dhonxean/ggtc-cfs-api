<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUrbanWastesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('urban_wastes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('country_id')->constrained('countries')->onDelete('cascade');
            $table->decimal('cost_1', $precision = 20, $scale = 2)->nullable();
            $table->bigInteger('cost_year_1')->nullable();
            $table->decimal('cost_2', $precision = 20, $scale = 2)->nullable();
            $table->bigInteger('cost_year_2')->nullable();
            $table->decimal('cost_of_collection', $precision = 20, $scale = 2)->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('urban_wastes');
    }
}
