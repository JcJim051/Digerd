<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ActasReunion
 *
 * @property int $id_acta_reunion
 * @property Carbon|null $fecha
 * @property character varying|null $lugar
 * @property character varying|null $hora_inicio
 * @property character varying|null $hora_fin
 * @property character varying|null $convoca
 * @property string|null $objeto
 * @property string|null $desarrollo
 * @property string|null $conclusiones
 * @property string|null $asistentes
 * @property int|null $id_tipo_acta
 *
 * @property TiposActum|null $tipos_actum
 * @property EmergenciasActa $emergencias_acta
 *
 * @package App\Models
 */
class ActasReunion extends Model
{
	protected $table = 'actas_reunion';
	protected $primaryKey = 'id_acta_reunion';
	public $timestamps = false;


	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'fecha',
		'lugar',
		'hora_inicio',
		'hora_fin',
		'convoca',
		'objeto',
		'desarrollo',
		'conclusiones',
		'asistentes',
		'id_tipo_acta'
	];

	public function tipos_acta()
	{
		return $this->belongsTo(TiposActa::class, 'id_tipo_acta');
	}

	public function emergencias_acta()
	{
		return $this->hasOne(EmergenciasActa::class, 'id_acta_reunion');
	}
}
