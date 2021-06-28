<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

/**
 * Class TiposAyuda
 *
 * @property int $id_tipo_ayuda
 * @property character varying|null $descripcion
 *
 * @property Collection|InventarioEntrada[] $inventario_entradas
 *
 * @package App\Models
 */
class TiposAyuda extends Model
{
	protected $table = 'tipos_ayuda';
	protected $primaryKey = 'id_tipo_ayuda';
	public $timestamps = false;


	protected $fillable = [
		'descripcion'
	];

	public function inventario_entradas()
	{
		return $this->hasMany(InventarioEntrada::class, 'id_tipo_ayuda');
	}
	public function disponible()
	{
		$sql="select coalesce(sum(cantidad),0) as total from inventario_entrada where id_tipo_ayuda={$this->id_tipo_ayuda}";
		$sql2="select coalesce(sum(cantidad),0) as total  from detalle_inventario where id_tipo_ayuda ={$this->id_tipo_ayuda}";
		$result1=DB::Select($sql)[0];
		$result2=DB::Select($sql2)[0];
		
		return $result1->total-$result2->total;
    
	}
}
