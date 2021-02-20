#!/bin/bash

# List of the services, comment the ones you don't want to run
services=(        \
    mysql        \
    wordpress    \
    phpmyadmin    \
    nginx        \
    # ftps        \
    # influxdb    \
    # telegraf    \
    # grafana        \
)

# Images source directory
srcs='.'
    
# Build images
for service in "${services[@]}"
  do
    # Build Docker images
    docker build -t ${service}_img $srcs/$service
  done