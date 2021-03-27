#!/bin/sh

openrc
touch /run/openrc/softlevel
rc-service influxdb start

sleep infinity
wait