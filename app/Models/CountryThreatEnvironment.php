<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\ModelTraits;

class CountryThreatEnvironment extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'country_threat_environment';
    public $table     = 'country_threat_environments';

    protected $guarded = ['created_at'];
}
