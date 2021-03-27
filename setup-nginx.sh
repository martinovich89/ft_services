#!/bin/sh

eval $(minikube docker-env)

docker build -t nginx srcs/nginx/
kubectl delete -f srcs/nginx.yaml
kubectl create -f srcs/nginx.yaml