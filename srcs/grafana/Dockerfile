FROM alpine:latest

RUN apk update && apk add --no-cache \
	wget \
	libc6-compat

ENV PATH=/usr/share/grafana/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir /usr/share/grafana \
&&	wget -nv https://dl.grafana.com/oss/release/grafana-7.4.1.linux-amd64.tar.gz \
&&	tar -xf grafana-7.4.1.linux-amd64.tar.gz --strip-components=1 -C /usr/share/grafana \
&&	rm grafana-7.4.1.linux-amd64.tar.gz

WORKDIR "/usr/share/grafana"

COPY srcs/datasources.yaml conf/provisioning/datasources/
COPY srcs/dashboards.yaml conf/provisioning/dashboards/
COPY srcs/dashboard.json conf/provisioning/dashboards/

EXPOSE 3000

CMD grafana-server