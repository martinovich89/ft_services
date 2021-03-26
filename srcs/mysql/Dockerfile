FROM alpine:latest

RUN apk update && apk add --no-cache \
    mariadb \
    mariadb-client \
    openrc

COPY srcs/livenessprobe.sh /
COPY srcs/mariadb-server.cnf /etc/my.cnf.d/
COPY srcs/launch.sh /usr/local/bin/
COPY srcs/wordpress.sql /

RUN mkdir -p /run/mysqld \
&&  chmod +x /usr/local/bin/launch.sh

EXPOSE 3306

ENTRYPOINT ["launch.sh"]