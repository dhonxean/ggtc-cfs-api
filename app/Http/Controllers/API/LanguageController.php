<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\{
	Language,
};

class LanguageController extends Controller
{
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
			'name' 	=> 'required',
			'code'	=> 'required|unique:languages',
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

		return response([
			'res' => $language
		]);
	}

	public function info($id) {
		$language = Language::where('id', $id)->first();

		if ($language) {
			return response([
				'res' => $language
			]);
		}
		else {
			return response([
				'errors' => ['Language not found.']
			]);
		}
	}
	
	public function update($id, Request $r) {
		$validator = \Validator::make($r->all(), [
			'name' 	=> 'required',
			'code'	=> [
				'required',
				Rule::unique('languages')->ignore($id)
			],
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

			return response([
				'res' => $language
			]);
		}
		else{
			return response([
				'errors' => ['Language not found.']
			]);
		}
	}

	public function delete($id, Request $r) {
		$language = Language::where('id', $id)->first();

		if ($language) {
			$language->delete();

			return response([
				'res' => ['language deleted.']
			]);
		}
		else {
			return response([
				'errors' => ['Language not found.']
			]);
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
