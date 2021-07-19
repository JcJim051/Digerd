<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Emergencia
 *
 * @property int $id_emergencia
 * @property character varying|null $descripcion
 * @property character varying|null $localizacion
 * @property timestamp without time zone|null $fecha
 * @property character varying|null $estado
 * @property int|null $tipo_emergencia
 * @property int|null $id_municipio
 * @property character varying|null $comuna
 * @property character varying|null $fuente_agua
 * @property int|null $movil
 * @property int|null $id_entidad
 * @property int|null $id_funcionario
 *
 * @property TiposEmergencium|null $tipos_emergencium
 * @property Municipio|null $municipio
 * @property Entidade|null $entidade
 * @property Funcionario|null $funcionario
 * @property Collection|Medio[] $medios
 * @property Inversione $inversione
 * @property EmergenciasActa $emergencias_acta
 * @property Collection|PersonasAfectada[] $personas_afectadas
 * @property Collection|InventarioSalida[] $inventario_salidas
 * @property Collection|AccionesAdelantada[] $acciones_adelantadas
 * @property Collection|Visita[] $visitas
 *
 * @package App\Models
 */
class Emergencia extends Model
{
	protected $table = 'emergencias';
	protected $primaryKey = 'id_emergencia';
	public $timestamps = false;



	protected $fillable = [
		'descripcion',
		'localizacion',
		'fecha',
		'estado',
		'tipo_emergencia',
		'id_municipio',
		'comuna',
		'fuente_agua',
		'movil',
		'id_entidad',
		'id_funcionario'
	];

	public function tipos_emergencia()
	{
		return $this->belongsTo(TiposEmergencia::class, 'tipo_emergencia');
	}

	public function municipio()
	{
		return $this->belongsTo(Municipio::class, 'id_municipio');
	}

	public function entidad()
	{
		return $this->belongsTo(Entidad::class, 'id_entidad');
	}

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'id_funcionario');
	}

	public function medios()
	{
		return $this->hasMany(Medio::class, 'id_emergencia');
	}

	public function inversion()
	{
		return $this->hasMany(Inversion::class, 'id_inversion','id_inversion');
	}

	public function emergencias_acta()
	{
		return $this->hasOne(EmergenciasActa::class, 'id_emergencia');
	}

	public function personas_afectadas()
	{
		return $this->hasMany(PersonasAfectada::class, 'id_emergencia');
	}

	public function inventario_salidas()
	{
		return $this->hasMany(InventarioSalida::class, 'id_emergencia');
	}

	public function acciones_adelantadas()
	{
		return $this->hasMany(AccionesAdelantada::class, 'id_emergencia');
	}

	public function visitas()
	{
		return $this->belongsToMany(Visita::class, 'visita_emergencia', 'id_emergencia', 'id_visita')
					->withPivot('id_visita_emergencia');
	}
}
