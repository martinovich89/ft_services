#!/bin/sh

eval $(minikube docker-env)

docker build -t ftps ./srcs/ftps/
kubectl delete -f srcs/ftps.yaml
kubectl create -f srcs/ftps.yaml