<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Inversione
 *
 * @property int $id_inversion
 * @property character varying|null $descripcion
 * @property float|null $valor
 * @property Carbon|null $fecha
 * @property int|null $id_emergencia
 *
 * @property Emergencia $emergencia
 *
 * @package App\Models
 */
class Inversion extends Model
{
	protected $table = 'inversiones';
	protected $primaryKey = 'id_inversion';
	public $timestamps = false;


	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'descripcion',
		'valor',
		'fecha',
		'id_emergencia'
	];

	public function emergencia()
	{
		return $this->belongsTo(Emergencia::class, 'id_inversion');
	}
}
