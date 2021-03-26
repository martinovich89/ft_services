#!/bin/sh

eval $(minikube docker-env)

docker build -t telegraf srcs/telegraf
kubectl delete -f srcs/telegraf.yaml
kubectl create -f srcs/telegraf.yaml