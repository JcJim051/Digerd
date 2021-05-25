<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
/**
 * Class Actividade
 *
 * @property int $id_actividad
 * @property Carbon|null $fecha_estimada
 * @property Carbon|null $fecha_entrega
 * @property string|null $descripcion
 * @property int|null $id_funcionario
 * @property string|null $desarrollo
 * @property string|null $anexos
 * @property int|null $cumplida
 *
 * @property Funcionario|null $funcionario
 *
 * @package App\Models
 */
class Actividad extends Model
{
	protected $table = 'actividades';
	protected $primaryKey = 'id_actividad';
	public $timestamps = false;

	protected $dates = [
		'fecha_estimada',
		'fecha_entrega'
	];

	protected $fillable = [
		'fecha_estimada',
		'fecha_entrega',
		'descripcion',
		'id_funcionario',
		'desarrollo',
		'anexos',
		'cumplida'
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
	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'id_funcionario');
	}
}
