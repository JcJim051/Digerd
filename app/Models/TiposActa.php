<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TiposActum
 *
 * @property int $id_tipo_acta
 * @property character varying|null $descripcion
 *
 * @property Collection|ActasReunion[] $actas_reunions
 *
 * @package App\Models
 */
class TiposAct a extends Model
{
	protected $table = 'tipos_acta';
	protected $primaryKey = 'id_tipo_acta';
	public $timestamps = false;


	protected $fillable = [
		'descripcion'
	];

	public function actas_reunions()
	{
		return $this->hasMany(ActasReunion::class, 'id_tipo_acta');
	}
}
