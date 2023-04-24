<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthenticationController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;

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


Route::middleware('auth:Sanctum')->group(function() {
    Route::post('/logout',[AuthenticationController::class,'logOut']);
});
Route::post('/register',[AuthenticationController::class,'register']);
Route::post('/login',[AuthenticationController::class,'login']);
Route::post('/storeProduct',[ProductController::class,'store']);
Route::get('/showProducts',[ProductController::class,'index']);
Route::delete('/deleteProduct/{id}',[ProductController::class,'destroy']);
Route::put('/updateProduct/{id}',[ProductController::class,'update']);
Route::get('/showOrders',[OrderController::class,'index']);
Route::get('/showOrder/{id}',[OrderController::class,'show']);


