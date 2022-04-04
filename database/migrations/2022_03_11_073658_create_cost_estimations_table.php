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
            $table->decimal('marine_pollution', $precision = 20, $scale = 2)->nullable();
            $table->decimal('waste_management', $precision = 20, $scale = 2)->nullable();
            $table->decimal('partial_cost', $precision = 20, $scale = 2)->nullable();
            $table->decimal('marine_cost_per_ton', $precision = 20, $scale = 2)->nullable();
            $table->decimal('waste_cost_per_ton', $precision = 20, $scale = 2)->nullable();
            $table->bigInteger('cigarettes_consumed')->nullable();
            $table->string('cigarettes_consumed_unit')->nullable();
            $table->decimal('economic_cost', $precision = 20, $scale = 2)->nullable();
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
