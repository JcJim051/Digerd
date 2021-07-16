<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SiteTemplate extends Model
{
    use HasFactory;
    protected $table = "site_templates";
    public $timestamps=false;
    protected $primaryKey = 'id_template'; // or null

}
