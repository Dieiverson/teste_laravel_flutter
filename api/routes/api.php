<?php

use App\Http\Controllers\MugController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::get('/getQuantity', [MugController::class, 'getQuantity']);
Route::post('/add', [MugController::class, 'addMug']);
Route::post('/remove', [MugController::class, 'removeMug']);
