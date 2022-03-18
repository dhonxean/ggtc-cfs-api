<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\{
	Country,
	CountryDetail,
	CostEstimation,
	MarineWaste,
	UrbanWaste,
	CountryCompany,
	CountryThreatEnvironment,
	CountryRecommendation,
	CountryReference,
	CountryMetadata,
};

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
					'publish' => 0,
				]);
			}
		}
	}

	public function create(Request $r) {
		$validator = \Validator::make($r->all(), [
			'name' 			  			=> 'required',
			'country_code'    			=> 'required|unique:countries,iso2',
			'country_code_2'  			=> 'sometimes',
			'flag'  		  			=> 'required',
			'currency'  	  			=> 'required',
			'region'  	      			=> 'sometimes',
			'publish'  	  				=> 'required',
			// country details
			'economic_losses' 			=> 'required',
			'cigarettes_consumed' 		=> 'required',
			'gti_facts' 				=> 'required',
			'policy' 					=> 'required',
			'acknowledgement' 			=> 'required',
			// cost estimations
			'low_estimate' 				=> 'required',
			'average_estimate' 	    	=> 'required',
			'high_estimate' 	    	=> 'required',
			'consumption' 	    		=> 'required',
			// marine waste
			'marine_cost_1' 	    	=> 'required',
			'marine_cost_year_1' 		=> 'required',
			'marine_cost_2' 	    	=> 'required',
			'marine_cost_year_2' 		=> 'required',
			'marine_cost_total' 		=> 'required',
			// urban waste
			'urban_cost_1' 	    		=> 'required',
			'urban_cost_year_1' 		=> 'required',
			'urban_cost_2' 	    		=> 'required',
			'urban_cost_year_2' 		=> 'required',
			'urban_cost_total' 			=> 'required',
			// references
			'reference'					=> 'required|array',
			'reference_sequence'		=> 'required|array',
			// companies
			'company' 					=> 'required|array',
			'company_sequence' 			=> 'required|array',
			// metadata
			'meta_title'				=> 'sometimes',
			'meta_description'			=> 'sometimes',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$countryId = Country::create([
			'name' 		=> $r->name,
			'iso2'		=> $r->country_code,
			'iso3'		=> isset($r->country_code_2) ? $r->country_code_2 : NULL,
			'flag'		=> $r->flag,
			'currency'	=> $r->currency,
			'region'	=> isset($r->region) ? $r->region : NULL,
			'publish'	=> $r->publish,
		]);
		
		$country = Country::find($r->country_code);

		CountryMetadata::create([
			'country_id'		=> $country->id,
			'meta_title'		=> isset($r->meta_title) ? $r->meta_title : $r->name,
			'meta_description'		=> isset($r->meta_description) ? $r->meta_description : $r->threat_to_environment,
		]);

		CountryDetail::create([
			'country_id' 			=> $country->id,
			'economic_losses'		=> $r->economic_losses,
			'cigarettes_consumed'	=> $r->cigarettes_consumed,
			'policy'				=> $r->policy,
			'gti_facts'				=> $r->gti_facts,
			'acknowledgement'		=> $r->acknowledgement,
		]);

		CostEstimation::create([
			'country_id'	=> $country->id,
			'low'			=> $r->low_estimate,
			'average'		=> $r->average_estimate,
			'high'			=> $r->high_estimate,
			'consumption'	=> $r->consumption,
		]);

		MarineWaste::create([
			'country_id'			=> $country->id,
			'cost_1'				=> $r->marine_cost_1,
			'cost_year_1'			=> $r->marine_cost_year_1,
			'cost_2'				=> $r->marine_cost_2,
			'cost_year_2'			=> $r->marine_cost_year_2,
			'cost_of_collection'	=> $r->marine_cost_total,
		]);

		UrbanWaste::create([
			'country_id'			=> $country->id,
			'cost_1'				=> $r->urban_cost_1,
			'cost_year_1'			=> $r->urban_cost_year_1,
			'cost_2'				=> $r->urban_cost_2,
			'cost_year_2'			=> $r->urban_cost_year_2,
			'cost_of_collection'	=> $r->urban_cost_total,
		]);

		if (!empty($r->reference)) {
			$country->references()->delete();
			foreach ($r->reference as $key => $item) {
				CountryReference::create([
					'country_id' 	=> $country->id,
					'content'	=> $item,
					'sequence'		=> isset($r->reference_sequence[$key]) ? $r->reference_sequence[$key] : 0,
				]);
			}
		}

		if (!empty($r->company)) {
			$country->companies()->delete();
			foreach ($r->company as $key => $item) {
				CountryCompany::create([
					'country_id' 	=> $country->id,
					'company_id'	=> $item,
					'sequence'		=> isset($r->company_sequence[$key]) ? $r->company_sequence[$key] : 0,
				]);
			}
		}

		$country->load('country_detail', 'cost_estimation', 'marine_waste','urban_waste', 'references', 'companies', 'meta_data');
		
		return response([
			'res' => $country
		]);
	}

	public function info($id) {
		$country = Country::where('id', $id)
				->with([
					'country_detail', 
					'cost_estimation', 
					'marine_waste', 
					'urban_waste', 
					// 'threats', 
					// 'recommendations', 
					'references', 
					'companies', 
					'meta_data'
				])
				->first();

		if ($country) {
			return response([
				'res' => $country
			]);
		}
		else {
			return response([
				'errors' => ['Country not found.']
			]);
		}
	}

	public function update($id, Request $r) {
		$validator = \Validator::make($r->all(), [
			'name' 			  			=> 'required',
			'country_code'    			=> [
											'required',
											Rule::unique('countries', 'iso2')->ignore($id)
										],
			'country_code_2'  			=> 'sometimes',
			'flag'  		  			=> 'required',
			'currency'  	  			=> 'required',
			'region'  	      			=> 'sometimes',
			'publish'  	  				=> 'required',
			// country details
			'economic_losses' 			=> 'required',
			'cigarettes_consumed' 		=> 'required',
			'policy' 					=> 'required',
			'gti_facts' 				=> 'required',
			'acknowledgement' 			=> 'required',
			// cost estimations
			'low_estimate' 				=> 'required',
			'average_estimate' 	    	=> 'required',
			'high_estimate' 	    	=> 'required',
			'consumption' 	    		=> 'required',
			// marine waste
			'marine_cost_1' 	    	=> 'required',
			'marine_cost_year_1' 		=> 'required',
			'marine_cost_2' 	    	=> 'required',
			'marine_cost_year_2' 		=> 'required',
			'marine_cost_total' 		=> 'required',
			// urban waste
			'urban_cost_1' 	    		=> 'required',
			'urban_cost_year_1' 		=> 'required',
			'urban_cost_2' 	    		=> 'required',
			'urban_cost_year_2' 		=> 'required',
			'urban_cost_total' 			=> 'required',
			// references
			'reference'					=> 'required|array',
			'reference_sequence'		=> 'required|array',
			// companies
			'company' 					=> 'required|array',
			'company_sequence' 			=> 'required|array',
			// metadata
			'meta_title'				=> 'sometimes',
			'meta_description'			=> 'sometimes',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$country = Country::where('id', $id)->first();

		if ($country) {
			$country->update([
				'name' 		=> $r->name,
				'iso2'		=> $r->country_code,
				'iso3'		=> isset($r->country_code_2) ? $r->country_code_2 : NULL,
				'flag'		=> $r->flag,
				'currency'	=> $r->currency,
				'region'	=> isset($r->region) ? $r->region : NULL,
				'publish'	=> $r->publish,
			]);

			$country->meta_data->update([
				'meta_title'		=> isset($r->meta_title) ? $r->meta_title : $r->name,
				'meta_description'	=> isset($r->meta_description) ? $r->meta_description : $r->threat_to_environment,
			]);

			$country->country_detail->update([
				'economic_losses'		=> $r->economic_losses,
				'cigarettes_consumed'	=> $r->cigarettes_consumed,
				'policy'				=> $r->policy,
				'gti_facts'				=> $r->gti_facts,
				'acknowledgement'		=> $r->acknowledgement,
			]);

			$country->cost_estimation->update([
				'low'			=> $r->low_estimate,
				'average'		=> $r->average_estimate,
				'high'			=> $r->high_estimate,
				'consumption'	=> $r->consumption,
			]);

			$country->marine_waste->update([
				'cost_1'				=> $r->marine_cost_1,
				'cost_year_1'			=> $r->marine_cost_year_1,
				'cost_2'				=> $r->marine_cost_2,
				'cost_year_2'			=> $r->marine_cost_year_2,
				'cost_of_collection'	=> $r->marine_cost_total,
			]);

			$country->urban_waste->update([
				'cost_1'				=> $r->urban_cost_1,
				'cost_year_1'			=> $r->urban_cost_year_1,
				'cost_2'				=> $r->urban_cost_2,
				'cost_year_2'			=> $r->urban_cost_year_2,
				'cost_of_collection'	=> $r->urban_cost_total,
			]);
	
			if (!empty($r->reference)) {
				$country->references()->delete();
				foreach ($r->reference as $key => $item) {
					CountryReference::create([
						'country_id' 	=> $country->id,
						'content'	=> $item,
						'sequence'		=> isset($r->reference_sequence[$key]) ? $r->reference_sequence[$key] : 0,
					]);
				}
			}
	
			if (!empty($r->company)) {
				$country->companies()->delete();
				foreach ($r->company as $key => $item) {
					CountryCompany::create([
						'country_id' 	=> $country->id,
						'company_id'	=> $item,
						'sequence'		=> isset($r->company_sequence[$key]) ? $r->company_sequence[$key] : 0,
					]);
				}
			}

			$country->load('country_detail', 'cost_estimation', 'marine_waste','urban_waste', 'references', 'companies', 'meta_data');
		
			return response([
				'res' => $country
			]);
		}
		else {
			return response([
				'errors' => ['Country not found!']
			]);
		}
	}

	public function delete ($id, Request $r) {
		$country = Country::where('id', $id)->first();

		if ($country) {
			$country->delete();

			return response([
				'res' => ['Country deleted.']
			]);
		}
		else{
			return response([
				'errors' => ['Country not found!']
			]);
		}
	}

	public function getAllCountry(Request $r) {
		$country = Country::when(isset($r->keyword), function ($query) use ($r) {
					$query->where('name', 'LIKE', '%'.strtolower($r->keyword).'%');	
				})
				->when(isset($r->sort_by), function ($query) use ($r) {
					if ($r->order_type == 'desc') {
						$query->orderByDesc($r->sort_by);
					}
					else {
						$query->orderBy($r->sort_by);
					}
				})
				->paginate(20);


		return response([
			'res' => $country
		]);
	}
}
