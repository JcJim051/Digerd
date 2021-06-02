<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Mantenimiento
 *
 * @property int $id_mantenimiento
 * @property int|null $id_maquinaria
 * @property Carbon|null $fecha
 * @property float|null $costo
 *
 * @property Maquinarium $maquinarium
 *
 * @package App\Models
 */
class Mantenimiento extends Model
{
	protected $table = 'mantenimientos';
	protected $primaryKey = 'id_mantenimiento';
	public $timestamps = false;

	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'id_maquinaria',
		'fecha',
		'costo'
	];
	public function export()
	{
		return array(
			"fecha" => $this->fecha,
			"maquinaria" => $this->maquinaria()->descripcion
		);
	}
    protected $with = ['maquinaria'];
	public function maquinaria()
	{
		return $this->belongsTo(Maquinaria::class, 'id_mantenimiento');
	}
}
