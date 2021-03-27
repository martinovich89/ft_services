#!/bin/sh

# Create user allowed to access ftp server dir
adduser -D -h /srv/ftp mhenry
echo "mhenry:pw" | chpasswd
chown mhenry:pw /srv/ftp/

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf