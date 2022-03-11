<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\{
    AdminController,
    CountryController
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
                    Route::post('/create', 'createCountry');
                });
            });
        });
    });

});
