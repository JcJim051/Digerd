<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TiposEmergencium
 *
 * @property int $id_tipo_emergencia
 * @property character varying|null $descripcion
 *
 * @property Collection|Emergencia[] $emergencias
 *
 * @package App\Models
 */
class TiposEmergencia extends Model
{
	protected $table = 'tipos_emergencia';
	protected $primaryKey = 'id_tipo_emergencia';
	public $timestamps = false;


	protected $fillable = [
		'descripcion'
	];

	public function emergencias()
	{
		return $this->hasMany(Emergencia::class, 'tipo_emergencia');
	}
}
