<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class WorldCountry extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'world_country';
    public $table     = 'world_countries';

    protected $guarded = ['created_at'];

    public function language() {
        return $this->hasOne(Language::class, 'id', 'language_id');
    }
}
