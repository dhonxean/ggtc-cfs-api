<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\{
	StaticTranslation,
	Language,
};

class StaticTranslationController extends Controller
{
	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/

	/**
	 ** Insert default content fields to all type of language
	**
	**/
	public function import (Request $r) {
		// {
		// 	"header_title": "Customized Fact Sheet",
		// 	"dropdown_label": "Choose a Country",
		// 	"download": "Download",
		// 	"infographics_title": "The estimated cost of tobacco product waste that accumulates in",
		// 	"cultivation": "Cultivation",
		// 	"curing": "Curing",
		// 	"process_manufacturing": "Process & Manufacturing",
		// 	"distribution": "Distribution",
		// 	"use": "Use",
		// 	"disposal": "Disposal",
		// 	"waste_management": "Waste Management",
		// 	"marine_pollution": "Marine Pollution",
		// 	"billion": "Billion",
		// 	"million": "Million",
		// 	"trillion": "Trillion",
		// 	"in_usd": "IN USD",
		// 	"cost": "Cost",
		// 	"cigarettes_consumed": "Cigarettes Consumed",
		// 	"waste_management_costs": "Waste Management Costs",
		// 	"consuming": "consuming",
		// 	"sticks_of_cigarettes": "sticks of cigarettes",
		// 	"produced_mainly": "produced mainly by",
		// 	"references": "References",
		// 	"show_less": "SHOW LESS",
		// 	"show_more": "SHOW MORE",
		// 	"threat_title": "Tobacco: Threat to the Environment",
		// 	"threat_p_1": "Throughout its lifecycle, tobacco has a negative environmental impact:",
		// 	"threat_p_2": "Clearing lands and burning plant residues lead to <b>deforestation</b>, while agrochemicals /pesticides pollute waterways and poison fishes",
		// 	"threat_p_3": "Burning firewood to cure leaves causes <b>deforestation and water scarcity</b>",
		// 	"threat_p_4": "Processes involve use of toxic chemicals, and emission of greenhouse gases &amp; other waste",
		// 	"threat_p_5": "Greenhouse gases are emitted during transport",
		// 	"threat_p_6": "Toxic residue from tobacco smoke lingers in the environment ( <b>indoor particulate matter</b> concentrations are 10x higher than diesel car exhausts)",
		// 	"threat_p_7": "<ul><li>Cigarette butts are some of the most littered item on earth and tobacco product packaging yields 2 million <b>tons of solid waste</b></li></ul>",
		// 	"threat_p_8": "<ul><li>Over 1/3 of butt litter wind up in the oceans and <b>19-38% of total debris</b> in ocean clean-ups are cigarette butts</li> <li>Environmental toxins leach from butts inducing <b>long term harm to marine life.</b></li></ul>",
		// 	"cost_p_1": "Estimates are derived from ICCD, Beaumont et al and World Bank data. Marine pollution data are conservative estimates",
		// 	"cost_p_2": "This reflects some of the environmental costs under “ Disposal.” This does NOT INCLUDE costs of deforestation and greenhouse gas emissions during “Production & Distribution; ” toxic air pollution during “Use,” accidental fires and other waste during “Disposal”",
		// 	"cost_p_3": "Added to environmental harms are",
		// 	"cost_p_4": "<span> Cigarettes Consumed</span> each year in <span>economic losses</span> from",
		// 	"example_title": "Tobacco Industry’s So-Called CSR",
		// 	"example_p_1": "Cigarette is the only consumer product that, if used as intended, kills half of its consumers. Tobacco kills 8 million people annually, far more than weapons and natural disasters, combined. And the tobacco industry is known to obscure the harms it causes through so-called corporate social responsibility activities (CSR) to divert attention from tobacco’s devastating impact. Tobacco companies’ activities tend to shift the blame of environmental harm to consumers and drown out voices of farmers and workers impacted by environmental and health harms.",
		// 	"example_p_2": "According to the WHO Framework Convention on Tobacco Control, <b>the tobacco industry must be prohibited from promoting its so-called CSR activities. Governments must not give the tobacco industry a seat at the table.</b> Over 60 governments specifically ban sponsorship activities of the tobacco industry.",
		// 	"example_p_3": "WHO Framework Convention on Tobacco Control is adopted by 182 governments (fine print)",
		// 	"example_p_4": "Limit interactions with the tobacco industry unless strictly necessary for regulations",
		// 	"reco_title": "Recommendations",
		// 	"reco_p_1": "The tobacco industry must be held to account. By the nature of its business, tobacco companies are violating human rights. They have significant control over the product design and supply chains that have caused harms to ocean life and disruption to the ecosystem. The WHO FCTC provides ways forward:",
		// 	"reco_p_2": "<span>Price and Tax Measures</span> (Art 6) Require the tobacco industry to pay for negative externalities through increased taxation or fees; several countries impose fees consistent with the polluters pay principle. (For single use plastics, under which cigarette butts fall, some have used an Extended Producer Responsibility (EPR) system to shift to the industry the burden of dealing with product waste.)",
		// 	"reco_p_3": "<span>Sponsorship Bans</span> (Art 13): Prohibit so-called CSR of tobacco companies or ban its publicity (if there are constitutional restrictions to a ban) and do not participate in, partner in, or publicize the same",
		// 	"reco_p_4": "<span>Economically-Viable Alternatives</span> (Art 17 18) : Adopt and sustainably finance farmer/ worker-driven policies towards diversification and protect these from tobacco industry interference",
		// 	"reco_p_5": "<span>Liability</span> (Art 19): Promote international cooperation in holding the tobacco industry liable for harms caused including environmental harms",
		// 	"reco_p_6": "<span>Tobacco Industry Interference</span> (Art 5.3): Protect policies from the commercial and vested interests of the tobacco industry; and denormalize so-called CSR of the tobacco companies. <i>Tobacco’s “corporate social responsibility” is an inherent contradiction. When so-called Extended Producer Responsibility (EPR) is applied to the tobacco industry, the latter should not be allowed to publicize the same, make false claims relating to sustainability, or use the same for influencing policy or engaging with governments.</i>",
		// 	"marine_modal": "<span>Marine Cost</span> is Cigarette Butts (in Tons) multiplied by Upper Estimate of the annual cost in terms of reduced marine natural capital.” This is conjectured to be conservatively between 3300 to 33000, where the upper limit of 33000 is used in our estimate given the toxic nature of butts (unlike other plastic item) It is assumed that 2/3 of cigarette butts end up in the ocean, hence 2/3 of sticks consumed is applied Basis for the weight of the butts is 3.4g per 20sticks( source). Note also that in developing countries where consumption is highest; wastes are not managed properly and can also end up in oceans.Cigarette volume consumed in Sticks/Million data is from (ICCD and or Atlas)",
		// 	"waste_modal": "<span>Waste Management</span> cost includes ( AN list all eg landfill hauling etc) Estimates are derived from WB projected costs for 2025 which differentiates costs for HIC UMIC LMIC LIC per ton. Sticks in millions are converted into tons by assuming that 20 sticks has 3.4g of butt when fully consumed (source) Cigarette volume consumed in Sticks/Million data is from (ICCD and or Atlas)",
		// 	"partial_modal": "<span>Partial Cost</span> is an ANNUAL COST which is the sum of Waste Management Cost (World Bank) and Marine Pollution Cost (Beaumont et al). It is called Partial Cost because Marine Pollution costs are conservative estimates and there are other costs that are not incorporated here such as accidental fires. It also excludes production related environmental impact such as deforestation and greenhouse gas emissions or impact of toxic emissions during use."
		// }
		
		// $default_content_fields = json_decode($r->content);
		
		$static_content = StaticTranslation::where('language_id', 0)->first();
		$languages = Language::get();
		if (!$static_content) {
			StaticTranslation::create([
				'language_id' 		=> 0,
				'content_fields'	=> $r->content
			]);
		}

		// uncomment this is importing all the languages with the default content 

		// foreach ($languages as $key => $item) {
		// 	$check_translation = StaticTranslation::where('language_id', $item->id)->first();
		// 	if (!$check_translation) {
		// 		StaticTranslation::create([
		// 			'language_id' 		=> $item->id,
		// 			'content_fields'	=> $r->content
		// 		]);
		// 	}
		// }
	}

	public function getAvailableLanguage() {
		$language = Language::doesntHave('static_translation')
					->get();

		return response([
			'res' => $language
		]);
	}

	public function create(Request $r) {
		$validator = \Validator::make($r->all(), [
			'language_id'    			=> 'required|unique:static_translations,language_id',
			'header_title'    			=> 'sometimes',
			'dropdown_label'   			=> 'sometimes',
			'download'    				=> 'sometimes',
			'infographics_title'    	=> 'sometimes',
			'cultivation'    			=> 'sometimes',
			'curing'   					=> 'sometimes',
			'process_manufacturing'		=> 'sometimes',
			'distribution'    			=> 'sometimes',
			'use'    					=> 'sometimes',
			'disposal'    				=> 'sometimes',
			'waste_management'    		=> 'sometimes',
			'marine_pollution'    		=> 'sometimes',
			'billion'    				=> 'sometimes',
			'million'    				=> 'sometimes',
			'trillion'    				=> 'sometimes',
			'in_usd'    				=> 'sometimes',
			'cost'   					=> 'sometimes',
			'cigarettes_consumed'   	=> 'sometimes',
			'waste_management_costs'	=> 'sometimes',
			'consuming'    				=> 'sometimes',
			'sticks_of_cigarettes' 		=> 'sometimes',
			'produced_mainly'    		=> 'sometimes',
			'references'   				=> 'sometimes',
			'show_less'    				=> 'sometimes',
			'show_more'    				=> 'sometimes',
			'threat_title'    			=> 'sometimes',
			'threat_p_1'    			=> 'sometimes',
			'threat_p_2'    			=> 'sometimes',
			'threat_p_3'    			=> 'sometimes',
			'threat_p_4'    			=> 'sometimes',
			'threat_p_5'    			=> 'sometimes',
			'threat_p_6'    			=> 'sometimes',
			'threat_p_7'    			=> 'sometimes',
			'threat_p_8'    			=> 'sometimes',
			'cost_p_1'    				=> 'sometimes',
			'cost_p_2'    				=> 'sometimes',
			'cost_p_3'    				=> 'sometimes',
			'cost_p_4'    				=> 'sometimes',
			'example_title'    			=> 'sometimes',
			'example_p_1'    			=> 'sometimes',
			'example_p_2'    			=> 'sometimes',
			'example_p_3'    			=> 'sometimes',
			'example_p_4'    			=> 'sometimes',
			'reco_title'    			=> 'sometimes',
			'reco_p_1'    				=> 'sometimes',
			'reco_p_2'    				=> 'sometimes',
			'reco_p_3'    				=> 'sometimes',
			'reco_p_4'    				=> 'sometimes',
			'reco_p_5'    				=> 'sometimes',
			'reco_p_6'    				=> 'sometimes',
			'marine_modal'    			=> 'sometimes',
			'waste_modal'    			=> 'sometimes',
			'partial_modal'    			=> 'sometimes',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$content_fields = (object) [
			'header_title'				=> $r->header_title,
			'dropdown_label' 			=> $r->dropdown_label,
			'download' 					=> $r->download,
			'infographics_title' 		=> $r->infographics_title,
			'cultivation' 				=> $r->cultivation,
			'curing' 					=> $r->curing,
			'process_manufacturing' 	=> $r->process_manufacturing,
			'distribution' 				=> $r->distribution,
			'use' 						=> $r->use,
			'disposal' 					=> $r->disposal,
			'waste_management' 			=> $r->waste_management,
			'marine_pollution' 			=> $r->marine_pollution,
			'billion' 					=> $r->billion,
			'million' 					=> $r->million,
			'trillion' 					=> $r->trillion,
			'in_usd' 					=> $r->in_usd,
			'cost' 						=> $r->cost,
			'cigarettes_consumed' 		=> $r->cigarettes_consumed,
			'waste_management_costs' 	=> $r->waste_management_costs,
			'consuming' 				=> $r->consuming,
			'sticks_of_cigarettes' 		=> $r->sticks_of_cigarettes,
			'produced_mainly' 			=> $r->produced_mainly,
			'references' 				=> $r->references,
			'show_less' 				=> $r->show_less,
			'show_more' 				=> $r->show_more,
			'threat_title' 				=> $r->threat_title,
			'threat_p_1' 				=> $r->threat_p_1,
			'threat_p_2' 				=> $r->threat_p_2,
			'threat_p_3' 				=> $r->threat_p_3,
			'threat_p_4' 				=> $r->threat_p_4,
			'threat_p_5' 				=> $r->threat_p_5,
			'threat_p_6' 				=> $r->threat_p_6,
			'threat_p_7' 				=> $r->threat_p_7,
			'threat_p_8' 				=> $r->threat_p_8,
			'cost_p_1' 					=> $r->cost_p_1,
			'cost_p_2' 					=> $r->cost_p_2,
			'cost_p_3' 					=> $r->cost_p_3,
			'cost_p_4' 					=> $r->cost_p_4,
			'example_title' 			=> $r->example_title,
			'example_p_1' 				=> $r->example_p_1,
			'example_p_2' 				=> $r->example_p_2,
			'example_p_3' 				=> $r->example_p_3,
			'example_p_4' 				=> $r->example_p_4,
			'reco_title' 				=> $r->reco_title,
			'reco_p_1' 					=> $r->reco_p_1,
			'reco_p_2' 					=> $r->reco_p_2,
			'reco_p_3' 					=> $r->reco_p_3,
			'reco_p_4' 					=> $r->reco_p_4,
			'reco_p_5' 					=> $r->reco_p_5,
			'reco_p_6' 					=> $r->reco_p_6,
			'marine_modal' 				=> $r->marine_modal,
			'waste_modal' 				=> $r->waste_modal,
			'partial_modal' 			=> $r->partial_modal,
		];

		$static_translations = StaticTranslation::where('language_id', $r->language_id)->first();

		if (!$static_translations) {
			$static_translation = StaticTranslation::create([
				'language_id' 		=> $r->language_id,
				'content_fields'	=> json_encode($content_fields)
			]);

			$static_translation->load('language');

			return response([
				'res' => $static_translation
			]);
		}
		else{
			return response([
				'errors' => ['Static Language Translation already exists.']
			]);
		}
	}

	public function info ($id, Request $r) {
		if (isset($r->type)) {
			$static_translation = Language::where('id', $id)
								->with('static_translation')
								->first();
		}
		else {
			$static_translation = StaticTranslation::where('id', $id)->first();
		}

		if ($static_translation) {
			if (isset($r->type)) {
				if ($static_translation->static_translation != null) {
					$content_fields = json_decode($static_translation->static_translation->content_fields);
					$static_translation->static_translation->content_fields = $content_fields;
				}
			}
			else {
				$content_fields = json_decode($static_translation->content_fields);
				$static_translation->content_fields = $content_fields;
			}
			return response([
				'res' => $static_translation
			]);
		}
		else {
			return response([
				'errors' => ['Translation not found!']
			], 404);
		}
	}

	public function update ($id, Request $r) {
		$validator = \Validator::make($r->all(), [
			'language_id' => [
				'required',
				Rule::unique('static_translations')->ignore($id),
			],
			'header_title'    			=> 'sometimes',
			'dropdown_label'   			=> 'sometimes',
			'download'    				=> 'sometimes',
			'infographics_title'    	=> 'sometimes',
			'cultivation'    			=> 'sometimes',
			'curing'   					=> 'sometimes',
			'process_manufacturing'		=> 'sometimes',
			'distribution'    			=> 'sometimes',
			'use'    					=> 'sometimes',
			'disposal'    				=> 'sometimes',
			'waste_management'    		=> 'sometimes',
			'marine_pollution'    		=> 'sometimes',
			'billion'    				=> 'sometimes',
			'million'    				=> 'sometimes',
			'trillion'    				=> 'sometimes',
			'in_usd'    				=> 'sometimes',
			'cost'   					=> 'sometimes',
			'cigarettes_consumed'   	=> 'sometimes',
			'waste_management_costs'	=> 'sometimes',
			'consuming'    				=> 'sometimes',
			'sticks_of_cigarettes' 		=> 'sometimes',
			'produced_mainly'    		=> 'sometimes',
			'references'   				=> 'sometimes',
			'show_less'    				=> 'sometimes',
			'show_more'    				=> 'sometimes',
			'threat_title'    			=> 'sometimes',
			'threat_p_1'    			=> 'sometimes',
			'threat_p_2'    			=> 'sometimes',
			'threat_p_3'    			=> 'sometimes',
			'threat_p_4'    			=> 'sometimes',
			'threat_p_5'    			=> 'sometimes',
			'threat_p_6'    			=> 'sometimes',
			'threat_p_7'    			=> 'sometimes',
			'threat_p_8'    			=> 'sometimes',
			'cost_p_1'    				=> 'sometimes',
			'cost_p_2'    				=> 'sometimes',
			'cost_p_3'    				=> 'sometimes',
			'cost_p_4'    				=> 'sometimes',
			'example_title'    			=> 'sometimes',
			'example_p_1'    			=> 'sometimes',
			'example_p_2'    			=> 'sometimes',
			'example_p_3'    			=> 'sometimes',
			'example_p_4'    			=> 'sometimes',
			'reco_title'    			=> 'sometimes',
			'reco_p_1'    				=> 'sometimes',
			'reco_p_2'    				=> 'sometimes',
			'reco_p_3'    				=> 'sometimes',
			'reco_p_4'    				=> 'sometimes',
			'reco_p_5'    				=> 'sometimes',
			'reco_p_6'    				=> 'sometimes',
			'marine_modal'    			=> 'sometimes',
			'waste_modal'    			=> 'sometimes',
			'partial_modal'    			=> 'sometimes',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$content_fields = (object) [
			'header_title'				=> $r->header_title,
			'dropdown_label' 			=> $r->dropdown_label,
			'download' 					=> $r->download,
			'infographics_title' 		=> $r->infographics_title,
			'cultivation' 				=> $r->cultivation,
			'curing' 					=> $r->curing,
			'process_manufacturing' 	=> $r->process_manufacturing,
			'distribution' 				=> $r->distribution,
			'use' 						=> $r->use,
			'disposal' 					=> $r->disposal,
			'waste_management' 			=> $r->waste_management,
			'marine_pollution' 			=> $r->marine_pollution,
			'billion' 					=> $r->billion,
			'million' 					=> $r->million,
			'trillion' 					=> $r->trillion,
			'in_usd' 					=> $r->in_usd,
			'cost' 						=> $r->cost,
			'cigarettes_consumed' 		=> $r->cigarettes_consumed,
			'waste_management_costs' 	=> $r->waste_management_costs,
			'consuming' 				=> $r->consuming,
			'sticks_of_cigarettes' 		=> $r->sticks_of_cigarettes,
			'produced_mainly' 			=> $r->produced_mainly,
			'references' 				=> $r->references,
			'show_less' 				=> $r->show_less,
			'show_more' 				=> $r->show_more,
			'threat_title' 				=> $r->threat_title,
			'threat_p_1' 				=> $r->threat_p_1,
			'threat_p_2' 				=> $r->threat_p_2,
			'threat_p_3' 				=> $r->threat_p_3,
			'threat_p_4' 				=> $r->threat_p_4,
			'threat_p_5' 				=> $r->threat_p_5,
			'threat_p_6' 				=> $r->threat_p_6,
			'threat_p_7' 				=> $r->threat_p_7,
			'threat_p_8' 				=> $r->threat_p_8,
			'cost_p_1' 					=> $r->cost_p_1,
			'cost_p_2' 					=> $r->cost_p_2,
			'cost_p_3' 					=> $r->cost_p_3,
			'cost_p_4' 					=> $r->cost_p_4,
			'example_title' 			=> $r->example_title,
			'example_p_1' 				=> $r->example_p_1,
			'example_p_2' 				=> $r->example_p_2,
			'example_p_3' 				=> $r->example_p_3,
			'example_p_4' 				=> $r->example_p_4,
			'reco_title' 				=> $r->reco_title,
			'reco_p_1' 					=> $r->reco_p_1,
			'reco_p_2' 					=> $r->reco_p_2,
			'reco_p_3' 					=> $r->reco_p_3,
			'reco_p_4' 					=> $r->reco_p_4,
			'reco_p_5' 					=> $r->reco_p_5,
			'reco_p_6' 					=> $r->reco_p_6,
			'marine_modal' 				=> $r->marine_modal,
			'waste_modal' 				=> $r->waste_modal,
			'partial_modal' 			=> $r->partial_modal,
		];

		$static_translation = StaticTranslation::where('id', $id)->first();

		if ($static_translation) {
			$static_translation->update([
				'language_id' 		=> $r->language_id,
				'content_fields'	=> json_encode($content_fields)
			]);

			$static_translation->load('language');

			return response([
				'res' => $static_translation
			]);
		}
		else {
			return response([
				'errors' => ['Translation not found!']
			], 400);
		}
	}

	public function delete ($id, Request $r) {
		$static_translation = StaticTranslation::where('id', $id)->first();

		if ($static_translation) {
			$static_translation->delete();

			return response([
				'res' => ['Translation deleted.']
			]);
		}
		else {
			return response([
				'errors' => ['Translation not found!']
			], 400);
		}
	}

	public function getAllStaticTranslation (Request $r) {
		$static_translations = StaticTranslation::select('static_translations.id', 'static_translations.language_id', 'lang.name as language_name', 'static_translations.created_at')
				->when(isset($r->keyword), function ($query) use ($r) {
					$query->whereHas('language', function ($q) use ($r) {
						$q->where('lang.name', 'LIKE', '%'.strtolower($r->keyword).'%');
					});
				})
				->join('languages as lang', 'lang.id', '=', 'static_translations.language_id')
				->when(isset($r->sort_by), function ($query) use ($r) {
					if ($r->sort_by == 'language_id') {
						if ($r->order_type == 'desc') {
							$query->orderByDesc('lang.name');
						}
						else {
							$query->orderBy('lang.name');
						}
					}
					else {
						if ($r->order_type == 'desc') {
							$query->orderByDesc('static_translations.'.$r->sort_by);
						}
						else {
							$query->orderBy('static_translations.'.$r->sort_by);
						}
					}
				})
				->when( $r->filled('all') , function ($q, $r) {
					return $q->get();
				}, function ($q) {
					return $q->paginate(20);
				});

		// foreach ($static_translations as $key => $data) {
		// 	$data->content_fields = json_decode($data->content_fields);
		// }

		return response([
			// 'res' => collect($static_translations)->paginate(20)
			'res' => $static_translations
		]);
	}
}