#!/bin/sh

mkdir /srv/ftp
chown nobody:nogroup /srv/ftp
echo 'anon' > /srv/ftp/anon.txt

adduser -D -h /srv/ftp mhenry
echo 'mhenry:pw' | chpasswd

openssl req -x509 -newkey rsa:2048 -nodes -keyout /etc/ssl/private/vsftpd.key \
            -out /etc/ssl/certs/vsftpd.crt -days 365 \
            -subj '/C=FR/ST=75/L=Paris/O=42/OU=mhenry/CN=ft_services'


openrc
touch run/openrc/softlevel
rc-service vsftpd start &

/bin/sh