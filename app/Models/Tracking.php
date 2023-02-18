<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use App\Traits\ModelTraits;

class Tracking extends Model
{
    use HasFactory, SoftDeletes;
    
    public $modelName = 'tracking';
    public $table     = 'trackings';

    protected $guarded = ['created_at'];

    public function country() {
        return $this->hasOne(WorldCountry::class, 'country_code', 'country_code');
    }
}
