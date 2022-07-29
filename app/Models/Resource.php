<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;
use App\Traits\ModelTraits;

class Resource extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'resource';
    public $table     = 'resources';

    protected $guarded = ['created_at'];

    public function getFilePathAttribute ($value) {
        // return url('/') . '/' . $value;
        return url('/') . '/storage/' . $value;
    } 

    public function getTruepathAttribute () {
        return $this->attributes['file_path'];
    } 

    public function year() {
        return $this->hasOne(ResourcesYear::class, 'id', 'year_id');
    }
}
