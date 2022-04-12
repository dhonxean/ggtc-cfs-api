<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\{
	WorldCountry,
	Language,
};

class WorldCountryController extends Controller
{
	//
	public function import(Request $r) {
		foreach ($r->request as $key => $value) {
			$country = WorldCountry::where('country_code', $value['code'])->first();
			if (!$country) {
				$language = Language::where('code', $value['language']['code'])->first();
				if (!$language) {
					$language_id = Language::create([
						'name' 	=> $value['language']['name'],
						'code'	=> $value['language']['code']
					]);
					
					$language = Language::where('code', $value['language']['code'])->first();
				}
				WorldCountry::create([
					'name' => $value['name'],
					'country_code' => $value['code'],
					'language_id' => $language->id,
				]);
			}
		}
	}

	public function create(Request $r) {
		$validator = \Validator::make($r->all(), [
			'name' 	=> 'required',
			'country_code'	=> 'required|unique:world_countries',
			'language_id'	=> 'required',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$world_country = WorldCountry::create([
			'name'			=> $r->name,
			'country_code'	=> $r->country_code,
			'language_id'	=> $r->language_id,
		]);

		$world_country->load('language');

		return response([
			'res' => $world_country
		]);
	}

	public function info($id) {
		$world_country = WorldCountry::where('id', $id)
						->with('language')
						->first();

		if ($world_country) {
			return response([
				'res' => $world_country
			]);
		}
		else {
			return response([
				'errors' => ['Country not found.']
			], 400);
		}
	}

	public function update ($id, Request $r) {
		$validator = \Validator::make($r->all(), [
			'name' 	=> 'required',
			'country_code'	=> [
				'required',
				Rule::unique('world_countries')->ignore($id)
			],
			'language_id' 	=> 'required',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$world_country = WorldCountry::where('id', $id)
						->with('language')
						->first();

		if ($world_country) {
			$world_country->update([
				'name'			=> $r->name,
				'country_code'	=> $r->country_code,
				'language_id'	=> $r->language_id,
			]);

			$world_country->load('language');

			return response([
				'res' => $world_country
			]);
		}
		else {
			return response([
				'errors' => ['Country not found.']
			], 400);
		}

	}

	public function delete ($id, Request $r) {
		$world_country = WorldCountry::where('id', $id)->first();

		if ($world_country) {
			$world_country->delete();

			return response([
				'res' => ['Country deleted.']
			]);
		}
		else {
			return response([
				'errors' => ['Country not found.']
			], 400);
		}
	}

	public function getAllCountry (Request $r) {
		$world_country = WorldCountry::select('world_countries.id', 'world_countries.name as name', 'world_countries.country_code', 'world_countries.language_id', 'lang.name as language_name')
				->when(isset($r->keyword), function ($query) use ($r) {
					$query->whereHas('language', function ($q) use ($r) {
						$q->where('lang.name', 'LIKE', '%'.strtolower($r->keyword).'%');
					})
					->orWhere('world_countries.name', 'LIKE', '%'.strtolower($r->keyword).'%')
					->orWhere('world_countries.country_code', 'LIKE', '%' . strtolower($r->keyword) . '%');
				})
				->join('languages as lang', 'lang.id', '=', 'world_countries.language_id')
				->when(isset($r->sort_by), function ($query) use ($r) {
					if ($r->sort_by == 'language_id') {
						if ($r->order_type == 'desc') {
							$query->orderByDesc('lang.name');
						}
						else {
							$query->orderBy('lang.name');
						}
					}
					else {
						if ($r->order_type == 'desc') {
							$query->orderByDesc('world_countries.'.$r->sort_by);
						}
						else {
							$query->orderBy('world_countries.'.$r->sort_by);
						}
					}
				})
				->when( $r->filled('all') , function ($q, $r) {
					return $q->get();
				}, function ($q) {
					return $q->paginate(20);
				});


		return response([
			'res' => $world_country
		]);
	}
}
