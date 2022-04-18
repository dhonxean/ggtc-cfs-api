<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Country extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'country';
    public $table     = 'countries';
    public $incrementing = false;
    protected $primaryKey = 'iso2';

    protected $guarded = ['created_at'];

    public function country_details () {
        return $this->hasMany(CountryDetail::class);
    }

    public function companies() {
        return $this->hasMany(CountryCompany::class, 'country_id', 'id')
                    ->select('id', 'country_id', 'company_id', 'sequence')
                    ->with(['company' => function ($q) {
                        $q->select('id', 'name');
                    }])
                    ->orderBy('sequence');
    }

    public function references() {
        return $this->hasMany(CountryReference::class, 'country_id', 'id');
    }

    public function country_detail() {
        return $this->hasOne(CountryDetail::class, 'country_id', 'id');
    }
    
    public function cost_estimation() {
        return $this->hasOne(CostEstimation::class, 'country_id', 'id');
    }

    public function meta_data() {
        return $this->hasOne(CountryMetadata::class, 'country_id', 'id');
    }

    public function currency_rate() {
        return $this->hasOne(CurrencyRate::class, 'id', 'currency');
    }
}
