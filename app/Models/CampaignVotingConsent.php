<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use App\Traits\ModelTraits;

class CampaignVotingConsent extends Model
{
    use HasFactory, SoftDeletes;
    
    public $modelName = 'campaign_voting_consent';
    public $table     = 'campaign_voting_consents';

    protected $guarded = ['created_at'];

    public function country() {
        return $this->hasOne(Country::class, 'iso2', 'country_code');
    }
}
