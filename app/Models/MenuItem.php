<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class MenuItem
 * 
 * @property int $id
 * @property int|null $menu_id
 * @property character varying $title
 * @property character varying $url
 * @property character varying $target
 * @property character varying|null $icon_class
 * @property character varying|null $color
 * @property int|null $parent_id
 * @property int $order
 * @property timestamp without time zone|null $created_at
 * @property timestamp without time zone|null $updated_at
 * @property character varying|null $route
 * @property string|null $parameters
 * 
 * @property Menu|null $menu
 *
 * @package App\Models
 */
class MenuItem extends Model
{
	protected $table = 'menu_items';
	public $timestamps = false;

	protected $casts = [
		'menu_id' => 'int',
		'title' => 'character varying',
		'url' => 'character varying',
		'target' => 'character varying',
		'icon_class' => 'character varying',
		'color' => 'character varying',
		'parent_id' => 'int',
		'order' => 'int',
		'created_at' => 'timestamp without time zone',
		'updated_at' => 'timestamp without time zone',
		'route' => 'character varying'
	];

	protected $fillable = [
		'menu_id',
		'title',
		'url',
		'target',
		'icon_class',
		'color',
		'parent_id',
		'order',
		'route',
		'parameters'
	];

	public function menu()
	{
		return $this->belongsTo(Menu::class);
	}
}
