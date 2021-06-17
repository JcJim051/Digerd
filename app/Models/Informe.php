<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Informe extends Model
{
    use HasFactory;
    protected $table = 'informes';
	protected $primaryKey = 'id_informe';
	public $timestamps = false;

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'id_funcionario');
	}
}
