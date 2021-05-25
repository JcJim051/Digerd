<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TiposActividad
 * 
 * @property int $id_tipo_actividad
 * @property character varying|null $descripcion
 * @property int|null $finaliza
 * 
 * @property Collection|AccionesAdelantada[] $acciones_adelantadas
 *
 * @package App\Models
 */
class TiposActividad extends Model
{
	protected $table = 'tipos_actividad';
	protected $primaryKey = 'id_tipo_actividad';
	public $timestamps = false;

	protected $casts = [
		'descripcion' => 'character varying',
		'finaliza' => 'int'
	];

	protected $fillable = [
		'descripcion',
		'finaliza'
	];

	public function acciones_adelantadas()
	{
		return $this->hasMany(AccionesAdelantada::class, 'id_tipo_actividad');
	}
}
