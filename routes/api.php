<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\{
    AdminController,
    CountryController,
    CompanyController,
    PolicyRecommendationController,
    LogoController,
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

        // policy recommendation routes
        Route::group(['prefix' => 'policy-reco'], function () {
            Route::controller(PolicyRecommendationController::class)->group(function () {
                Route::middleware('auth.admin')->group( function () {
                    Route::post('/create', 'create');
                    Route::get('/info/{id}', 'info');
                    Route::post('/update/{id}', 'update');
                    Route::delete('/delete/{id}', 'delete');
                    Route::post('/get-all-policy-recommendation', 'getAllPolicy');
                });
            });
        });

        // logo routes
        Route::group(['prefix' => 'logo'], function () {
            Route::controller(LogoController::class)->group(function () {
                Route::middleware('auth.admin')->group( function () {
                    Route::post('/create', 'create');
                    Route::get('/info/{id}', 'info');
                });
            });
        });
    });

});
