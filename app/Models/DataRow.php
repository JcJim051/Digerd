<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class DataRow
 * 
 * @property int $id
 * @property int $data_type_id
 * @property character varying $field
 * @property character varying $type
 * @property character varying $display_name
 * @property bool $required
 * @property bool $browse
 * @property bool $read
 * @property bool $edit
 * @property bool $add
 * @property bool $delete
 * @property string|null $details
 * @property int $order
 * 
 * @property DataType $data_type
 *
 * @package App\Models
 */
class DataRow extends Model
{
	protected $table = 'data_rows';
	public $timestamps = false;

	protected $casts = [
		'data_type_id' => 'int',
		'field' => 'character varying',
		'type' => 'character varying',
		'display_name' => 'character varying',
		'required' => 'bool',
		'browse' => 'bool',
		'read' => 'bool',
		'edit' => 'bool',
		'add' => 'bool',
		'delete' => 'bool',
		'order' => 'int'
	];

	protected $fillable = [
		'data_type_id',
		'field',
		'type',
		'display_name',
		'required',
		'browse',
		'read',
		'edit',
		'add',
		'delete',
		'details',
		'order'
	];

	public function data_type()
	{
		return $this->belongsTo(DataType::class);
	}
}
