<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CountryCompany extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'country_company';
    public $table     = 'country_companies';

    protected $guarded = ['created_at'];
}
