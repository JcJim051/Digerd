<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Calamidad extends Model
{
    use HasFactory;
    protected $table = 'calamidad';
	protected $primaryKey = 'id_calamidad';
	public $incrementing = false;
	public $timestamps = false;
	protected static function boot()
    {
            parent::boot();
			if (auth()->user()->hasRole('municipio') ) {
				static::addGlobalScope('municipio', function (Builder $builder) {
						$builder->where('id_municipio', '=', auth()->user()->id_municipio);
				});
		}
    }

}
