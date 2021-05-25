<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class EmergenciasActa
 *
 * @property int|null $id_emergencia
 * @property int|null $id_acta_reunion
 *
 * @property Emergencia|null $emergencia
 * @property ActasReunion|null $actas_reunion
 *
 * @package App\Models
 */
class EmergenciasActa extends Model
{
	protected $table = 'emergencias_actas';
	public $incrementing = false;
	public $timestamps = false;



	protected $fillable = [
		'id_emergencia',
		'id_acta_reunion'
	];

	public function emergencia()
	{
		return $this->belongsTo(Emergencia::class, 'id_emergencia');
	}

	public function actas_reunion()
	{
		return $this->belongsTo(ActasReunion::class, 'id_acta_reunion');
	}
}
