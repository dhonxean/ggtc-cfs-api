<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\ModelTraits;

class CountryRecommendation extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'country_recommendation';
    public $table     = 'country_recommendations';

    protected $guarded = ['created_at'];
}
