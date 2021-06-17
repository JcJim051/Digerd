<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Mail;
class Actividad extends Model
{
	protected $table = 'actividades';
	protected $primaryKey = 'id_actividad';
	public $timestamps = false;

	
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
	public function obligacion()
	{
		return $this->belongsTo(Obligacion::class, 'id_obligacion');
	}
	public function save(array $options = [])
	{
		
	parent::save();
	$data = array('name'=>"Juan Fajardo");
		Mail::send('email', $data, function($message) use ($data) {
		$message->to('juanfbarrero@gmail.com', 'Juan Fajardo')->subject('Actividades en SOSMeta');
		
		});
	}
	
}
