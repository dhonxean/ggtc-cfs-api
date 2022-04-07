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
		// 	"threat_p_2": "Clearing lands and burning plant residues lead to <b>deforestation</b>, while agrochemicals /pesticides pollute waterways and poison fishes</div>",
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
		// 	"cost_p_5": "produced mainly by",
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
		
		return json_decode($r->content);
	}
}