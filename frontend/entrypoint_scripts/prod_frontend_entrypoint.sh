#!/bin/sh

# Check certbot has generatewd the ssl certs and they are available to this service
if [ ! -f /etc/letsencrypt/live/example.com/privkey.pem ] || [ ! -f /etc/letsencrypt/live/example.com/fullchain.pem ]; then
  echo "The ssl cert could not be found!"
  exit
fi

echo "Starting Nginx..."

nginx -g "daemon off;"
