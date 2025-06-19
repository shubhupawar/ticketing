<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\API\TicketController;
use App\Http\Controllers\API\ReplyController;

Route::controller(AuthController::class)->group(function () {
    Route::post('/register', 'register');
    Route::post('/login', 'login');
});


Route::middleware('auth:sanctum')->group(function () {
    Route::controller(TicketController::class)->group(function () {
        Route::post('/tickets', 'store');
        Route::get('/tickets', 'index');
        Route::get('/tickets/{id}', 'show');
    });
    Route::controller(ReplyController::class)->group(function () {
        Route::post('/tickets/{id}/reply', 'store');
    });
});

