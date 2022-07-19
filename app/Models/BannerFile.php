<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use App\Traits\ModelTraits;

class BannerFile extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'banner_file';
    public $table     = 'banner_files';

    protected $guarded = ['created_at'];

    public function getFilePathAttribute ($value) {
        // return url('/') . '/' . $value;
        return url('/') . '/storage/' . $value;
    } 
}
