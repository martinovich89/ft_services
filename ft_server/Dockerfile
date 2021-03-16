FROM debian

RUN apt update
RUN apt install -y nginx

COPY srcs/init.sh /usr/bin/
COPY srcs/index.html /tmp/
COPY srcs/nginx.conf /tmp/

RUN chmod 755 /usr/bin/init.sh

CMD ["init.sh"]