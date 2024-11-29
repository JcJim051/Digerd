<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Role
 *
 * @property int $id
 * @property character varying $name
 * @property character varying $display_name
 * @property timestamp without time zone|null $created_at
 * @property timestamp without time zone|null $updated_at
 *
 * @property Collection|User[] $users
 * @property Collection|Permission[] $permissions
 *
 * @package App\Models
 */
class Role extends Model
{
	protected $table = 'roles';
	public $timestamps = false;


	protected $fillable = [
		'name',
		'display_name'
	];

	public function users()
	{
		return $this->belongsToMany(User::class, 'user_roles');
	}

	public function permissions()
	{
		return $this->belongsToMany(Permission::class);
	}
}
