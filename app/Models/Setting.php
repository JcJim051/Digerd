<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Setting
 * 
 * @property int $id
 * @property character varying $key
 * @property character varying $display_name
 * @property string|null $value
 * @property string|null $details
 * @property character varying $type
 * @property int $order
 * @property character varying|null $group
 *
 * @package App\Models
 */
class Setting extends Model
{
	protected $table = 'settings';
	public $timestamps = false;

	protected $casts = [
		'key' => 'character varying',
		'display_name' => 'character varying',
		'type' => 'character varying',
		'order' => 'int',
		'group' => 'character varying'
	];

	protected $fillable = [
		'key',
		'display_name',
		'value',
		'details',
		'type',
		'order',
		'group'
	];
}
