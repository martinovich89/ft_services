FROM alpine:latest

# Installation
RUN apk update && apk add openrc influxdb --no-cache

RUN mkdir -p /etc/influxdb
RUN mkdir -p /var/lib/influxdb
RUN chown influxdb:influxdb /etc/influxdb/
RUN chown influxdb:influxdb /var/lib/influxdb

# Copy init files
COPY srcs/init.sh /usr/local/bin/
COPY srcs/influxdb.conf /etc/influxdb/influxdb.conf

RUN chmod +x /usr/local/bin/init.sh

EXPOSE 8086

ENTRYPOINT ["init.sh"]