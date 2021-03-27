FROM alpine

RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf

COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY srcs/launch.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/launch.sh

EXPOSE 8125

ENTRYPOINT ["launch.sh"]