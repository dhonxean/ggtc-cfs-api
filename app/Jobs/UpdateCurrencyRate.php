<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Http;
use App\Models\{
	Country,
	CurrencyRate,
};

class UpdateCurrencyRate implements ShouldQueue
{
	use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

	/**
	 * Create a new job instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		//
	}

	/**
	 * Execute the job.
	 *
	 * @return void
	 */
	public function handle()
	{
		//
		$response =  json_decode(Http::get('https://v6.exchangerate-api.com/v6/36430dbc9f74e0c9baf55e9f/latest/USD')->body());
		foreach ($response->conversion_rates as $key => $value) {
			CurrencyRate::updateOrCreate([
				'name' => $key,
			],[
				'amount' => $value
			]);
		}
	}
}
