<?php

use App\Http\Controllers\ApiAppointementsController;
use App\Http\Controllers\ApiChatsController;
use App\Http\Controllers\ApiProductsController;
use App\Http\Controllers\ApiUsersController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route; //new staff



Route::resource('appointments', ApiAppointementsController::class);

Route::post('products', [ApiProductsController::class, 'create']);
Route::post('upload-temp-file', [ApiProductsController::class, 'upload_temp_file']);
Route::post('products', [ApiProductsController::class, 'create']);
Route::get('upload', [ApiProductsController::class, 'upload']);
Route::get('products', [ApiProductsController::class, 'index']);
Route::post('delete-product', [ApiProductsController::class, 'delete']);
Route::get('banners', [ApiProductsController::class, 'banners']); 
Route::get('categories', [ApiProductsController::class, 'categories']);
Route::get('locations', [ApiProductsController::class, 'locations']);
Route::post('users', [ApiUsersController::class, 'create_account']);
Route::post('get-chats', [ApiChatsController::class, 'index']);
Route::post('chats', [ApiChatsController::class, 'send_message']); 
Route::post('threads', [ApiChatsController::class, 'threads']); 

Route::get('users', [ApiUsersController::class, 'index']);
Route::post('users-update', [ApiUsersController::class, 'update']);
Route::post('users-login', [ApiUsersController::class, 'login']);

Route::get('posts', [ApiProductsController::class, 'posts']);
Route::get('post-categories', [ApiProductsController::class, 'post_categories']);
Route::post('posts', [ApiProductsController::class, 'create_post']);


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user(); //simple love
});
