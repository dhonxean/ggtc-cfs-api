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
	Tracking,
};

class TrackingController extends Controller
{
	use MainTraits;

	public function stats(Request $request){
		$record = (object) [];

		$record->sign_ups = Tracking::where('type', 'sign-up')
		->count();

		$record->facebook = Tracking::where('type', 'facebook')
		->count();

		$record->twitter = Tracking::where('type', 'twitter')
		->count();

		return response([
			'res' => $record
		]);
	}

	public function index(Request $request){
		$consents = Tracking::when(isset($request->type), function ($q) use ($request) {
			$q->where('type', $request->type);
		})
		->with('country', function ($q) {
			$q->select('id', 'name', 'country_code');
		})
		->orderByDesc('created_at')
		->when( $request->filled('all') , function ($q, $request) {
			return $q->get();
		}, function ($q) {
			return $q->paginate(20);
		});

		return response([
			'res' => $consents
		]);
	}

	public function sendTracking(Request $request){
		$validator = \Validator::make($request->all(), [
			'campaign_name'    => 'required',
			'country_code'    => $request->type == 'sign-up' ? 'required' : 'sometimes',
			'type'    => 'required',
			'name' => $request->type == 'sign-up' ? 'required' : 'sometimes',
			'email' => 'sometimes'
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		if ($request->type == 'sign-up' && (isset($request->email))) {
			$checkConsent = Tracking::where([
				'email' => $request->email,
				'type' => 'sign-up'
			])
			->first();
	
			if ($checkConsent) {
				return response([
					'errors' => ['Email Addresss already used.']
				], 403);
			}
		}

		$consent = Tracking::create([
			'campaign_name' => $request->campaign_name,
			'country_code' => isset($request->country_code) ? $request->country_code : null,
			'type' => $request->type,
			'name' => $request->type == 'sign-up' ? $request->name : null,
			'email' => isset($request->email) ? $request->email : null, 
		]);

		$total = 0;

		$sign_ups = Tracking::where('type', 'sign-up')
		->count();

		return response([
			'res' => $sign_ups
		]);
	}
}
