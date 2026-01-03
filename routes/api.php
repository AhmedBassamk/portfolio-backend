<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PortfolioController;

Route::get('/projects', [PortfolioController::class, 'projects']);
Route::get('/skills', [PortfolioController::class, 'skills']);
Route::get('/experience', [PortfolioController::class, 'experience']);
