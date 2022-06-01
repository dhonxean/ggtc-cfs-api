<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\{
	Language,
	Country,
	DynamicTranslation,
	StaticTranslation
};

class DynamicTranslationController extends Controller
{
	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/
	public function create (Request $r) {
		$validator = \Validator::make($r->all(), [
			'country_id'			=> 'required',
			'language_id'			=> Rule::unique('dynamic_translations')->where(function ($query) use ($r) {
										return $query->where([
											'country_id' 	=> $r->country_id,
											'language_id'	=> $r->language_id
										]);	
									}),
			'csr_policy'			=> 'sometimes',
			'csr_local_examples'	=> 'sometimes',
			'csr_acknowledgement'	=> 'sometimes',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$country = Country::where('id', $r->country_id)->first();
		if (!$country) {
			return response([
				'errors' => ['Country not found']
			]);
		}

		$translations = DynamicTranslation::where([
							'country_id' => $r->country_id,
							'language_id' => $r->language_id,
						])->first();
		
		if(!$translations) {
			$translation = DynamicTranslation::create([
				'country_id' 			=> $r->country_id,
				'language_id' 			=> $r->language_id,
				'csr_policy' 			=> $r->csr_policy,
				'csr_local_examples' 	=> $r->csr_local_examples,
				'csr_acknowledgement' 	=> $r->csr_acknowledgement,
			]);

			// checking if the selected language has a static translation if not insert static translation and the content fields must be the english version
			$default_translation = StaticTranslation::where('is_default', 1)->first();
			if ($default_translation) {
				$check_language_translation = StaticTranslation::where('language_id', $r->language_id)->first();
				if (!$check_language_translation) {
					StaticTranslation::create([
						'language_id' => $r->language_id,
						'content_fields' => $default_translation->content_fields,
					]);
				}
			}

			$translation->load('language');

			return response([
				'res' => $translation
			]);
		}	
		else {
			return response([
				'errors' => ['Language translation already exists.']
			]);
		}
	}

	public function info ($id) {
		$dynamic_translation = DynamicTranslation::where('id', $id)->with('language')->first();

		if ($dynamic_translation) {
			return response([
				'res' => $dynamic_translation
			]);
		}
		else {
			return response([
				'errors' => ['Language not found!']
			], 400);
		}
	}

	public function update ($id, Request $r ) {
		$validator = \Validator::make($r->all(), [
			'country_id'			=> 'required',
			'language_id'			=> Rule::unique('dynamic_translations', 'language_id')->ignore($id)->where(function ($query) use ($r, $id) {
										return $query->where([
											'country_id' 	=> $r->country_id,
											'language_id'	=> $r->language_id
										]);	
									}),
			'csr_policy'			=> 'sometimes',
			'csr_local_examples'	=> 'sometimes',
			'csr_acknowledgement'	=> 'sometimes',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$translation = DynamicTranslation::where('id', $id)->first();

		if ($translation) {
			$translation->update([
				'country_id' 			=> $r->country_id,
				'language_id' 			=> $r->language_id,
				'csr_policy' 			=> $r->csr_policy,
				'csr_local_examples' 	=> $r->csr_local_examples,
				'csr_acknowledgement' 	=> $r->csr_acknowledgement,
			]);

			$translation->load('language');

			// checking if the selected language has a static translation if not insert static translation and the content fields must be the english version
			$default_translation = StaticTranslation::where('is_default', 1)->first();
			if ($default_translation) {
				$check_language_translation = StaticTranslation::where('language_id', $r->language_id)->first();
				if (!$check_language_translation) {
					StaticTranslation::create([
						'language_id' => $r->language_id,
						'content_fields' => $default_translation->content_fields,
					]);
				}
			}

			return response([
				'res' => $translation
			]);
		}
		else {
			return response([
				'errors' => ['Dynamic translation not found!']
			], 400);
		}
	}

	public function delete($id, Request $r) {
		$translation = DynamicTranslation::where('id', $id)->first();

		if ($translation) {
			$translation->delete();

			return response([
				'res' => ['Dynamic translation deleted.']
			]);
		}
		else {
			return response([
				'errors' => ['Dynamic translation not found!']
			], 400);
		}
	}

	public function getCountryDynamicTranslation(Request $r) {
		$dynamic_translation = DynamicTranslation::select('dynamic_translations.id', 'dynamic_translations.country_id', 'dynamic_translations.language_id', 'lang.name as language_name', 'dynamic_translations.created_at')
				->when(isset($r->keyword), function ($query) use ($r) {
					$query->whereHas('language', function ($q) use ($r) {
						$q->where('lang.name', 'LIKE', '%'.strtolower($r->keyword).'%');
					});
				})
				->join('languages as lang', 'lang.id', '=', 'dynamic_translations.language_id')
				->with('country')
				->when(isset($r->country_id), function ($query) use ($r) {
					$query->where('country_id', $r->country_id);
				})
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
							$query->orderByDesc('dynamic_translations.'.$r->sort_by);
						}
						else {
							$query->orderBy('dynamic_translations.'.$r->sort_by);
						}
					}
				})
				->when( $r->filled('all') , function ($q, $r) {
					return $q->get();
				}, function ($q) {
					return $q->paginate(20);
				});

		return response([
			'res' => $dynamic_translation
		]);
	}
}
