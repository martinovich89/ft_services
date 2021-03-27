FROM alpine:latest

RUN apk update && apk add \
    openrc \
    influxdb

COPY srcs/launch.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/launch.sh

EXPOSE 8086

ENTRYPOINT ["launch.sh"]
