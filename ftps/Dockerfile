FROM alpine:latest

RUN apk update \
&& apk add openrc vsftpd openssl

COPY srcs/init.sh /usr/local/bin/
COPY srcs/vsftpd.conf /etc/vsftpd/

RUN chmod +x /usr/local/bin/init.sh

VOLUME [“/sys/fs/cgroup”]

ENTRYPOINT ["init.sh"]