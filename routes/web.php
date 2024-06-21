<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ResetPasswordController;
use App\Http\Controllers\DatasetController;
use App\Http\Controllers\KlasifikasiController;
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

Route::controller(LoginController::class)->group(function () {
    Route::get('/', 'index');
    Route::get('/login', 'index')->name('login')->middleware('guest');
    Route::post('/login', 'login');
    Route::post('/logout', 'logout');
});

Route::prefix('/dashboard')->group(function () {
    Route::get('/home', [DashboardController::class, 'index'])->name('dashboard.index')->middleware('auth');
    Route::resource('/dataset', DatasetController::class)->except(['create', 'show', 'edit'])->middleware('auth');

    Route::resource('/klasifikasi', KlasifikasiController::class)->except(['create', 'show', 'edit'])->middleware('auth');
    Route::post('/klasifikasi/klasifikasiProcess', [KlasifikasiController::class, 'klasifikasiProcess'])->name('klasifikasi.klasifikasiProcess');

    Route::resource('/user', UserController::class)->except(['create', 'show', 'edit'])->middleware('auth');
    Route::put('/resetpassword/{user}', [ResetPasswordController::class, 'resetPasswordAdmin'])->name('resetpassword.resetPasswordAdmin')->middleware('auth');
});
