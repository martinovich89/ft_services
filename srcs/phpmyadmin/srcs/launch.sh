#!/bin/sh

php-fpm7
#chmod 666 /var/run/php/sock         #222 seems working juste fine
/usr/sbin/nginx -g "daemon off;"
#tail -f /dev/null