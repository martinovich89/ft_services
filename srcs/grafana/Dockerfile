FROM alpine:latest

RUN apk update && apk add --no-cache \
	wget \
	libc6-compat

# Create grafana dir and make it current
WORKDIR "/usr/share/grafana"

# Install grafana
RUN	wget -nv https://dl.grafana.com/oss/release/grafana-7.4.1.linux-amd64.tar.gz \
&&	tar -xf grafana-7.4.1.linux-amd64.tar.gz --strip-components=1 \
&&	rm grafana-7.4.1.linux-amd64.tar.gz

# Make grafana-server executable with PATH env variable
ENV PATH=/usr/share/grafana/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Provisioning
COPY srcs/datasources.yaml conf/provisioning/datasources/
COPY srcs/dashboards.yaml conf/provisioning/dashboards/
COPY srcs/dashboard.json conf/provisioning/dashboards/

EXPOSE 3000

ENTRYPOINT grafana-server