<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StaticTranslation extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'static_translation';
    public $table     = 'static_translations';

    protected $guarded = ['created_at'];
}
