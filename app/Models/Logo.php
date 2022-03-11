<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Logo extends Model
{
    use HasFactory;

    public $modelName = 'logo';
    public $table     = 'logos';

    protected $guarded = ['created_at'];
}
