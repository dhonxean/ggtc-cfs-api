<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CountryPolicy extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'country_policy';
    public $table     = 'country_policies';

    protected $guarded = ['created_at'];
}
