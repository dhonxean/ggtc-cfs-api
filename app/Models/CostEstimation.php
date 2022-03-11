<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CostEstimation extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'cost_estimation';
    public $table     = 'cost_estimations';

    protected $guarded = ['created_at'];
}
