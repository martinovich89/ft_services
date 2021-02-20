FROM alpine:latest

RUN apk update \
&& apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
&& apk add nginx openrc openssl openssh

RUN mkdir -p /var/www/my_site/

COPY srcs/init.sh /usr/local/bin/
COPY srcs/default.conf /etc/nginx/conf.d/
#COPY srcs/index.html /var/www/my_site/
COPY srcs/phpmyadmin.inc.php /tmp/

RUN chmod +x /usr/local/bin/init.sh
#RUN chmod -R 0755 /var/www/mysite/

EXPOSE 5000

#RUN sh /init.sh
ENTRYPOINT ["init.sh"]