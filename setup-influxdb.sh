#!/bin/sh

eval $(minikube docker-env)

docker build -t influxdb srcs/influxdb
kubectl delete -f srcs/influxdb.yaml
kubectl create -f srcs/influxdb.yaml
