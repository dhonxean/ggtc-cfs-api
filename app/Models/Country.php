<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Country extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'country';
    public $table     = 'countries';
    public $incrementing = false;
    protected $primaryKey = 'iso2';

    protected $guarded = ['created_at'];
}
