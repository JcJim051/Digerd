<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pqrsd extends Model
{
    use HasFactory;
    protected $table = 'pqrsd';
	protected $primaryKey = 'id_pqrsd';
	public $timestamps = false;
}
