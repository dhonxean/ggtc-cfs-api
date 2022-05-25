<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Traits\MainTraits;
use App\Models\{
	Language,
	Image,
};

class LanguageController extends Controller
{
	use MainTraits;
	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/
	public function importLanguage(Request $r) {
		foreach($r->request as $key => $value) {
			$language = Language::where('name', $value['name'])->first();
			if (!$language) {
				Language::create([
					'name' 	=> $value['name'],
					'code'	=> $value['code']
				]);
			}
		}
	}

	public function create(Request $r) {
		$validator = \Validator::make($r->all(), [
			'name' 		=> 'required',
			'code'		=> 'required|unique:languages',
			'images.*'  => 'sometimes|mimes:jpeg,png,jpg|max:5000' //in kilobytes = 5mb max
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$language = Language::create([
			'name'	=> $r->name,
			'code'	=> $r->code,
		]);

		/**
		 * add image uploads  */
		if( $r->hasFile('flag') ){
			$this->addImages('language', $r, $language, 'flag');
		}

		$language->load('images');

		return response([
			'res' => $language
		]);
	}

	public function info($id) {
		$language = Language::where('id', $id)->with('images')->first();

		if ($language) {
			return response([
				'res' => $language
			]);
		}
		else {
			return response([
				'errors' => ['Language not found.']
			], 400);
		}
	}
	
	public function update($id, Request $r) {
		$validator = \Validator::make($r->all(), [
			'name' 	=> 'required',
			'code'	=> [
				'required',
				Rule::unique('languages')->ignore($id)
			],
			'images.*'  => 'sometimes|mimes:jpeg,png,jpg|max:5000' //in kilobytes = 5mb max
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$language = Language::where('id', $id)->first();

		if ($language) {
			$language->update([
				'name'	=> $r->name,
				'code'	=> $r->code,
			]);
			
			/**
			 * add image uploads  */
			$this->updateImages('language', $r, $language, 'flag');

			$language->load('images');
			
			return response([
				'res' => $language
			]);
		}
		else{
			return response([
				'errors' => ['Language not found.']
			], 400);
		}
	}

	public function delete($id, Request $r) {
		$language = Language::where('id', $id)->first();

		if ($language) {
			if ($language->sequence != 1) {
				$language->delete();
				return response([
					'res' => ['language deleted.']
				]);
			}
			else {
				return response([
					'errors' => ['Language cannot be deleted.']
				], 400);
			}
		}
		else {
			return response([
				'errors' => ['Language not found.']
			], 400);
		}
	}

	public function getAllLanguage(Request $r) {
		$language = Language::when(isset($r->keyword), function ($query) use ($r) {
					$query->where('name', 'LIKE', '%'.strtolower($r->keyword).'%')
					->orWhere('code', 'LIKE', '%' . strtolower($r->keyword) . '%');
				})
				->when(isset($r->sort_by), function ($query) use ($r) {
					if ($r->order_type == 'desc') {
						$query->orderByDesc($r->sort_by);
					}
					else {
						$query->orderBy($r->sort_by);
					}
				})
				->when(isset($r->first_load), function ($query) use ($r) {
					$query->orderBy('sequence');
					$query->orderBy('name');
				})
				->when( $r->filled('all') , function ($q, $r) {
					return $q->get();
				}, function ($q) {
					return $q->paginate(20);
				});


		return response([
			'res' => $language
		]);
	}
}
