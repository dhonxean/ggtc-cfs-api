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
}
