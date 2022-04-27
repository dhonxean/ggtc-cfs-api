<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCostEstimationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cost_estimations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('country_id')->constrained('countries')->onDelete('cascade');
            $table->string('marine_pollution')->nullable();
            $table->string('waste_management')->nullable();
            $table->string('partial_cost')->nullable();
            $table->string('marine_cost_per_ton')->nullable();
            $table->string('waste_cost_per_ton')->nullable();
            $table->bigInteger('cigarettes_consumed')->nullable();
            $table->string('cigarettes_consumed_unit')->nullable();
            $table->string('economic_cost')->nullable();
            $table->string('economic_cost_currency')->nullable();
            $table->string('cigarettes_sticks')->nullable();
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
        Schema::dropIfExists('cost_estimations');
    }
}
