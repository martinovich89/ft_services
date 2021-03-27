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

# Install wordpress
RUN wget https://wordpress.org/latest.tar.gz \
&&  tar -zxvf latest.tar.gz && rm latest.tar.gz \
&&  rm -rf latest.tar.gz \
&&  mv /wordpress/* /var/www/.

# Import configs and script
COPY srcs/default.conf /etc/nginx/conf.d/default.conf
COPY srcs/launch.sh /usr/local/bin/
COPY srcs/wp-config.php /var/www/

# Making services executable
RUN mkdir -p /run/nginx \
&&  mkdir -p /run/php \
&&  mkdir -p /run/wordpress \
&&  mkdir -p /var/run \
&&  chmod +x /usr/local/bin/launch.sh

EXPOSE 5050

ENTRYPOINT ["launch.sh"]