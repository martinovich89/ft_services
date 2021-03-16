FROM alpine:latest

RUN apk update \
&& apk add openrc mysql mysql-client --no-cache 

COPY srcs/init.sh /usr/local/bin/
COPY srcs/my.cnf /etc/mysql/

RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["init.sh"]