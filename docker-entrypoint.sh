#!/bin/sh
set -e

# Create database file if it doesn't exist
if [ ! -f /var/www/html/database/database.sqlite ]; then
    echo "Creating database file..."
    touch /var/www/html/database/database.sqlite
fi

# Set permissions for the database directoy and file
# Ensure the www-data user has write access to BOTH the folder and the file for SQLite to work
chown -R www-data:www-data /var/www/html/database
chmod -R 775 /var/www/html/database

# Run migrations
echo "Running migrations..."
php artisan migrate --force

# Execute the original CMD
exec "$@"
