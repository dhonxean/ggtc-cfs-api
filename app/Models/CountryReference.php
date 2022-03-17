<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\ModelTraits;

class CountryReference extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'country_reference';
    public $table     = 'country_references';

    protected $guarded = ['created_at'];
}
