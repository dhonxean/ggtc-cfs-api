<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use PDF;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\{
	Country,
	CountryDetail,
	CostEstimation,
	CountryCompany,
	CountryReference,
	CountryMetadata,
	CurrencyRate,
	WorldCountry,
	DynamicTranslation,
	Language,
	StaticTranslation,
	Image,
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

				$currencyRate = CurrencyRate::where('name', $value['currency'])->first();

				Country::create([
					'name' => $value['name'],
					'iso2' => $value['iso2'],
					'iso3' => $value['iso3'],
					'flag' => $value['emoji'],
					'currency' => $currencyRate != null ? $currencyRate->id : null,
					'currency_symbol' => $value['currency_symbol'],
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
			// 'flag'  		  			=> 'required',
			'currency'  	  			=> 'required',
			'currency_symbol'  	  		=> 'sometimes',
			'region'  	      			=> 'sometimes',
			'publish'  	  				=> 'required',
			// country details
			'death' 					=> 'required',
			'csr_local_examples' 		=> 'required',
			'csr_policy' 				=> 'sometimes',
			'acknowledgement' 			=> 'sometimes',
			// cost estimations
			'marine_pollution' 			=> 'required',
			'waste_management' 			=> 'required',
			'partial_cost' 				=> 'required',
			'marine_cost_per_ton' 		=> 'sometimes',
			'waste_cost_per_ton' 		=> 'sometimes',
			'cigarettes_consumed' 		=> 'required',
			'cigarettes_consumed_unit' 	=> 'sometimes',
			'economic_cost' 			=> 'required',
			'economic_cost_currency' 	=> 'sometimes',
			'cigarettes_sticks' 		=> 'sometimes',
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
			'name' 				=> $r->name,
			'iso2'				=> $r->country_code,
			'iso3'				=> isset($r->country_code_2) ? $r->country_code_2 : NULL,
			// 'flag'		=> $r->flag,
			'currency'			=> $r->currency,
			'currency_symbol'	=> $r->currency_symbol,
			'region'			=> isset($r->region) ? ($r->region != null && $r->region != '' ? $r->region : '') : '',
			'publish'			=> $r->publish,
		]);
		
		$country = Country::find($r->country_code);

		CountryMetadata::create([
			'country_id'		=> $country->id,
			'meta_title'		=> isset($r->meta_title) ? $r->meta_title : $r->name,
			'meta_description'	=> isset($r->meta_description) ? $r->meta_description : $r->csr_policy,
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
			'cigarettes_consumed_unit'	=> $r->cigarettes_consumed_unit,
			'economic_cost'				=> $r->economic_cost,
			'economic_cost_currency'	=> $r->economic_cost_currency,
			'cigarettes_sticks'			=> $r->cigarettes_sticks,
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
					'meta_data',
					'currency_rate'
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
			], 400);
		}
	}

	public function update($id, Request $r) {
		$validator = \Validator::make($r->all(), [
			'name' 			  			=> 'required',
			'country_code'    			=> [
											'required',
											Rule::unique('countries', 'iso2')
											->where(function ($query) {
												return $query->where('deleted_at', NULL);
											})->ignore($id)
										],
			'country_code_2'  			=> 'sometimes',
			// 'flag'  		  			=> 'required',
			'currency'  	  			=> 'required',
			'currency_symbol'  	  		=> 'sometimes',
			'region'  	      			=> 'sometimes',
			'publish'  	  				=> 'required',
			// country details
			'death' 					=> 'required',
			'csr_local_examples' 		=> 'required',
			'csr_policy' 				=> 'sometimes',
			'acknowledgement' 			=> 'sometimes',
			// cost estimations
			'marine_pollution' 			=> 'required',
			'waste_management' 			=> 'required',
			'partial_cost' 				=> 'required',
			'marine_cost_per_ton' 		=> 'sometimes',
			'waste_cost_per_ton' 		=> 'sometimes',
			'cigarettes_consumed' 		=> 'required',
			'cigarettes_consumed_unit' 	=> 'sometimes',
			'economic_cost' 			=> 'required',
			'economic_cost_currency' 	=> 'sometimes',
			'cigarettes_sticks' 		=> 'sometimes',
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
				'name' 				=> $r->name,
				'iso2'				=> $r->country_code,
				'iso3'				=> isset($r->country_code_2) ? $r->country_code_2 : NULL,
				// 'flag'			=> $r->flag,
				'currency'			=> $r->currency,
				'currency_symbol'	=> $r->currency_symbol,
				'region'			=> isset($r->region) ? ($r->region != null && $r->region != '' ? $r->region : '') : '',
				'publish'			=> $r->publish,
			]);

			CountryMetadata::updateOrCreate([
				'country_id' => $country->id,
			],[
				'meta_title'		=> isset($r->meta_title) ? $r->meta_title : $r->name,
				'meta_description'	=> isset($r->meta_description) ? $r->meta_description : $r->threat_to_environment,
			]);

			CountryDetail::updateOrCreate([
				'country_id' => $country->id,
			],[
				'death'					=> $r->death,
				'csr_local_examples'	=> $r->csr_local_examples,
				'csr_policy'			=> $r->csr_policy,
				'acknowledgement'		=> $r->acknowledgement,
			]);

			CostEstimation::updateOrCreate([
				'country_id' => $country->id,
			],[
				'marine_pollution'			=> $r->marine_pollution,
				'waste_management'			=> $r->waste_management,
				'partial_cost'				=> $r->partial_cost,
				'marine_cost_per_ton'		=> $r->marine_cost_per_ton,
				'waste_cost_per_ton'		=> $r->waste_cost_per_ton,
				'cigarettes_consumed'		=> $r->cigarettes_consumed,
				'cigarettes_consumed_unit'	=> $r->cigarettes_consumed_unit,
				'economic_cost'				=> $r->economic_cost,
				'economic_cost_currency'	=> $r->economic_cost_currency,
				'cigarettes_sticks'			=> $r->cigarettes_sticks,
			]);
	
			$country->references()->delete();
			if (!empty($r->reference)) {
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
			], 400);
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
			], 400);
		}
	}

	public function getAllCountry(Request $r) {
		$country = Country::when(isset($r->keyword), function ($query) use ($r) {
					$query->where('name', 'LIKE', '%'.strtolower($r->keyword).'%');	
				})
				->with('currency_rate')
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
				->with('currency_rate')
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
			'meta_data',
			'currency_rate'
			])
		->where('publish', 1)
		->first();
					
		// populate available dynamic translation for specific country
		$translations = DynamicTranslation::where('country_id', $resultData['selected_country']->id)
							->with([
								'language' => function ($q) use($r) {
									$q->with([
										'static_translation', 
										'images'
									]);
								}
							])	
							->get();
		foreach($translations as $key => $item) {
			if ($item->language->static_translation != null) {
				$item->language->static_translation->content_fields = json_decode($item->language->static_translation->content_fields);
			}
		}

		$resultData['translations'] = $translations;
							
		// select language of the user based on the country code of location
		$resultData['selected_translation'] = null;
		if ($r->user_country_code) {
			$user_country = WorldCountry::where('country_code', $r->user_country_code)->first();

			if ($user_country) {
				$resultData['selected_translation'] = DynamicTranslation::where([
												'country_id' 	=> $resultData['selected_country']->id,
												'language_id'	=> $user_country->language_id
											])->first();
			}
		}

		$resultData['user_country_code'] = $r->user_country_code;

		
		// if country code not exist get the first country available 
		if ($resultData['selected_country'] == null) {
			$resultData['selected_country'] = Country::with([
				'country_detail', 
				'cost_estimation', 
				'references', 
				'companies', 
				'meta_data',
				'currency_rate'
			])
			->where('publish', 1)
			->first();
		}
		return response([
			'res' => $resultData
		]);
	}

	public function generate(Request $r) {
		$countryCode = $r->countryCode;

		// generate pdf save to storage
		$pdf = PDF::loadView('pdf', [
			'pdfs' => $r->pdfs
		])
		->setPaper('a4', 'portrait')
		->setOptions([
			'isHtml5ParserEnabled' => true,
			'dpi' => 150
		]);

		$image_url = 'uploads/image-reports';
		$pdf_url = 'uploads/pdf-reports';

		if ($r->languageCode) {
			$image_url = "uploads/translations/image-reports/$r->languageCode";
			$pdf_url = "uploads/translations/pdf-reports/$r->languageCode";
		}

		$filename = "Customized Fact Sheet - $countryCode.pdf";

		Storage::disk('public')->put("$pdf_url/$filename", $pdf->output());

		$url = url('/') . "/storage/$pdf_url/$filename";

		/* generate and save image to storage */
		$image_64 = $r->image;
		$extension = explode('/', explode(':', substr($image_64, 0, strpos($image_64, ';')))[1])[1];
		$replace = substr($image_64, 0, strpos($image_64, ',')+1); 
		$image = str_replace($replace, '', $image_64); 
		$image = str_replace(' ', '+', $image); 
		$imageName = "Customized_Fact_Sheet_-_$countryCode.$extension";

		Storage::disk('public')->put("$image_url/$imageName", base64_decode($image));
		/* end */


		return response([
			'download_url' => $url
		]);
	}
}
