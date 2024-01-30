<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Website extends Model
{
    use HasFactory;

    protected $fillable = ['company', 'contact_person', 'contact_number', 'website_name', 'project_type', 'url', 'theme', 'user_id'];


    public function user(){
        return $this->belongsTo(User::class, 'user_id');
    }

    public function modules(){
        return $this->belongsToMany(Module::class, 'website_has_modules');
    }

}
