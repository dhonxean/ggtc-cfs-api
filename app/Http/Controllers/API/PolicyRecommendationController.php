<?php

namespace App\Http\Controllers\API;

use App\Traits\MainTraits;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\PolicyRecommendation;

class PolicyRecommendationController extends Controller
{
	use MainTraits;

	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/
	public function create(Request $r) {
		$validator = \Validator::make($r->all(), [
			'content'           => 'required',
			'icons.*'  => 'required|mimes:jpeg,png,jpg|max:5000', //in kilobytes = 5mb max
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$policy_reco = PolicyRecommendation::create([
			'content' => $r->content
		]);

		if ($r->hasFile('icons')) {
			$this->addImages('policy_recommendation', $r, $policy_reco, 'icons');
		}

		return response([
			'res' => $policy_reco
		]);
	}

	public function info($id) {
		$policy_reco = PolicyRecommendation::where('id', $id)
							->with('images')
							->first();

		if($policy_reco) {
			return response([
				'res' => $policy_reco
			]);
		}
		else {
			return response([
				'errors' => ['Policy not found.']
			]);
		}
	}

	public function update($id, Request $r) {
		$validator = \Validator::make($r->all(), [
			'content'           => 'required',
			'icons.*'  => 'sometimes|mimes:jpeg,png,jpg|max:5000', //in kilobytes = 5mb max
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$policy_reco = PolicyRecommendation::where('id', $id)->first();

		if($policy_reco) {
			$policy_reco->update([
				'content' => $r->content
			]);

			$this->updateImages('policy_recommendation', $r, $policy_reco, 'icons');

			return response([
				'res' => $policy_reco
			]);
		}
		else {
			return response([
				'errors' => ['Policy not found!']
			]);
		}
	}

	public function delete($id, Request $r) {
		$policy_reco = PolicyRecommendation::where('id', $id)->first();

		if($policy_reco) {
			$policy_reco->delete();


			return response([
				'res' => 'Policy recommendation deleted.'
			]);
		}
		else {
			return response([
				'errors' => ['Policy not found!']
			]);
		}
	}

	public function getAllPolicy(Request $r) {
		$policy_reco = PolicyRecommendation::when(isset($r->keyword), function ($query) use ($r) {
					$query->where('content', 'LIKE', '%'.strtolower($r->keyword).'%');	
				})
				->when(isset($r->sort_by), function ($query) use ($r) {
					if ($r->order_type == 'desc') {
						$query->orderByDesc($r->sort_by);
					}
					else {
						$query->orderBy($r->sort_by);
					}
				})
				->paginate(20);


		return response([
			'res' => $policy_reco
		]);
	}
}
