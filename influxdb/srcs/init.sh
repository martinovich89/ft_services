#!/bin/sh

openrc default
rc-update add influxdb default
#rc-service influxdb start 2> /dev/NULL
#sleep 5
#influx -execute "CREATE DATABASE telegraf"
#influx -execute "CREATE USER mhenry WITH PASSWORD 'pw'"
#influx -execute "GRANT ALL ON telegraf TO mhenry"
#influx -execute "CREATE RETENTION POLICY one_week ON telegraf DURATION 168h REPLICATION 1 DEFAULT"
#influx -execute "SHOW DATABASES"
influxd &

/bin/sh