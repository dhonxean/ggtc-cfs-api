<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CountryDetail extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'country_detail';
    public $table     = 'country_details';

    protected $guarded = ['created_at'];
}
