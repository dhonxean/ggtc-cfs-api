<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\{ 
	Country,
	CountryDetail,
	CostEstimation,
	CountryCompany,
	CountryReference,
	CountryMetadata,
	Company,
	CurrencyRate,
};
use App\Traits\MainTraits;

class CountryImport implements ToCollection
{

	public $results = [];
	public $success = [];
	public $errors = [];
	public $totalRows = 0;
	public $errorsCount = 0;
	public $successCount = 0;

	use MainTraits;

	/**
	* @param Collection $collection
	*/
	public function collection(Collection $collection)
	{
		//
		foreach($collection as $key =>  $row) {
			if ($key > 0) { # skip the first row kasi puro title lang nandun
				if ($row->filter()->isNotEmpty()) {
					#count the total rows imported
					$this->totalRows++;

					$publish = $row[0] == 1 ? 1 : 0;
					$name = $row[1];
					$iso2 = $row[2];
					$region = $row[3];
					$currency = $row[4];
					$marine_pollution = $row[5];
					$waste_management = $row[6];
					$partial_cost = $row[7];
					$death = $row[8];
					$economic_cost = $row[9];
					$economic_cost_currency = $row[4];
					$cigarettes_consumed = $row[10];
					$companies = $row[11] != '' ? explode('|', $row[11]) : [];
					$csr_local_examples = $row[12];
					$csr_policy = $row[13];
					$acknowledgement = $row[14];
					$reference = $row[15];

					$countryExisted = false;
					$country = Country::where('iso2', $iso2)->first();
					
					# insert country
					if (!$country) {
						$check_currency = CurrencyRate::where('name', $currency)->first();
						$currency_id = 0;
						$currency_rate = 1;
						if ($check_currency) {
							$currency_id = $check_currency->id;
							$currency_rate = $check_currency->amount;
						}
						else {
							$create_currency = CurrencyRate::create([
								'name' 		=> $currency,
								'amount'	=> 1,
							]);

							$currency_id = $create_currency->id;
							$currency_rate = $create_currency->amount;
						}

						$country_id = Country::create([
							'name' 				=> $name,
							'iso2'				=> $iso2,
							'currency'			=> $currency_id,
							'region'			=> isset($region) ? ($region != null && $region != '' ? $region : '') : '',
							'publish'			=> $publish,
						]);
						
						$country = Country::find($iso2);

						CountryMetadata::create([
							'country_id'		=> $country->id,
							'meta_title'		=> $name,
							'meta_description'	=> '',
						]);

						CountryDetail::create([
							'country_id' 			=> $country->id,
							'death'					=> $death,
							'csr_local_examples'	=> $csr_local_examples,
							'csr_policy'			=> $csr_policy,
							'acknowledgement'		=> $acknowledgement,
						]);

						$computed_marine_pollution = $marine_pollution != null && $marine_pollution != "" ? $marine_pollution / $currency_rate : $marine_pollution;
						$computed_waste_management = $waste_management != null && $waste_management != "" ? $waste_management / $currency_rate : $waste_management;
						$computed_economic_cost = $economic_cost != null && $economic_cost != "" ? $economic_cost / $currency_rate : $economic_cost;
				
						CostEstimation::create([
							'country_id'				=> $country->id,
							'marine_pollution'			=> $computed_marine_pollution,
							'waste_management'			=> $computed_waste_management,
							'partial_cost'				=> $partial_cost,
							'cigarettes_consumed'		=> $cigarettes_consumed,
							'economic_cost'				=> $computed_economic_cost,
							'economic_cost_currency'	=> $economic_cost_currency,
						]);
							
						# check if has company
						if (count($companies) > 0) {
							foreach ($companies as $index => $item) {
								$check_company = Company::where('name', $item)->first();
								
								# check if company is existing if not insert new company name
								if ($check_company) {
									$create_country_company = CountryCompany::create([
										'country_id' 	=> $country->id,
										'company_id'	=> $check_company->id,
										'sequence'		=> $index + 1,
									]);
								} 
								else {
									$company = Company::create([
										'name' => $item
									]);

									$create_country_company = CountryCompany::create([
										'country_id' 	=> $country->id,
										'company_id'	=> $company->id,
										'sequence'		=> $index + 1,
									]);
								}
							}
						}

						# check if has reference
						if ($reference != null && $reference != '') {
							CountryReference::create([
								'country_id' 	=> $country->id,
								'content'	=> $reference,
								'sequence'		=> 1,
							]);
						}
					}
					# update existing record of this country
					else{
						$countryExisted = true;

						$check_currency = CurrencyRate::where('name', $currency)->first();
						$currency_id = 0;
						$currency_rate = 1;
						if ($check_currency) {
							$currency_id = $check_currency->id;
							$currency_rate = $check_currency->amount;
						}
						else {
							$create_currency = CurrencyRate::create([
								'name' 		=> $currency,
								'amount'	=> 1,
							]);

							$currency_id = $create_currency->id;
							$currency_rate = $create_currency->amount;
						}

						$country->update([
							'name' 				=> $name,
							'currency'			=> $currency_id,
							'region'			=> isset($region) ? ($region != null && $region != '' ? $region : '') : '',
							'publish'			=> $publish,
						]);

						CountryMetadata::updateOrCreate([
							'country_id' => $country->id,
						],[
							'meta_title'		=> $name,
							'meta_description'	=> '',
						]);
			
						CountryDetail::updateOrCreate([
							'country_id' => $country->id,
						],[
							'death'					=> $death,
							'csr_local_examples'	=> $csr_local_examples,
							'csr_policy'			=> $csr_policy,
							'acknowledgement'		=> $acknowledgement,
						]);


						$computed_marine_pollution = $marine_pollution != null && $marine_pollution != "" ? $marine_pollution / $currency_rate : $marine_pollution;
						$computed_waste_management = $waste_management != null && $waste_management != "" ? $waste_management / $currency_rate : $waste_management;
						$computed_economic_cost = $economic_cost != null && $economic_cost != "" ? $economic_cost / $currency_rate : $economic_cost;
			
						CostEstimation::updateOrCreate([
							'country_id' => $country->id,
						],[
							'marine_pollution'			=> $computed_marine_pollution,
							'waste_management'			=> $computed_waste_management,
							'partial_cost'				=> $partial_cost,
							'cigarettes_consumed'		=> $cigarettes_consumed,
							'economic_cost'				=> $computed_economic_cost,
							'economic_cost_currency'	=> $economic_cost_currency,
						]);

						# check if has company
						if (count($companies) > 0) {
							$country->companies()->delete();
							foreach ($companies as $index => $item) {
								$check_company = Company::where('name', $item)->first();
								
								# check if company is existing if not insert new company name
								if ($check_company) {
									$create_country_company = CountryCompany::create([
										'country_id' 	=> $country->id,
										'company_id'	=> $check_company->id,
										'sequence'		=> $index + 1,
									]);
								} 
								else {
									$company = Company::create([
										'name' => $item
									]);

									$create_country_company = CountryCompany::create([
										'country_id' 	=> $country->id,
										'company_id'	=> $company->id,
										'sequence'		=> $index + 1,
									]);
								}
							}
						}

						# check if has reference
						if ($reference != null && $reference != '') {
							$country->references()->delete();
							CountryReference::create([
								'country_id' 	=> $country->id,
								'content'	=> $reference,
								'sequence'		=> 1,
							]);
						}
					}

					if ($countryExisted) {
						$this->success("Row " . ($key + 1) . ": Country Updated", $key);
					} else {
						$this->success("Row " . ($key + 1) . ": Country Added", $key);
					}
				}
			}
		}
	}

	protected function success ($message, $key) {
		$this->successCount++;
		array_push($this->success, $message);
		array_push($this->results, [
			'message' => $message,
			'type' => 'success'
		]);
	}

	protected function error ($message, $key) {
		$this->errorsCount++;
		array_push($this->errors, $message);
		array_push($this->results, [
			'message' => $message,
			'type' => 'error'
		]);
	}
}
