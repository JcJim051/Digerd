<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Post
 * 
 * @property int $id
 * @property int $author_id
 * @property int|null $category_id
 * @property character varying $title
 * @property character varying|null $seo_title
 * @property string|null $excerpt
 * @property string $body
 * @property character varying|null $image
 * @property character varying $slug
 * @property string|null $meta_description
 * @property string|null $meta_keywords
 * @property character varying $status
 * @property bool $featured
 * @property timestamp without time zone|null $created_at
 * @property timestamp without time zone|null $updated_at
 *
 * @package App\Models
 */
class Post extends Model
{
	protected $table = 'posts';
	public $timestamps = false;

	protected $casts = [
		'author_id' => 'int',
		'category_id' => 'int',
		'title' => 'character varying',
		'seo_title' => 'character varying',
		'image' => 'character varying',
		'slug' => 'character varying',
		'status' => 'character varying',
		'featured' => 'bool',
		'created_at' => 'timestamp without time zone',
		'updated_at' => 'timestamp without time zone'
	];

	protected $fillable = [
		'author_id',
		'category_id',
		'title',
		'seo_title',
		'excerpt',
		'body',
		'image',
		'slug',
		'meta_description',
		'meta_keywords',
		'status',
		'featured'
	];
}
