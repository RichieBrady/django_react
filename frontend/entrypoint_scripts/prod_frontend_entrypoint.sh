#!/bin/sh

# Generate self-signed SSL certificate if not already present
if [ ! -f /etc/nginx/ssl/certificate.crt ] || [ ! -f /etc/nginx/ssl/private.key ]; then
  echo "Generating self-signed SSL certificate..."
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/certificate.crt -subj "/C=US/ST=State/L=City/O=Organization/CN=frontend"
  echo "Self-signed SSL certificate generated."
fi

# Start Nginx
echo "Starting Nginx..."
nginx -g "daemon off;"
