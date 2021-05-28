<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class InventarioSalida
 *
 * @property int $id_inventario_salida
 * @property int|null $id_emergencia
 * @property int|null $cantidad
 * @property int|null $fecha
 * @property int|null $id_entidad
 * @property int|null $id_inventario_entrada
 *
 * @property Emergencia|null $emergencia
 * @property Entidade|null $entidade
 * @property InventarioEntrada|null $inventario_entrada
 *
 * @package App\Models
 */
class InventarioSalida extends Model
{
	protected $table = 'inventario_salida';
	protected $primaryKey = 'id_inventario_salida';
	public $timestamps = false;


	protected $fillable = [
		'id_emergencia',
		'cantidad',
		'fecha',
		'id_entidad',
		'id_inventario_entrada'
	];

	public function emergencia()
	{
		return $this->belongsTo(Emergencia::class, 'id_emergencia');
	}

	public function entidad()
	{
		return $this->belongsTo(Entidad::class, 'id_entidad');
	}

	public function inventario_entrada()
	{
		return $this->belongsTo(InventarioEntrada::class, 'id_inventario_entrada');
	}
}
