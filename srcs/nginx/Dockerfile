FROM alpine:latest

RUN apk update && apk add --no-cache \
    nginx \
    openssl

COPY srcs/launch.sh /usr/local/bin/
COPY srcs/default.conf /etc/nginx/conf.d
COPY srcs/index.html /var/www/

RUN mkdir /etc/nginx/ssl \
&&  openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=75/L=PARIS/O=42/OU=mhenry/CN=ft_services" \
    -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

# Make nginx and script accessible
RUN chmod +x /usr/local/bin/launch.sh \
&&  mkdir -p /run/nginx

EXPOSE 80 443

ENTRYPOINT ["launch.sh"]
