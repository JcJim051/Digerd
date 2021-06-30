<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

/**
 * Class Municipio
 * 
 * @property int $id_municipio
 * @property character varying|null $nombre
 * 
 * @property Collection|Emergencia[] $emergencias
 *
 * @package App\Models
 */
class Municipio2 extends Model
{
	protected $table = 'municipios';
	protected $primaryKey = 'id_municipio';
	public $incrementing = false;
	public $timestamps = false;
	

	protected $fillable = [
		'nombre'
	];

	public function emergencias()
	{
		return $this->hasMany(Emergencia::class, 'id_municipio');
	}
}
