<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DynamicTranslation extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'dynamic_translation';
    public $table     = 'dynamic_translations';

    protected $guarded = ['created_at'];

    public function language() {
        return $this->hasOne(Language::class, 'id', 'language_id');
    }

    public function country() {
        return $this->hasOne(Country::class, 'id', 'country_id');
    }
}
