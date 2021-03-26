#!/bin/sh

eval $(minikube docker-env)

docker build -t grafana srcs/grafana
kubectl delete -f srcs/grafana.yaml
kubectl create -f srcs/grafana.yaml
