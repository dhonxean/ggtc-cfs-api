<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\StaticTranslation;

class StaticTranslationSeeder extends Seeder
{
	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run()
	{
		//
		StaticTranslation::create(
			[
				'language_id' => 0,
				'content_fields' => (object)[
					"header_title" 				=> "Customized Fact Sheet",
					"dropdown_label" 			=> "Choose a Country",
					"download" 					=> "Download",
					"infographics_title" 		=> "The estimated cost of tobacco product waste that accumulates in",
					"cultivation" 				=> "Cultivation",
					"curing" 					=> "Curing",
					"process_manufacturing" 	=> "Process & Manufacturing",
					"distribution" 				=> "Distribution",
					"use" 						=> "Use",
					"disposal"					=> "Disposal",
					"waste_management" 			=> "Waste Management",
					"marine_pollution" 			=> "Marine Pollution",
					"billion" 					=> "Billion",
					"million" 					=> "Million",
					"trillion" 					=> "Trillioin",
					"in_usd" 					=> "IN USD",
					"cost" 						=> "Cost",
					"cigarettes_consumed"		=> "Cigarettes Consumed",
					"waste_management_costs"	=> "Waste Management Costs",
					"consuming" 				=> "consuming",
					"sticks_of_cigarettes" 		=> "sticks of cigarettes",
					"produced_mainly" 			=> "produced mainly by",
					"references" 				=> "References",
					"show_less" 				=> "SHOW LESS",
					"show_more" 				=> "SHOW MORE",
					"threat_title" 				=> "Tobacco: Threat to the Environment",
					"threat_p_1" 				=> "Throughout its lifecycle, tobacco has a negative environmental impact:",
					"threat_p_2" 				=> "Clearing lands and burning plant residues lead to <b>deforestation</b>, while agrochemicals /pesticides pollute waterways and poison fishes</div>",
					"threat_p_3" 				=> "",
					"threat_p_4" 				=> "",
					"threat_p_5" 				=> "",
					"threat_p_6" 				=> "",
					"threat_p_7" 				=> "",
					"threat_p_8" 				=> "",
					"cost_p_1" 					=> "",
					"cost_p_2" 					=> "",
					"cost_p_3" 					=> "",
					"cost_p_4" 					=> "",
					"cost_p_5" 					=> "",
					"example_title" 			=> "",
					"example_p_1" 				=> "",
					"example_p_2" 				=> "",
					"example_p_3" 				=> "",
					"example_p_4" 				=> "",
					"reco_title" 				=> "",
					"reco_p_1" 					=> "",
					"reco_p_2" 					=> "",
					"reco_p_3" 					=> "",
					"reco_p_4" 					=> "",
					"reco_p_5" 					=> "",
					"reco_p_6" 					=> "",
					"marine_modal" 				=> "",
					"waste_modal" 				=> "",
					"partial_modal" 			=> "",
				],
			]
		);
	}
}
