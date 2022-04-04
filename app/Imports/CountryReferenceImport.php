<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\{ 
	Country,
	CountryReference,
};
use App\Traits\MainTraits;

class CountryReferenceImport implements ToCollection
{

	public $data = [];
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
					$content = $row[1];
					$sequence = $row[2];

					$country = Country::where('iso2', $iso2)->first();

					if ($country) {
						// compile all the references per country
						if (!isset($this->data[$iso2])) {
							$this->data[$iso2] = [];
						}
						array_push($this->data[$iso2], [
							'content' => $content,
							'sequence' => $sequence,
						]);
					}
				}
			}
		}
		
		// batch inserting of all references per country
		foreach ($this->data as $key => $val){
			$country = Country::where('iso2', $key)->first();
			if ($country) {
				$country->references()->delete();
				foreach ($val as $index => $item) {
					CountryReference::create([
						'country_id' 	=> $country->id,
						'content'	=> $item['content'],
						'sequence'		=> $index+1,
					]);
				}

				$this->success($country->name." References added", $key);
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
