<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;
use App\Traits\ModelTraits;

class Language extends Model
{
    use HasFactory, SoftDeletes, ModelTraits;

    public $modelName = 'language';
    public $table     = 'languages';

    protected $guarded = ['created_at'];

    public function static_translation() {
        return $this->hasOne(StaticTranslation::class, 'language_id', 'id');
    }

    public function world_countries() {
        return $this->hasMany(WorldCountry::class, 'language_id', 'id');
    }
}
