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

class CountryAcknowledgementImport implements ToCollection
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

					$iso2 = $row[0];
					$acknowledgement = $row[1];

					$countryExisted = false;
					$country = Country::where('iso2', $iso2)->first();
					
					# update existing record of this country
					if ($country){
						$countryExisted = true;
			
						CountryDetail::updateOrCreate([
							'country_id' => $country->id,
						],[
							'acknowledgement'		=> $acknowledgement,
						]);
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
