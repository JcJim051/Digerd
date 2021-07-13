<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VTiposAyuda extends Model
{
    use HasFactory;
    protected $table = 'v_tipos_ayuda';
	
    public $timestamps = false;
}
