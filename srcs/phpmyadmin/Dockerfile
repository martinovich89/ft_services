FROM alpine:latest

RUN apk update && apk add --no-cache \
    php7 \
    php7-fpm \
    php7-opcache \
    php7-gd \
    php7-mysqli \
    php7-zlib \
    php7-curl \
    php7-mbstring \
    php7-json \
    php7-session \
    nginx \
    phpmyadmin \
    openssl

COPY srcs/config.inc.php ./
COPY srcs/default.conf /etc/nginx/conf.d/default.conf
COPY srcs/launch.sh /usr/local/bin
#COPY srcs/www.conf /etc/php7/php-fpm.d/www.conf

RUN mkdir /etc/nginx/ssl \
&&  openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=75/L=PARIS/O=42/OU=mhenry/CN=ft_services" \
    -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

RUN cp config.inc.php /etc/phpmyadmin/config.inc.php \
&&  chmod +x usr/local/bin/launch.sh \
#&&  chmod 777 -R /usr/share/webapps/phpmyadmin \
&&  chmod -R 777 /var/log/nginx \
&&  mkdir -p /var/www && mkdir -p /run/nginx && mkdir -p /run/php && mkdir -p /run/phpmyadmin && mkdir -p /var/run/ \
&&  mv /usr/share/webapps/phpmyadmin/* /var/www/.

EXPOSE 5000

CMD	["launch.sh"]
