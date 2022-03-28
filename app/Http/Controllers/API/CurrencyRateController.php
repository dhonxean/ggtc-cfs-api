<?php

namespace App\Http\Controllers\API;

use App\Jobs\UpdateCurrencyRate;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Http;
use App\Models\{
	Country,
	CurrencyRate,
};

class CurrencyRateController extends Controller
{

	public function test() {
		// UpdateCurrencyRate::dispatch();
		// $response =  json_decode(Http::get('https://v6.exchangerate-api.com/v6/36430dbc9f74e0c9baf55e9f/latest/USD')->body());
		// foreach ($response->conversion_rates as $key => $value) {
		// 	CurrencyRate::updateOrCreate([
		// 		'name' => $key,
		// 	],[
		// 		'amount' => $value
		// 	]);
		// }
	}
}
