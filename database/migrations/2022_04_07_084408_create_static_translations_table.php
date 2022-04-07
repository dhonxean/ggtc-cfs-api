<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStaticTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('static_translations', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('language_id')->nullable();
            $table->longText('content_fields')->nullable();
            // $table->text('header_title')->nullable();
            // $table->text('dropdown_label')->nullable();
            // $table->text('download')->nullable();
            // $table->text('infographics_title')->nullable();
            // $table->text('cultivation')->nullable();
            // $table->text('curing')->nullable();
            // $table->text('process_manufacturing')->nullable();
            // $table->text('distribution')->nullable();
            // $table->text('use')->nullable();
            // $table->text('disposal')->nullable();
            // $table->text('waste_management')->nullable();
            // $table->text('marine_pollution')->nullable();
            // $table->text('billion')->nullable();
            // $table->text('million')->nullable();
            // $table->text('trillion')->nullable();
            // $table->text('in_usd')->nullable();
            // $table->text('cost')->nullable();
            // $table->text('cigarettes_consumed')->nullable();
            // $table->text('marine_pollution')->nullable();
            // $table->text('waste_management_costs')->nullable();
            // $table->text('consuming')->nullable();
            // $table->text('sticks_of_cigarettes')->nullable();
            // $table->text('produced_mainly')->nullable();
            // $table->text('references')->nullable();
            // $table->text('show_less')->nullable();
            // $table->text('show_more')->nullable();
            // $table->text('threat_title')->nullable();
            // $table->text('threat_p_1')->nullable();
            // $table->text('threat_p_2')->nullable();
            // $table->text('threat_p_3')->nullable();
            // $table->text('threat_p_4')->nullable();
            // $table->text('threat_p_5')->nullable();
            // $table->text('threat_p_6')->nullable();
            // $table->text('threat_p_7')->nullable();
            // $table->text('threat_p_8')->nullable();
            // $table->text('cost_p_1')->nullable();
            // $table->text('cost_p_2')->nullable();
            // $table->text('cost_p_3')->nullable();
            // $table->text('cost_p_4')->nullable();
            // $table->text('cost_p_5')->nullable();
            // $table->text('example_title')->nullable();
            // $table->text('example_p_1')->nullable();
            // $table->text('example_p_2')->nullable();
            // $table->text('example_p_3')->nullable();
            // $table->text('example_p_4')->nullable();
            // $table->text('reco_title')->nullable();
            // $table->text('reco_p_1')->nullable();
            // $table->text('reco_p_2')->nullable();
            // $table->text('reco_p_3')->nullable();
            // $table->text('reco_p_4')->nullable();
            // $table->text('reco_p_5')->nullable();
            // $table->text('reco_p_6')->nullable();
            // $table->text('marine_modal')->nullable();
            // $table->text('waste_modal')->nullable();
            // $table->text('partial_modal')->nullable();
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
        Schema::dropIfExists('static_translations');
    }
}
