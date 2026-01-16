#!/bin/sh
set -e

echo "--- Starting Entrypoint Script ---"
echo "Current User: $(whoami)"
echo "Current Directory: $(pwd)"

# Create database file if it doesn't exist
if [ ! -f /var/www/html/database/database.sqlite ]; then
    echo "Creating database file..."
    touch /var/www/html/database/database.sqlite
fi

# Set permissions for the database directory and file
echo "Setting permissions for database..."
chown -R www-data:www-data /var/www/html/database
chmod -R 775 /var/www/html/database

# Diagnostic: List database folder
ls -la /var/www/html/database

# Run migrations
echo "Running migrations..."
php artisan migrate --force

# IMPORTANT: Clear config cache to ensure APP_DEBUG and DB settings are fresh
echo "Clearing config and cache..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

# Debugging: Check APP_DEBUG status
echo "Checking APP_DEBUG status..."
php -r "echo 'APP_DEBUG in PHP: ' . (getenv('APP_DEBUG') ?: 'not set') . PHP_EOL;"

echo "--- Entrypoint Script Finished ---"

# Execute the original CMD
exec "$@"
