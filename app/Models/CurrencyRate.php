<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CurrencyRate extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'currency_rate';
    public $table     = 'currency_rates';

    protected $guarded = ['created_at'];

}
