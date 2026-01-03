@echo off
echo Cleaning up corrupted installation...
if exist vendor rmdir /s /q vendor
if exist composer.lock del composer.lock
echo.
echo Reinstalling dependencies (this may take a few minutes)...
call composer install --ignore-platform-req=ext-intl --ignore-platform-req=ext-zip
echo.
echo Regenerating autoload files...
call composer dump-autoload
echo.
echo Attempting to finish setup...
call php artisan filament:install --panels --force
call php artisan make:filament-resource Project --generate
call php artisan make:filament-resource Skill --generate
call php artisan make:filament-resource Experience --generate
echo.
echo ==========================================
echo Repair Complete!
echo ==========================================
echo.
echo Please run: php artisan make:filament-user
echo.
pause
