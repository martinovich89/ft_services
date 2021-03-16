#!/bin/sh

#chown -R www-data:www-data /var/www/
#chmod -R 755 /var/www/

openrc
touch /run/openrc/softlevel
rc-service nginx start
apk add php-fpm7
rc-update add php-fpm7 default
rc-service php-fpm7 start

/bin/sh