<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Maquinarium
 *
 * @property int $id_maquinaria
 * @property character varying|null $marca
 * @property character varying|null $capacidad
 * @property character varying|null $presupuesto
 * @property character varying|null $ubicacion
 * @property character varying|null $descripcion
 * @property int|null $activa
 *
 * @property Mantenimiento $mantenimiento
 * @property Collection|SeguimientosMaquinarium[] $seguimientos_maquinaria
 *
 * @package App\Models
 */
class Maquinaria extends Model
{
	protected $table = 'maquinaria';
	protected $primaryKey = 'id_maquinaria';
	public $timestamps = false;


	protected $fillable = [
		'marca',
		'capacidad',
		'presupuesto',
		'ubicacion',
		'descripcion',
		'activa'
	];

	public function mantenimiento()
	{
		return $this->hasOne(Mantenimiento::class, 'id_mantenimiento');
	}

	public function seguimientos_maquinaria()
	{
		return $this->hasMany(SeguimientosMaquinaria::class, 'id_maquinaria');
	}
	public function getInfoAttribute()
	{
		return $this->descripcion . ":{$this->placa}[{$this->serial}]";
	}
}
