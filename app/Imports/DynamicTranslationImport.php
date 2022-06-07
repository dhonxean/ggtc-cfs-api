<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\{ 
	Country,
	Language,
	DynamicTranslation,
	StaticTranslation
};
use App\Traits\MainTraits;

class DynamicTranslationImport implements ToCollection
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

					$rowAdded = false;
					$country_name = $row[0];
					$country_code = $row[1];
					$language_name = $row[2];
					$language_code = $row[3];
					$csr_policy = $row[4];
					$csr_local_examples = $row[5];
					$acknowlegement = $row[6];

					$country = Country::where([
								'iso2' => $country_code,
							])
							->first();
					
					if ($country) {
						$language = Language::where([
									'code' => $language_code
								])
								->first();
						if ($language) {
							$rowAdded = true;
							$check_dynamic_translation = DynamicTranslation::where([
														'country_id' => $country->id,
														'language_id' => $language->id
													])
													->first();		
							if ($check_dynamic_translation) {
								$check_dynamic_translation->update([
									'csr_policy' 			=> $csr_policy,
									'csr_local_examples' 	=> $csr_local_examples,
									'csr_acknowledgement' 	=> $acknowlegement,
								]);
							}
							else {
								DynamicTranslation::create([
									'country_id' => $country->id,
									'language_id' => $language->id,
									'csr_policy' 			=> $csr_policy,
									'csr_local_examples' 	=> $csr_local_examples,
									'csr_acknowledgement' 	=> $acknowlegement,
								]);
							}

							$default_translation = StaticTranslation::where('is_default', 1)->first();
							if ($default_translation) {
								$check_language_translation = StaticTranslation::where('language_id', $language->id)->first();
								if (!$check_language_translation) {
									StaticTranslation::create([
										'language_id' => $language->id,
										'content_fields' => $default_translation->content_fields,
									]);
								}
							}
						}
					}

					if ($rowAdded) {
						$this->success("Row " . ($key + 1) . ": Dynamic translation imported", $key);
					} else {
						$this->success("Row " . ($key + 1) . ": Dynamic translation cannot be import", $key);
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
