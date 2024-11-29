<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Category
 * 
 * @property int $id
 * @property int|null $parent_id
 * @property int $order
 * @property character varying $name
 * @property character varying $slug
 * @property timestamp without time zone|null $created_at
 * @property timestamp without time zone|null $updated_at
 * 
 * @property Category|null $category
 * @property Collection|Category[] $categories
 *
 * @package App\Models
 */
class Category extends Model
{
	protected $table = 'categories';
	public $timestamps = false;

	protected $casts = [
		'parent_id' => 'int',
		'order' => 'int',
		'name' => 'character varying',
		'slug' => 'character varying',
		'created_at' => 'timestamp without time zone',
		'updated_at' => 'timestamp without time zone'
	];

	protected $fillable = [
		'parent_id',
		'order',
		'name',
		'slug'
	];

	public function category()
	{
		return $this->belongsTo(Category::class, 'parent_id');
	}

	public function categories()
	{
		return $this->hasMany(Category::class, 'parent_id');
	}
}
