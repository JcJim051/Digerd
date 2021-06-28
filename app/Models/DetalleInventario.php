<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetalleInventario extends Model
{
    use HasFactory;
    protected $table = 'detalle_inventario';
	protected $primaryKey = 'id_detalle_inventario';
	public $timestamps = false;
	public function tipo_ayuda()
	{
		return $this->belongsTo(TiposAyuda::class, 'id_tipo_ayuda');
	}

}
