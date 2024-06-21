<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\WebsiteController;
use App\Http\Controllers\SettingsController;

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
Route::middleware(['guest'])->group(function () {
    Route::get('/', [LoginController::class, 'index'])->name('login');
    Route::post('/login', [LoginController::class, 'login'])->name('login.post');
});

Route::middleware(['auth'])->group(function () {
    Route::resource('website', WebsiteController::class);
    Route::resource('settings', SettingsController::class);
    Route::post('/website/delete', [WebsiteController::class, 'delete'])->name('website.delete');
    Route::post('/website/build', [WebsiteController::class, 'build'])->name('website.build');
    Route::post('/website/run', [WebsiteController::class, 'runSite'])->name('website.run');
    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');
});