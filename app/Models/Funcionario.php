<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

/**
 * Class Funcionario
 *
 * @property int $id_funcionario
 * @property character varying|null $nombre
 * @property character varying|null $documento
 * @property int|null $edad
 * @property character|null $sexo
 * @property character varying|null $direccion
 * @property character varying|null $telefono
 * @property character varying|null $profesion
 * @property character varying|null $email
 * @property character varying|null $especializacion
 * @property character varying|null $vinculacion
 * @property character varying|null $contrato
 * @property Carbon|null $inicio_contrato
 * @property string|null $actividades
 * @property character varying|null $arl
 * @property character varying|null $eps
 * @property character varying|null $pensiones
 *
 * @property Collection|Emergencia[] $emergencias
 *
 * @package App\Models
 */
class Funcionario extends Model
{
	protected $table = 'funcionarios';
	protected $primaryKey = 'id_funcionario';
	public $timestamps = false;



	protected $dates = [
		'inicio_contrato'
	];

	protected $fillable = [
		'nombre',
		'documento',
		'edad',
		'sexo',
		'direccion',
		'telefono',
		'profesion',
		'email',
		'especializacion',
		'vinculacion',
		'contrato',
		'inicio_contrato',
		'actividades',
		'arl',
		'eps',
		'pensiones'
	];

	protected static function boot()
    {
            parent::boot();
			if (auth()->user()->hasRole('funcionario') ) {
				static::addGlobalScope('funcionario', function (Builder $builder) {
						$builder->where('id_funcionario', '=', auth()->user()->id_funcionario);
				});
		}
    }


	public function emergencias()
	{
		return $this->hasMany(Emergencia::class, 'id_funcionario');
	}
	public function obligaciones()
	{
		return $this->hasMany(Obligacion::class, 'id_funcionario');
	}
	public function actividades()
	{
		return $this->hasMany(Actividad::class, 'id_funcionario');
	}
}
