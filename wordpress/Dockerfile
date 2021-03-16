FROM alpine:latest

RUN apk update --no-cache \
&& apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
&& apk add --no-cache nginx openrc openssl openssh

RUN mkdir -p /var/www/my_site/wordpress/

RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz \
&& mv wordpress/* /var/www/my_site/wordpress

COPY srcs/init.sh /usr/local/bin/
COPY srcs/default.conf /etc/nginx/conf.d/
COPY srcs/wp-config.php /var/www/my_site/wordpress/
#COPY srcs/index.html /var/www/my_site/wordpress/

#RUN sed -i 's/#   include \"mod_fastcgi.conf\"/   include \"mod_fastcgi.conf\"/' /etc/lighttpd/lighttpd.conf

RUN chmod 0755 /usr/local/bin/init.sh

ENTRYPOINT ["init.sh"]