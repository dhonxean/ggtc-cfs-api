<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Role extends Model
{
    use HasFactory, SoftDeletes;

    public $modelName = 'role';
    public $table     = 'roles';
    
    protected $guarded = ['created_at'];

    public function users () {
        return $this->hasMany(User::class);
    }
}
