<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\ModelTraits;

class MarineWaste extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'marine_waste';
    public $table     = 'marine_wastes';

    protected $guarded = ['created_at'];
}
