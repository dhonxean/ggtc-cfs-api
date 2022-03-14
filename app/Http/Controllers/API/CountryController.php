<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

use App\Models\Country;

class CountryController extends Controller
{
	
	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/
	public function massImport(Request $r) {
		foreach ($r->request as $key => $value) {
			$country = Country::where('iso2', $value['iso2'])->first();
			if (!$country) {
				Country::create([
					'name' => $value['name'],
					'iso2' => $value['iso2'],
					'iso3' => $value['iso3'],
					'flag' => $value['emoji'],
					'currency' => $value['currency'],
					'region' => $value['region'],
				]);
			}
		}
	}

	public function create(Request $r) {
		return 'yel';
	}

}
