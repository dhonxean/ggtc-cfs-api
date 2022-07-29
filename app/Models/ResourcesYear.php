<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use App\Traits\ModelTraits;

class ResourcesYear extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'resources_year';
    public $table     = 'resources_years';

    protected $guarded = ['created_at'];

    public function getFilePathAttribute ($value) {
        // return url('/') . '/' . $value;
        return url('/') . '/storage/' . $value;
    } 

    public function getTruepathAttribute () {
        return $this->attributes['file_path'];
    } 

    public function resources() {
        return $this->hasMany(Resource::class, 'id', 'year_id');
    }
}
