<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PolicyRecommendation extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'policy_recommendation';
    public $table     = 'policy_recommendations';

    protected $guarded = ['created_at'];
}
