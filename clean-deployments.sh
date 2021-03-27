#!/bin/sh

eval $(minikube docker-env)

kubectl delete -f srcs/nginx.yaml
kubectl delete -f srcs/mysql.yaml
kubectl delete -f srcs/ftps.yaml
kubectl delete -f srcs/wordpress.yaml
kubectl delete -f srcs/phpmyadmin.yaml
kubectl delete -f srcs/telegraf.yaml
kubectl delete -f srcs/influxdb.yaml
kubectl delete -f srcs/grafana.yaml
