#!/bin/sh

openrc
touch /run/openrc/softlevel
rc-service influxdb start
sleep 3

#UP=$(pgrep influx | wc -l);
#while [ "$UP" -ne 1 ];
#do
#        sleep 3
#        UP=$(pgrep mariadb | wc -l);
#done

influx << EOF
CREATE DATABASE influxdatabase;
CREATE USER admin WITH PASSWORD 'admin' WITH ALL PRIVILEGES;
GRANT ALL ON influxdatabase TO admin;
EOF

sleep infinity
wait