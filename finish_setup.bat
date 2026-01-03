@echo off
echo Installing Filament (this may take a while)...
call composer require filament/filament --ignore-platform-reqs
echo.
echo Installing Filament Panels...
call php artisan filament:install --panels --force
echo.
echo Creating Admin Resources...
call php artisan make:filament-resource Project --generate
call php artisan make:filament-resource Skill --generate
call php artisan make:filament-resource Experience --generate
echo.
echo ==========================================
echo Setup Complete!
echo ==========================================
echo.
echo 1. Create your admin user now by running:
echo    php artisan make:filament-user
echo.
echo 2. Start the server:
echo    php artisan serve
echo.
pause
