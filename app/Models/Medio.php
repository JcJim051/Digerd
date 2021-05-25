<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Medio
 *
 * @property int $id_medio
 * @property int|null $id_emergencia
 * @property character varying|null $descripcion
 * @property string|null $archivo
 * @property character|null $tipo
 *
 * @property Emergencia|null $emergencia
 *
 * @package App\Models
 */
class Medio extends Model
{
	protected $table = 'medios';
	protected $primaryKey = 'id_medio';
	public $timestamps = false;

	protected $fillable = [
		'id_emergencia',
		'descripcion',
		'archivo',
		'tipo'
	];

	public function emergencia()
	{
		return $this->belongsTo(Emergencia::class, 'id_emergencia');
	}
}
