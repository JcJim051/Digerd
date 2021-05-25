<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class InventarioEntrada
 *
 * @property int $id_inventario_entrada
 * @property Carbon|null $fecha
 * @property int|null $id_tipo_ayuda
 * @property int|null $cantidad
 * @property int|null $id_entidad
 *
 * @property TiposAyuda|null $tipos_ayuda
 * @property Entidade|null $entidade
 * @property Collection|InventarioSalida[] $inventario_salidas
 *
 * @package App\Models
 */
class InventarioEntrada extends Model
{
	protected $table = 'inventario_entrada';
	protected $primaryKey = 'id_inventario_entrada';
	public $timestamps = false;


	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'fecha',
		'id_tipo_ayuda',
		'cantidad',
		'id_entidad'
	];

	public function tipos_ayuda()
	{
		return $this->belongsTo(TiposAyuda::class, 'id_tipo_ayuda');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidad::class, 'id_entidad');
	}

	public function inventario_salidas()
	{
		return $this->hasMany(InventarioSalida::class, 'id_inventario_entrada');
	}
}
