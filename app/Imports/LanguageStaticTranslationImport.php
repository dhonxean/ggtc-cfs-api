<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\{ 
	StaticTranslation,
    Language,
};
use App\Traits\MainTraits;

class LanguageStaticTranslationImport implements ToCollection
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

					$staticTranslationExisted = false;

					$language_name = $row[0];
					$language_code = $row[1];
					$content_fields = (object) [
						'header_title' => $row[2],
						'dropdown_label' => $row[3],
						'download' => $row[4],
						'download_sub_text' => $row[5],
						'share_infographics_title' => $row[6],
						'infographics_title' => $row[7],
						'cultivation' => $row[8],
						'curing' => $row[9],
						'process_manufacturing' => $row[10],
						'distribution' => $row[11],
						'use' => $row[12],
						'disposal' => $row[13],
						'waste_management' => $row[14],
						'marine_pollution' => $row[15],
						'billion' => $row[16],
						'million' => $row[17],
						'trillion' => $row[18],
						'link_copied' => $row[19],
						'show_less' => $row[20],
						'show_more' => $row[21],
						'back_to_main_site' => $row[22],
						'search_country' => $row[23],
						'no_country_found' => $row[24],
						'popup_title' => $row[25],
						'curing_popup' => $row[26],
						'cultivation_popup' => $row[27],
						'processing_popup' => $row[28],
						'disposal_popup' => $row[29],
						'distribution_popup' => $row[30],
						'use_popup' => $row[31],
						'marine_pollution_popup_p_1' => $row[32],
						'marine_pollution_popup_p_2' => $row[33],
						'waste_management_popup' => $row[34],
						'partial_cost_popup' => $row[35],
						'threat_title' => $row[36],
						'threat_p_1' => $row[37],
						'threat_p_2' => $row[38],
						'threat_p_3' => $row[39],
						'threat_p_4' => $row[40],
						'threat_p_5' => $row[41],
						'threat_p_6' => $row[42],
						'threat_p_7' => $row[43],
						'threat_p_8' => $row[44],
						'threat_p_9' => $row[45],
						'threat_p_10' => $row[46],
						'cost_per_year' => $row[47],
						'cost_sub_title' => $row[48],
						'cost_explanation_p_1' => $row[49],
						'cost_explanation_p_2' => $row[50],
						'cost_explanation_p_3' => $row[51],
						'cost_added_harms' => $row[52],
						'cost_deaths' => $row[53],
						'cost_and' => $row[54],
						'cost_far_more' => $row[55],
						'cost_each_year' => $row[56],
						'cost_in' => $row[57],
						'cost_economic_losses' => $row[58],
						'cost_consuming' => $row[59],
						'cost_from' => $row[60],
						'cost_sticks' => $row[61],
						'cost_produced_mainly_by' => $row[62],
						'tobacco_industry_title' => $row[63],
						'tobacco_industry_p_1' => $row[64],
						'tobacco_industry_p_2' => $row[65],
						'recommendations_title' => $row[66],
						'recommendations_p_1' => $row[67],
						'recommendations_p_2' => $row[68],
						'recommendations_item_1' => $row[69],
						'recommendations_item_2' => $row[70],
						'recommendations_item_3' => $row[71],
						'recommendations_item_4' => $row[72],
						'recommendations_item_5' => $row[73],
						'recommendations_item_6' => $row[74],
						'references_title' => $row[75],
						'references_item_1' => $row[76],
						'references_item_2' => $row[77],
						'references_item_3' => $row[78],
						'references_item_4' => $row[79],
						'references_item_5' => $row[80],
						'references_item_6' => $row[81],
						'references_item_7' => $row[82],
						'references_item_8' => $row[83],
						'references_item_9' => $row[84],
						'references_item_10' => $row[85],
						'references_item_11' => $row[86],
						'acknowledgement_title' => $row[87],
					];

					if (strtolower($language_name) == 'english' || strtolower($language_name) == 'en') {
						$this->success("Row " . ($key + 1) . ": Cannot be added or updated", $key);
					}
					else {
						$language = Language::where('code', $language_code)->first();
						$language_id = null;
						if ($language) {
							$language_id = $language->id;
							$static_translation = StaticTranslation::where('language_id', $language_id)->first();
							$default_translation = StaticTranslation::where('is_default', 1)->first();
							if ($default_translation) {
								$default_translation->content_fields = json_decode($default_translation->content_fields, JSON_OBJECT_AS_ARRAY);
							}
							foreach($content_fields as $index => $row) {
								if (!$row) {
									if ($default_translation) {
										$content_fields->{$index} = isset($default_translation->content_fields[$index]) ? $default_translation->content_fields[$index] : $row;
									}
								}
							}
	
							
							if (!$static_translation) {
								$create_static_translation = StaticTranslation::create([
									'language_id' => $language_id,
									'content_fields' => json_encode($content_fields)
								]);
							}
							else {
								$staticTranslationExisted = true;
									
								$static_translation->update([
									'content_fields' => json_encode($content_fields)
								]);
							}
						}


						if ($staticTranslationExisted) {
							$this->success("Row " . ($key + 1) . ": Static Translation Updated", $key);
						} else {
							$this->success("Row " . ($key + 1) . ": Static Translation Added", $key);
						}
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
