<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class DataType
 * 
 * @property int $id
 * @property character varying $name
 * @property character varying $slug
 * @property character varying $display_name_singular
 * @property character varying $display_name_plural
 * @property character varying|null $icon
 * @property character varying|null $model_name
 * @property character varying|null $description
 * @property bool $generate_permissions
 * @property timestamp without time zone|null $created_at
 * @property timestamp without time zone|null $updated_at
 * @property int $server_side
 * @property character varying|null $controller
 * @property character varying|null $policy_name
 * @property string|null $details
 * 
 * @property Collection|DataRow[] $data_rows
 *
 * @package App\Models
 */
class DataType extends Model
{
	protected $table = 'data_types';
	public $timestamps = false;

	protected $casts = [
		'name' => 'character varying',
		'slug' => 'character varying',
		'display_name_singular' => 'character varying',
		'display_name_plural' => 'character varying',
		'icon' => 'character varying',
		'model_name' => 'character varying',
		'description' => 'character varying',
		'generate_permissions' => 'bool',
		'created_at' => 'timestamp without time zone',
		'updated_at' => 'timestamp without time zone',
		'server_side' => 'int',
		'controller' => 'character varying',
		'policy_name' => 'character varying'
	];

	protected $fillable = [
		'name',
		'slug',
		'display_name_singular',
		'display_name_plural',
		'icon',
		'model_name',
		'description',
		'generate_permissions',
		'server_side',
		'controller',
		'policy_name',
		'details'
	];

	public function data_rows()
	{
		return $this->hasMany(DataRow::class);
	}
}
