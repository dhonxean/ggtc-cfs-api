<?php

namespace App\Http\Controllers\API;

use App\Traits\MainTraits;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Storage;
use App\Imports\{
	CountryImport
};
use App\Models\{ 
	Country,
	CountryDetail,
	CostEstimation,
	CountryCompany,
	CountryReference,
	CountryMetadata,
};

class ImportController extends Controller
{
	use MainTraits;

	public function importCountry(Request $r) {
		$validator = \Validator::make($r->all(), [
			'file'  => 'required'
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$countryImport = new countryImport;
		Excel::import($countryImport, $r->file);

		return $countryImport->results;
	}
}
