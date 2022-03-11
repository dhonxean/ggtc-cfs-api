<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CountryLogo extends Model
{
    use HasFactory;

    public $modelName = 'country_logo';
    public $table     = 'country_logos';

    protected $guarded = ['created_at'];
}
