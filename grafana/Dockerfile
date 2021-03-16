FROM alpine:latest

RUN apk update && apk add --no-cache libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.2.0.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.2.0.linux-amd64.tar.gz

COPY srcs/init.sh /usr/local/bin/
COPY ./srcs/telegraf_provisioning.yaml /grafana-7.2.0/conf/provisioning/datasources/
COPY ./srcs/dash_provisioning.yaml /grafana-7.2.0/conf/provisioning/dashboards/
COPY ./srcs/dashboard.json /grafana-7.2.0/data/
COPY ./srcs/dashboard_refresh_5s.json /grafana-7.2.0/data/

RUN chmod +x /usr/local/bin/init.sh

CMD ["init.sh"]