<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\ModelTraits;

class Logo extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'logo';
    public $table     = 'logos';

    protected $guarded = ['created_at'];
}
