<?php

namespace App\Models;

use App\Models\Website;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Submodule extends Model
{
    use HasFactory;
    
    protected $fillable = ['name', 'module_id'];

    public function module()
    {
        return $this->belongsTo(Module::class);
    }
}
