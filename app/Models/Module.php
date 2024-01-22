<?php

namespace App\Models;

use App\Models\Website;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Module extends Model
{
    use HasFactory;
    
    protected $fillable = ['name'];

    public function websites(){
        return $this->belongsToMany(Website::class, 'website_has_modules');
    }
}
