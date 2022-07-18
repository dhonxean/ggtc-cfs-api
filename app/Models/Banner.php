<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use App\Traits\ModelTraits;

class Banner extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;
    
    public $modelName = 'banner';
    public $table     = 'banners';

    protected $guarded = ['created_at'];
}
