<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\ModelTraits;

class ResourcesContent extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'resources_content';
    public $table     = 'resources_contents';

    protected $guarded = ['created_at'];
}
