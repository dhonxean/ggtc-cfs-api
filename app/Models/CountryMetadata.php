<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CountryMetadata extends Model
{
    use HasFactory;

    public $modelName = 'country_metadata';
    public $table     = 'country_metadata';

    protected $guarded = ['created_at'];
}
