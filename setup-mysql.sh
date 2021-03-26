#!/bin/sh

eval $(minikube docker-env)

docker build -t mysql srcs/mysql
kubectl delete -f srcs/mysql.yaml
kubectl create -f srcs/mysql.yaml