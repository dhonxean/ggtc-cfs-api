<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\{
	Hash,
	Validator,
	Storage,
	Response
};
use Carbon\Carbon;
use Illuminate\Validation\Rule;
use App\Traits\MainTraits;

use App\Models\{
	CampaignVotingConsent,
};

class CampaignVotingConsentController extends Controller
{
	use MainTraits;

	public function stats(Request $request){
		$record = (object) [];

		$record->clicks = CampaignVotingConsent::where('type', 'click')
		->count();

		$record->redirects = CampaignVotingConsent::where('type', 'redirect')
		->count();

		return response([
			'res' => $record
		]);
	}

	public function index(Request $request){
		$consents = CampaignVotingConsent::when(isset($request->type), function ($q) use ($request) {
			$q->where('type', $request->type);
		})
		->with('country', function ($q) {
			$q->select('id', 'name', 'iso2');
		})
		->orderByDesc('created_at')
		->paginate(20);

		return response([
			'res' => $consents
		]);
	}

	public function sendConsent(Request $request){
		$validator = \Validator::make($request->all(), [
			'campaign_name'    => 'required',
			'country_code'    => 'required',
			'type'    => 'required',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$consent = CampaignVotingConsent::create([
			'campaign_name' => $request->campaign_name,
			'country_code' => $request->country_code,
			'type' => $request->type,
		]);

		$consent->load('country');

		return response([
			'res' => $consent
		]);
	}
}
