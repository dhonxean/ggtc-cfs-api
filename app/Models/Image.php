<?php

namespace App\Models;

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Image extends Model
{
    use HasFactory, SoftDeletes;
    
    protected $table   = 'images';
    protected $guarded = ['created_at'];
    protected $hidden  = ['created_at', 'updated_at', 'deleted_at', 'from_import'];

    public function getFilenameAttribute () {
        return $this->attributes['path'];
    }

    public function getPathAttribute ($value) {
         // return url('/') . '/' . $value;
        return url('/') . '/storage/' . $value;
    }

    public function getPathResizedAttribute ($value) {
         // return url('/') . '/' . $value;
        return url('/') . '/storage/' . $value;
    }
}
