<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\ModelTraits;

class PolicyRecommendation extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'policy_recommendation';
    public $table     = 'policy_recommendations';

    protected $guarded = ['created_at'];

    
}
