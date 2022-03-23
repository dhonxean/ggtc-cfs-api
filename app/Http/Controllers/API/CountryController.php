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
	CountryCompany,
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
			'death' 					=> 'required',
			'csr_local_examples' 		=> 'required',
			'csr_policy' 				=> 'required',
			'acknowledgement' 			=> 'required',
			// cost estimations
			'marine_pollution' 			=> 'required',
			'waste_management' 			=> 'required',
			'partial_cost' 				=> 'required',
			'marine_cost_per_ton' 		=> 'required',
			'waste_cost_per_ton' 		=> 'required',
			'cigarettes_consumed' 		=> 'required',
			'economic_cost' 			=> 'required',
			'economic_cost_currency' 	=> 'required',
			// references
			'reference'					=> 'sometimes|array',
			'reference_sequence'		=> 'sometimes|array',
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
			'region'	=> isset($r->region) ? ($r->region != null && $r->region != '' ? $r->region : '') : '',
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
			'death'					=> $r->death,
			'csr_local_examples'	=> $r->csr_local_examples,
			'csr_policy'			=> $r->csr_policy,
			'acknowledgement'		=> $r->acknowledgement,
		]);

		CostEstimation::create([
			'country_id'				=> $country->id,
			'marine_pollution'			=> $r->marine_pollution,
			'waste_management'			=> $r->waste_management,
			'partial_cost'				=> $r->partial_cost,
			'marine_cost_per_ton'		=> $r->marine_cost_per_ton,
			'waste_cost_per_ton'		=> $r->waste_cost_per_ton,
			'cigarettes_consumed'		=> $r->cigarettes_consumed,
			'economic_cost'				=> $r->economic_cost,
			'economic_cost_currency'	=> $r->economic_cost_currency,
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

		$country->load('country_detail', 'cost_estimation', 'references', 'companies', 'meta_data');
		
		return response([
			'res' => $country
		]);
	}

	public function info($id) {
		$country = Country::where('id', $id)
				->with([
					'country_detail', 
					'cost_estimation', 
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
			'death' 					=> 'required',
			'csr_local_examples' 		=> 'required',
			'csr_policy' 				=> 'required',
			'acknowledgement' 			=> 'required',
			// cost estimations
			'marine_pollution' 			=> 'required',
			'waste_management' 		=> 'required',
			'partial_cost' 				=> 'required',
			'marine_cost_per_ton' 		=> 'required',
			'waste_cost_per_ton' 		=> 'required',
			'cigarettes_consumed' 		=> 'required',
			'economic_cost' 			=> 'required',
			'economic_cost_currency' 	=> 'required',
			// references
			'reference'					=> 'sometimes|array',
			'reference_sequence'		=> 'sometimes|array',
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
				'region'	=> isset($r->region) ? ($r->region != null && $r->region != '' ? $r->region : '') : '',
				'publish'	=> $r->publish,
			]);

			$country->meta_data->update([
				'meta_title'		=> isset($r->meta_title) ? $r->meta_title : $r->name,
				'meta_description'	=> isset($r->meta_description) ? $r->meta_description : $r->threat_to_environment,
			]);

			$country->country_detail->update([
				'death'					=> $r->death,
				'csr_local_examples'	=> $r->csr_local_examples,
				'csr_policy'			=> $r->csr_policy,
				'acknowledgement'		=> $r->acknowledgement,
			]);

			$country->cost_estimation->update([
				'marine_pollution'			=> $r->marine_pollution,
				'waste_management'			=> $r->waste_management,
				'partial_cost'				=> $r->partial_cost,
				'marine_cost_per_ton'		=> $r->marine_cost_per_ton,
				'waste_cost_per_ton'		=> $r->waste_cost_per_ton,
				'cigarettes_consumed'		=> $r->cigarettes_consumed,
				'economic_cost'				=> $r->economic_cost,
				'economic_cost_currency'	=> $r->economic_cost_currency,
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

			$country->load('country_detail', 'cost_estimation', 'references', 'companies', 'meta_data');
		
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
				->when( $r->filled('all') , function ($q, $r) {
					return $q->get();
				}, function ($q) {
					return $q->paginate(20);
				});


		return response([
			'res' => $country
		]);
	}
	
	/**
	 ** ###[ WEB APIs ]###########################
	 **
	 **/
	public function allCountry(Request $r) {
		$resultData['country'] = Country::when(isset($r->keyword), function ($query) use ($r) {
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
				->where('publish', 1)
				->get();

		$resultData['selected_country'] = Country::when(isset($r->selected_country), function ($query) use ($r) {
			$query->where('iso2', $r->selected_country);
		})
		->with([
			'country_detail', 
			'cost_estimation', 
			'references', 
			'companies', 
			'meta_data'
		])
		->where('publish', 1)
		->first();
		
		return response([
			'res' => $resultData
		]);
	}
}
