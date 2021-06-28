<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Proyecto extends Model
{
    use HasFactory;
    protected $table = 'proyectos';
	protected $primaryKey = 'id_proyecto';
	public $timestamps = false;



    public function municipio()
	{
		return $this->belongsTo(Municipio::class, 'id_municipio');
	}
}
