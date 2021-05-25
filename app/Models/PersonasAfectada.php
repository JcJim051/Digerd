<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class PersonasAfectada
 *
 * @property int $id_personas_afectadas
 * @property Carbon|null $fecha
 * @property int|null $hombres
 * @property int|null $mujeres
 * @property int|null $ninos
 * @property int|null $id_emergencia
 *
 * @property Emergencia|null $emergencia
 *
 * @package App\Models
 */
class PersonasAfectada extends Model
{
	protected $table = 'personas_afectadas';
	protected $primaryKey = 'id_personas_afectadas';
	public $timestamps = false;



	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'fecha',
		'hombres',
		'mujeres',
		'ninos',
		'id_emergencia'
	];

	public function emergencia()
	{
		return $this->belongsTo(Emergencia::class, 'id_emergencia');
	}
}
