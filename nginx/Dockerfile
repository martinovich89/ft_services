FROM alpine:latest

RUN apk update \
&&  apk add openrc nginx openssl

COPY srcs/default.conf  /etc/nginx/conf.d/
COPY srcs/init.sh       /usr/local/bin/
COPY srcs/index.html    /var/www/my_site/
COPY srcs/proxy_params  /etc/nginx/

RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["init.sh"]
