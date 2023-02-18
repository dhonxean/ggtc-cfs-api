<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCampaignVotingConsentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('campaign_voting_consents', function (Blueprint $table) {
            $table->id();
            $table->string('campaign_name')->nullable();
            $table->string('country_code')->nullable();
            $table->enum('type', ['click','redirect', 'facebook', 'twitter']);
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
        Schema::dropIfExists('campaign_voting_consents');
    }
}
