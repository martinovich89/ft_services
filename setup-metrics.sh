#!/bin/sh

eval $(minikube docker-env)

docker build -t influxdb srcs/influxdb
docker build -t telegraf srcs/telegraf
docker build -t grafana srcs/grafana

kubectl delete -f srcs/influxdb.yaml
kubectl delete -f srcs/telegraf.yaml
kubectl delete -f srcs/grafana.yaml

kubectl create -f srcs/influxdb.yaml
kubectl create -f srcs/telegraf.yaml
kubectl create -f srcs/grafana.yaml
