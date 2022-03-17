<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\ModelTraits;

class UrbanWaste extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'urban_waste';
    public $table     = 'urban_wastes';

    protected $guarded = ['created_at'];
}
