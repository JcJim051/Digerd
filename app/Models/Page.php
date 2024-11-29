<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Page
 * 
 * @property int $id
 * @property int $author_id
 * @property character varying $title
 * @property string|null $excerpt
 * @property string|null $body
 * @property character varying|null $image
 * @property character varying $slug
 * @property string|null $meta_description
 * @property string|null $meta_keywords
 * @property character varying $status
 * @property timestamp without time zone|null $created_at
 * @property timestamp without time zone|null $updated_at
 *
 * @package App\Models
 */
class Page extends Model
{
	protected $table = 'pages';
	public $timestamps = false;

	protected $casts = [
		'author_id' => 'int',
		'title' => 'character varying',
		'image' => 'character varying',
		'slug' => 'character varying',
		'status' => 'character varying',
		'created_at' => 'timestamp without time zone',
		'updated_at' => 'timestamp without time zone'
	];

	protected $fillable = [
		'author_id',
		'title',
		'excerpt',
		'body',
		'image',
		'slug',
		'meta_description',
		'meta_keywords',
		'status'
	];
}
