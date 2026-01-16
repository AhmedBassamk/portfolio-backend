<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/debug-info', function () {
    return response()->json([
        'APP_NAME' => config('app.name'),
        'APP_ENV' => config('app.env'),
        'APP_DEBUG' => config('app.debug'),
        'DB_CONNECTION' => config('database.default'),
        'DB_DATABASE' => config('database.connections.sqlite.database'),
        'DB_FILE_EXISTS' => file_exists(config('database.connections.sqlite.database')),
        'PHP_VERSION' => phpversion(),
        'PDO_DRIVERS' => PDO::getAvailableDrivers(),
    ]);
});
