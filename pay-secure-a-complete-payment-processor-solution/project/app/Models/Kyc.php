<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kyc extends Model
{
	use HasFactory;

	protected $guarded = ['id'];
	protected $casts = [
		'input_form' => 'object'
	];
}
