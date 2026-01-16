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

echo "--- Entrypoint Script Finished ---"

# Execute the original CMD
exec "$@"
