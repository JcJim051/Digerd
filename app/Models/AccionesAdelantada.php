<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class AccionesAdelantada
 *
 * @property int $id_accion_adelantada
 * @property int|null $id_tipo_actividad
 * @property int|null $id_entidad
 * @property int|null $id_emergencia
 * @property int|null $personas_involucradas
 * @property Carbon|null $fecha
 *
 * @property TiposActividad|null $tipos_actividad
 * @property Entidade|null $entidade
 * @property Emergencia|null $emergencia
 *
 * @package App\Models
 */
class AccionesAdelantada extends Model
{
	protected $table = 'acciones_adelantadas';
	protected $primaryKey = 'id_accion_adelantada';
	public $timestamps = false;



	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'id_tipo_actividad',
		'id_entidad',
		'id_emergencia',
		'personas_involucradas',
		'fecha'
	];

	public function tipos_actividad()
	{
		return $this->belongsTo(TiposActividad::class, 'id_tipo_actividad');
	}

	public function entidad()
	{
		return $this->belongsTo(Entidad::class, 'id_entidad');
	}

	public function emergencia()
	{
		return $this->belongsTo(Emergencia::class, 'id_emergencia');
	}
}
