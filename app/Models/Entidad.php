<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Entidade
 *
 * @property int $id_entidad
 * @property character varying|null $nombre
 * @property character varying|null $responsable
 * @property character varying|null $telefono
 * @property character varying|null $direccion
 *
 * @property Collection|Emergencia[] $emergencias
 * @property Collection|InventarioEntrada[] $inventario_entradas
 * @property Collection|InventarioSalida[] $inventario_salidas
 * @property Collection|AccionesAdelantada[] $acciones_adelantadas
 *
 * @package App\Models
 */
class Entidad extends Model
{
	protected $table = 'entidades';
	protected $primaryKey = 'id_entidad';
	public $timestamps = false;



	protected $fillable = [
		'nombre',
		'responsable',
		'telefono',
		'direccion'
	];

	public function emergencias()
	{
		return $this->hasMany(Emergencia::class, 'id_entidad');
	}

	public function inventario_entradas()
	{
		return $this->hasMany(InventarioEntrada::class, 'id_entidad');
	}

	public function inventario_salidas()
	{
		return $this->hasMany(InventarioSalida::class, 'id_entidad');
	}

	public function acciones_adelantadas()
	{
		return $this->hasMany(AccionesAdelantada::class, 'id_entidad');
	}
}
