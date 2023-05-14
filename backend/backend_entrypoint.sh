#!/bin/sh

# Wait for the PostgreSQL database to be ready
until nc -z -v -w30 db 5432; do
  echo 'Waiting for the database connection...'
  sleep 1
done

cd django_api || exit
# Apply Django database migrations
python manage.py migrate

# Start the Django development server
exec python manage.py runserver 0.0.0.0:8000