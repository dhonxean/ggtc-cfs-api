<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\{
	AdminController,
	CountryController,
	CompanyController,
	CurrencyRateController,
	ImportController,
	LanguageController,
	WorldCountryController,
	StaticTranslationController,
	DynamicTranslationController,
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
	});

	// Web routes
	Route::group(['prefix' => 'web'], function () {
		Route::group(['prefix' => 'country'], function () {
			Route::controller(CountryController::class)->group(function () {
				Route::post('get-all-country', 'allCountry');
				Route::post('generate-image-pdf', 'generate');
			});
		});
	});
});

Route::group(['prefix' => 'v2'], function () {
	// Admin routes
	Route::group(['prefix' => 'admin'], function () {
		// language routes
		Route::group(['prefix' => 'language'], function () {
			Route::controller(LanguageController::class)->group(function () {
				Route::middleware('auth.admin')->group( function () {
					Route::post('/import', 'importLanguage');
					Route::post('/create', 'create');
					Route::get('/info/{id}', 'info');
					Route::post('/update/{id}', 'update');
					Route::delete('/delete/{id}', 'delete');
					Route::post('/get-all-language', 'getAllLanguage');
				});
			});
		});

		// world country routes
		Route::group(['prefix' => 'world-country'], function () {
			Route::controller(WorldCountryController::class)->group(function () {
				Route::middleware('auth.admin')->group( function () {
					Route::post('/import-countries', 'import');
					Route::post('/create', 'create');
					Route::get('/info/{id}', 'info');
					Route::post('/update/{id}', 'update');
					Route::delete('/delete/{id}', 'delete');
					Route::post('/get-all-world-country', 'getAllCountry');
				});
			});
		});

		// static translation routes
		Route::group(['prefix' => 'static-translation'], function () {
			Route::controller(StaticTranslationController::class)->group(function () {
				Route::middleware('auth.admin')->group( function () {
					Route::post('/import-static-translation', 'import');
					Route::get('/get-available-language', 'getAvailableLanguage');
					Route::post('/create', 'create');
					Route::get('/info/{id}', 'info');
					Route::post('/update/{id}', 'update');
					Route::delete('/delete/{id}', 'delete');
					Route::post('/get-all-static-translation', 'getAllStaticTranslation');
					Route::post('/import-language-static-translation', 'importLanguageStaticTranslation');
				});
			});
		});
		
		
		// dynamic translation
		Route::group(['prefix' => 'dynamic-translation'], function () {
			Route::controller(DynamicTranslationController::class)->group(function () {
				Route::middleware('auth.admin')->group( function () {
					Route::post('/create', 'create');
					Route::get('/info/{id}', 'info');
					Route::post('/update/{id}', 'update');
					Route::delete('/delete/{id}', 'delete');
					Route::post('/get-country-dynamic-translation', 'getCountryDynamicTranslation');
					Route::post('/import-dynamic-translation', 'importDynamicTranslation');
				});
			});
		});
	});
});
