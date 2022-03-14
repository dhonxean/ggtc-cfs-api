<?php

namespace App\Http\Controllers\API;

use App\Traits\MainTraits;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\Logo;

class LogoController extends Controller
{
	use MainTraits;

	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/
	public function create(Request $r) {
		$validator = \Validator::make($r->all(), [
			'content'           => 'required',
			'logos.*'  => 'required|mimes:jpeg,png,jpg|max:5000', //in kilobytes = 5mb max
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$logo = Logo::create([
			'content' => $r->content
		]);

		if ($r->hasFile('logos')) {
			$this->addImages('logo', $r, $logo, 'logos');
		}

		return response([
			'res' => $logo
		]);
	}

	public function info($id) {
		return $id;
	}

}
