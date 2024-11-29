<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class VisitaEmergencium
 *
 * @property int $id_visita_emergencia
 * @property int|null $id_emergencia
 * @property int|null $id_visita
 *
 * @property Emergencia|null $emergencia
 * @property Visita|null $visita
 *
 * @package App\Models
 */
class VisitaEmergencia extends Model
{
	protected $table = 'visita_emergencia';
	protected $primaryKey = 'id_visita_emergencia';
	public $timestamps = false;

	protected $fillable = [
		'id_emergencia',
		'id_visita'
	];

	public function emergencia()
	{
		return $this->belongsTo(Emergencia::class, 'id_emergencia');
	}

	public function visita()
	{
		return $this->belongsTo(Visita::class, 'id_visita');
	}
}
