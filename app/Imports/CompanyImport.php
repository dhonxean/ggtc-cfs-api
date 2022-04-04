<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\{ 
	Company,
};
use App\Traits\MainTraits;

class CompanyImport implements ToCollection
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

					$name = $row[0];

					$companyExisted = false;
					$company = Company::where('name', $name)->first();

					if (!$company) {
						Company::create([
							'name' 		=> $name,
						]);
					}
					else {
						$companyExisted = true;
					}

					if ($companyExisted) {
						$this->success("Row " . ($key + 1) . ": Company Updated", $key);
					} else {
						$this->success("Row " . ($key + 1) . ": Company Added", $key);
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
