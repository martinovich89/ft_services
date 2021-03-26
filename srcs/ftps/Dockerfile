FROM alpine:latest

RUN apk update && apk add \
    vsftpd \
    openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=75/L=PARIS/O=42/OU=mhenry/CN=ft_services" \
    -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY srcs/launch.sh /root

RUN mkdir -p /srv/ftp/ \
&&  touch /srv/ftp/file \
&&  echo "Bonjour les gens" > /srv/ftp/file

EXPOSE 20 21 21001

CMD ["/bin/sh", "/root/launch.sh"]
