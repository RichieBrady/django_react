#!/bin/sh

# Wait for the PostgreSQL database to be ready
# $POSTGRES_HOST is the url for the RDS instance. The url is set in backend/prod.env
until nc -z -v -w30 "$POSTGRES_HOST" 5432; do
  echo 'Waiting for the database connection...'
  sleep 1
done

cd django_api || exit
# Apply Django database migrations
python manage.py migrate

# Start the Django development server
exec gunicorn --bind 0.0.0.0:8000 django_api.wsgi:application