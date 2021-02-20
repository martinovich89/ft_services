#!/bin/sh

mkdir /var/www/my_site
adduser -D -g 'www' www
chown -R www:www /var/lib/nginx
chown -R www:www /var/www/my_site

mkdir /etc/nginx/ssl
openssl req -x509 -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/my_site.key \
        -out /etc/nginx/ssl/my_site.crt -days 365 \
        -subj '/C=FR/ST=75/L=Paris/O=42/OU=mhenry/CN=my_site'

openrc
touch /run/openrc/softlevel
rc-service nginx start

/bin/sh