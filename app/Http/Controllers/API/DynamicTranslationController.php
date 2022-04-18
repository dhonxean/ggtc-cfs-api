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

}
