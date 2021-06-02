<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Exports extends Model
{
    use HasFactory;
    protected $table = 'exports';
	protected $primaryKey = 'id_export';
    public $timestamps = false;
    
}
