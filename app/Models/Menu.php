<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Menu
 * 
 * @property int $id
 * @property character varying $name
 * @property timestamp without time zone|null $created_at
 * @property timestamp without time zone|null $updated_at
 * 
 * @property Collection|MenuItem[] $menu_items
 *
 * @package App\Models
 */
class Menu extends Model
{
	protected $table = 'menus';
	public $timestamps = false;

	protected $casts = [
		'name' => 'character varying',
		'created_at' => 'timestamp without time zone',
		'updated_at' => 'timestamp without time zone'
	];

	protected $fillable = [
		'name'
	];

	public function menu_items()
	{
		return $this->hasMany(MenuItem::class);
	}
}
