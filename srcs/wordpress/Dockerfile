FROM alpine:latest

RUN apk update && apk add --no-cache \
    nginx \
    php7 \
    php7-fpm \
    php7-opcache \
    php7-gd \
    php7-mysqli \
    php7-zlib \
    php7-curl \
    php7-mbstring \
    php7-json \
    php7-session

#RUN wget https://wordpress.org/latest.tar.gz

COPY srcs/latest.tar.gz ./
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/launch.sh /usr/local/bin/
COPY srcs/wp-config.php /wordpress/

#RUN chmod -R 777 /var/log/nginx \
RUN chmod +x /usr/local/bin/launch.sh \
&&  mkdir -p /run/nginx && mkdir -p /run/php && mkdir -p /run/wordpress && mkdir -p /var/run \
&&  tar -xvf latest.tar.gz \
&&  rm -rf latest.tar.gz \
&&  chmod 777 -R /wordpress \
&&  mv /wordpress/* /var/www/.

EXPOSE 5050

CMD ["launch.sh"]
