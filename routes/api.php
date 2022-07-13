<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\{
	AdminController,
	CountryController,
	CompanyController,
	CurrencyRateController,
	ImportController,
	BannersController,
};

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['prefix' => 'v1'], function () {
	
	// Admin routes
	Route::group(['prefix' => 'admin'], function () {
		Route::controller(AdminController::class)->group(function () {
			Route::post('/login', 'login');
			Route::post('/logout', 'logout');
			Route::post('/create', 'create');
			Route::get('/info', 'info');
			Route::post('/update/{id}', 'update');
		});
		// countries routes
		Route::group(['prefix' => 'country'], function () {
			Route::controller(CountryController::class)->group(function () {
				Route::middleware('auth.admin')->group( function () {
					Route::post('/import-countries', 'massImport');
					Route::post('/create', 'create');
					Route::get('/info/{id}', 'info');
					Route::post('/update/{id}', 'update');
					Route::delete('/delete/{id}', 'delete');
					Route::post('/get-country', 'getAllCountry');
				});
			});
		});
		
		// company routes
		Route::group(['prefix' => 'company'], function () {
			Route::controller(CompanyController::class)->group(function () {
				Route::middleware('auth.admin')->group( function () {
					Route::post('/create', 'create');
					Route::get('/info/{id}', 'info');
					Route::post('/update/{id}', 'update');
					Route::delete('/delete/{id}', 'delete');
					Route::post('/get-all-company', 'getAllCompany');
				});
			});
		});

		// currency rate
		Route::group(['prefix' => 'currency-rate'], function () {
			Route::controller(CurrencyRateController::class)->group(function () {
				Route::middleware('auth.admin')->group( function () {
					Route::post('/create', 'create');
					Route::get('/info/{id}', 'info');
					Route::post('/update/{id}', 'update');
					Route::delete('/delete/{id}', 'delete');
					Route::get('import-default-currency', 'importDefaultCurrency');
					Route::post('get-all-currency', 'getAllCurrency');
				});
			});
		});

		// imports
		Route::group(['prefix' => 'import'], function () {
			Route::controller(ImportController::class)->group(function () {
				Route::middleware('auth.admin')->group( function () {
					Route::post('country', 'importCountry');
				});
			});
		});
		
		// banners
		Route::group(['prefix' => 'banner'], function () {
			Route::controller(BannersController::class)->group(function () {
				Route::middleware('auth.admin')->group( function () {
					Route::get('list', 'list');
					Route::post('create', 'create');
					Route::get('info/{id}', 'info');
					Route::delete('delete/{id}', 'delete');
					Route::post('update/{id}', 'update');
				});
			});
		});

	});

	// Web routes
	Route::group(['prefix' => 'web'], function () {

		// country
		Route::group(['prefix' => 'country'], function () {
			Route::controller(CountryController::class)->group(function () {
				Route::get('get-all-country', 'allCountry');
				Route::post('generate-image-pdf', 'generate');
			});
		});

		// banners
		Route::group(['prefix' => 'banner'], function () {
			Route::controller(BannersController::class)->group(function () {
				Route::get('get-banner/{type}', 'getBanners');
			});
		});
	});
});
