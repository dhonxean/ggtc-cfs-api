<?php

namespace App\Http\Controllers\API;

use App\Traits\MainTraits;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Storage;
use App\Imports\{
	CountryImport,
	CountryReferenceImport,
	CompanyImport,
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
			'file'  => 'required',
			'type'  => 'required',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		switch ($r->type) {
			case 'country':
				$countryImport = new countryImport;
				Excel::import($countryImport, $r->file);
				return $countryImport->results;
				break;
			case 'reference':
				$countryReference = new CountryReferenceImport;
				Excel::import($countryReference, $r->file);
				return $countryReference->results;
				break;
			case 'company':
				$company = new CompanyImport;
				Excel::import($company, $r->file);
				return $company->results;
				break;
			default:
				return response([
					'errors' => ['Unknown import template!']
				]);
				break;
		}
	}
}
