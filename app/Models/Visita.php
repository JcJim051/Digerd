<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Visita
 *
 * @property int $id_visita
 * @property character varying|null $accion
 * @property Carbon|null $fecha
 * @property character varying|null $asunto
 * @property character varying|null $interesado
 * @property character varying|null $localizacion
 * @property string|null $objeto
 * @property string|null $desarrollo
 * @property string|null $concepto
 * @property string|null $tecnico
 * @property string|null $recomendaciones
 *
 * @property Collection|Emergencia[] $emergencias
 *
 * @package App\Models
 */
class Visita extends Model
{
	protected $table = 'visitas';
	protected $primaryKey = 'id_visita';
	public $timestamps = false;


	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'accion',
		'fecha',
		'asunto',
		'interesado',
		'localizacion',
		'objeto',
		'desarrollo',
		'concepto',
		'tecnico',
		'recomendaciones'
	];

	public function emergencias()
	{
		return $this->belongsToMany(Emergencia::class, 'visita_emergencia', 'id_visita', 'id_emergencia')
					->withPivot('id_visita_emergencia');
	}
}
