<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TiposAyuda
 *
 * @property int $id_tipo_ayuda
 * @property character varying|null $descripcion
 *
 * @property Collection|InventarioEntrada[] $inventario_entradas
 *
 * @package App\Models
 */
class TiposAyuda extends Model
{
	protected $table = 'tipos_ayuda';
	protected $primaryKey = 'id_tipo_ayuda';
	public $timestamps = false;


	protected $fillable = [
		'descripcion'
	];

	public function inventario_entradas()
	{
		return $this->hasMany(InventarioEntrada::class, 'id_tipo_ayuda');
	}
}
