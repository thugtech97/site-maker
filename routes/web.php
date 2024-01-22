<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\WebsiteController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::resource('website', WebsiteController::class);
Route::post('/website/delete', [WebsiteController::class, 'delete'])->name('website.delete');
Route::post('/website/build', [WebsiteController::class, 'build'])->name('website.build');
