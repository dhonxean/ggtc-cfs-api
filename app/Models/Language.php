<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Language extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'language';
    public $table     = 'languages';

    protected $guarded = ['created_at'];

    public function static_translation() {
        return $this->hasOne(StaticTranslation::class, 'language_id', 'id');
    }
}
