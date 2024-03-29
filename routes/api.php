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
	BannersController,
	ResourcesYearController,
	ResourcesController,
	TrackingController
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

		// resources
		Route::group(['prefix' => 'resources'], function () {
			Route::group(['prefix' => 'year'], function () {
				Route::controller(ResourcesYearController::class)->group(function () {
					Route::middleware('auth.admin')->group( function () {
						Route::post('create', 'create');
						Route::get('list', 'list');
						Route::get('info/{id}', 'info');
						Route::delete('delete/{id}', 'delete');
						Route::post('update/{id}', 'update');
					});
				});
			});
			Route::group(['prefix' => 'resource'], function () {
				Route::controller(ResourcesController::class)->group(function () {
					Route::middleware('auth.admin')->group( function () {
						Route::post('create', 'create');
						Route::post('list', 'list');
						Route::get('info/{id}', 'info');
						Route::delete('delete/{id}', 'delete');
						Route::post('update/{id}', 'update');
					});
				});
			});
			Route::group(['prefix' => 'content'], function () {
				Route::controller(ResourcesController::class)->group(function () {
					Route::middleware('auth.admin')->group( function () {
						Route::post('create-update', 'createUpdateContent');
						Route::get('info', 'contentInfo');
					});
				});
			});
		});

		// tracking
		Route::group(['prefix' => 'tracking'], function () {
			Route::controller(TrackingController::class)->group(function () {
				Route::middleware('auth.admin')->group( function () {
					Route::get('list', 'index');
					Route::get('stats', 'stats');
				});
			});
		});
	});

	// Web routes
	Route::group(['prefix' => 'web'], function () {

		// country
		Route::group(['prefix' => 'country'], function () {
			Route::controller(CountryController::class)->group(function () {
				Route::post('get-all-country', 'allCountry');
				Route::post('generate-image-pdf', 'generate');
			});
		});

		// banners
		Route::group(['prefix' => 'banner'], function () {
			Route::controller(BannersController::class)->group(function () {
				Route::get('get-banner', 'getBanners');
				Route::get('download-banner-file/{id}', 'downloadBanner');
			});
		});

		// resources
		Route::group(['prefix' => 'resources'], function () {
			Route::controller(ResourcesController::class)->group(function () {
				Route::get('get-resources', 'getResources');
				Route::get('download-resources-file/{id}', 'downloadResources');
			});
		});

		// tracking
		Route::group(['prefix' => 'tracking'], function () {
			Route::controller(TrackingController::class)->group(function () {
				Route::post('send-tracking', 'sendTracking');
				Route::get('stats', 'stats');
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
