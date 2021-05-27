<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Actividad;
use App\Models\Funcionario;
class Obligacion extends Model
{
    use HasFactory;
    protected $table = 'obligaciones';
	protected $primaryKey = 'id_obligacion';
	public $timestamps = false;


	protected $fillable = [
		'descripcion'
	];

    public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'id_funcionario');
	}
	public function actividades()
	{
		return $this->hasMany(Actividad::class, 'id_obligacion');
    }
    protected static function boot()
    {
            parent::boot();
			if (auth()->user()->hasRole('funcionario') ) {
				static::addGlobalScope('funcionario', function (Builder $builder) {
						$builder->where('id_funcionario', '=', auth()->user()->id_funcionario);
				});
		}
    }
}
