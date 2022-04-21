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

					$name = $row[0];
					$iso2 = $row[1];
					$currency = $row[2];
					$currency_symbol = $row[3];
					$region = $row[4];
					$csr_local_examples = $row[5];
					$csr_policy = $row[6];
					$companies = $row[7] != '' ? explode(',', $row[7]) : [];
					$acknowledgement = $row[8];
					$death = $row[9];
					$cigarettes_consumed = $row[10];
					$cigarettes_consumed_unit = $row[11];
					$economic_cost = $row[12];
					$economic_cost_currency = $row[13];
					$cigarettes_sticks = $row[14];
					$marine_pollution = $row[15];
					$waste_management = $row[16];
					$marine_cost_per_ton = $row[17];
					$waste_cost_per_ton = $row[18];
					$partial_cost = $row[19];

					$countryExisted = false;
					$country = Country::where('iso2', $iso2)->first();
					
					# insert country
					if (!$country) {
						$check_currency = CurrencyRate::where('name', $currency)->first();
						$currency_id = 0;
						if ($check_currency) {
							$currency_id = $check_currency->id;
						}
						else {
							$create_currency = CurrencyRate::create([
								'name' 		=> $currency,
								'amount'	=> 1,
							]);

							$currency_id = $create_currency->id;
						}

						$country_id = Country::create([
							'name' 				=> $name,
							'iso2'				=> $iso2,
							'currency'			=> $currency_id,
							'currency_symbol'	=> $currency_symbol,
							'region'			=> isset($region) ? ($region != null && $region != '' ? $region : '') : '',
							'publish'			=> 0,
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
				
						CostEstimation::create([
							'country_id'				=> $country->id,
							'marine_pollution'			=> $marine_pollution,
							'waste_management'			=> $waste_management,
							'partial_cost'				=> $partial_cost,
							'marine_cost_per_ton'		=> $marine_cost_per_ton,
							'waste_cost_per_ton'		=> $waste_cost_per_ton,
							'cigarettes_consumed'		=> $cigarettes_consumed,
							'cigarettes_consumed_unit'	=> $cigarettes_consumed_unit,
							'economic_cost'				=> $economic_cost,
							'economic_cost_currency'	=> $economic_cost_currency,
							'cigarettes_sticks'			=> $cigarettes_sticks,
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
					}
					# update existing record of this country
					else{
						$countryExisted = true;
						
						$country->update([
							'name' 		=> $name,
							'currency'	=> $currency,
							'region'	=> $region,
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
			
						CostEstimation::updateOrCreate([
							'country_id' => $country->id,
						],[
							'marine_pollution'			=> $marine_pollution,
							'waste_management'			=> $waste_management,
							'partial_cost'				=> $partial_cost,
							'marine_cost_per_ton'		=> $marine_cost_per_ton,
							'waste_cost_per_ton'		=> $waste_cost_per_ton,
							'cigarettes_consumed'		=> $cigarettes_consumed,
							'economic_cost'				=> $economic_cost,
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
