#!/bin/sh

# Wait for the PostgreSQL database to be ready
until nc -z -v -w30 staging_db 5432; do
  echo 'Waiting for the database connection...'
  sleep 1
done

cd django_api || exit
# Apply Django database migrations
python manage.py migrate

# Start the Django development server
exec gunicorn --bind 0.0.0.0:8000 django_api.wsgi:application