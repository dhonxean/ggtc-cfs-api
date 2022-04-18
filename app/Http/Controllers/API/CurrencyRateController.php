<?php

namespace App\Http\Controllers\API;

use App\Jobs\UpdateCurrencyRate;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\{
	Country,
	CurrencyRate,
};

class CurrencyRateController extends Controller
{
	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/
	public function importDefaultCurrency() {
		UpdateCurrencyRate::dispatch();
		$response =  json_decode(Http::get('https://v6.exchangerate-api.com/v6/36430dbc9f74e0c9baf55e9f/latest/USD')->body());
		foreach ($response->conversion_rates as $key => $value) {
			CurrencyRate::updateOrCreate([
				'name' => $key,
			],[
				'amount' => $value
			]);
		}
	}

	public function create(Request $r) {
		$validator = \Validator::make($r->all(), [
			'name'    => 'required|unique:currency_rates',
			'amount'    => 'required',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$current_rates = CurrencyRate::where('name', $r->name)->first();
		
		if(!$current_rates) {
			$curreny_rate = CurrencyRate::create([
				'name' => $r->name,
				'amount' => $r->amount
			]);

			return response([
				'res' => $curreny_rate
			]);
		}	
		else {
			return response([
				'errors' => ['Currency already exists.']
			]);
		}
	}

	public function info($id) {
		$curreny_rate = CurrencyRate::where('id', $id)->first();

		if ($curreny_rate) {
			return response([
				'res' => $curreny_rate
			]);
		}
		else {
			return response([
				'errors' => ['Currency not found!']
			]);
		}
	}

	public function update ($id, Request $r) {
		$validator = \Validator::make($r->all(), [
			'name' 		=> [
							'required',
							Rule::unique('currency_rates')->ignore($id),
						],
			'amount' 	=> 'required'
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$currency_rate = CurrencyRate::where('id', $id)->first();

		if ($currency_rate) {
			$currency_rate->update([
				'name' => $r->name,
				'amount' => $r->amount
			]);
			
			return response([
				'res' => $currency_rate
			]);
		}
		else {
			return response([
				'errors' => ['Company not found!']
			]);
		}
	}

	public function delete($id, Request $r) {
		$currency_rate = CurrencyRate::where('id', $id)->first();

		if ($currency_rate) {
			$currency_rate->delete();

			return response([
				'res' => ['Currency deleted.']
			]);
		}
		else {
			return response([
				'errors' => ['Currency not found!']
			]);
		}
	}

	public function getAllCurrency(Request $r) {
		$currency_rate = CurrencyRate::when(isset($r->keyword), function ($query) use ($r) {
			$query->where('name', 'LIKE', '%'.strtolower($r->keyword).'%');	
		})
		->when(isset($r->sort_by), function ($query) use ($r) {
			if ($r->order_type == 'desc') {
				$query->orderByDesc($r->sort_by);
			}
			else {
				$query->orderBy($r->sort_by);
			}
		})
		->when( $r->filled('all') , function ($q, $r) {
			return $q->get();
		}, function ($q) {
			return $q->paginate(20);
		});


		return response([
			'res' => $currency_rate
		]);
	}
}
