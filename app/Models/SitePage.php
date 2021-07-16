<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SitePage extends Model
{
    use HasFactory;
    protected $table = "site_pages";
    public $timestamps=false;
    protected $primaryKey = 'id_page'; // or null
    public function contents()
    {
        return $this->hasMany(\App\Models\SiteContent::class,"id_page","id_page")->orderBy('sort', 'asc');;
    }
    public function template()
    {
        return $this->belongsTo(\App\Models\SiteTemplate::class,"id_template","id_template");
    }

}
