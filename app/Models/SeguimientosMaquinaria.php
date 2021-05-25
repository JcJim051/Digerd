<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class SeguimientosMaquinarium
 *
 * @property int $id_seguimientos_maquinaria
 * @property Carbon|null $fecha
 * @property string|null $descripcion
 * @property int|null $id_maquinaria
 * @property int|null $horas
 *
 * @property Maquinarium|null $maquinarium
 *
 * @package App\Models
 */
class SeguimientosMaquinaria extends Model
{
	protected $table = 'seguimientos_maquinaria';
	protected $primaryKey = 'id_seguimientos_maquinaria';
	public $timestamps = false;


	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'fecha',
		'descripcion',
		'id_maquinaria',
		'horas'
	];

	public function maquinaria()
	{
		return $this->belongsTo(Maquinaria::class, 'id_maquinaria');
	}
}
