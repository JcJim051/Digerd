<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Translation
 * 
 * @property int $id
 * @property character varying $table_name
 * @property character varying $column_name
 * @property int $foreign_key
 * @property character varying $locale
 * @property string $value
 * @property timestamp without time zone|null $created_at
 * @property timestamp without time zone|null $updated_at
 *
 * @package App\Models
 */
class Translation extends Model
{
	protected $table = 'translations';
	public $timestamps = false;

	protected $casts = [
		'table_name' => 'character varying',
		'column_name' => 'character varying',
		'foreign_key' => 'int',
		'locale' => 'character varying',
		'created_at' => 'timestamp without time zone',
		'updated_at' => 'timestamp without time zone'
	];

	protected $fillable = [
		'table_name',
		'column_name',
		'foreign_key',
		'locale',
		'value'
	];
}
