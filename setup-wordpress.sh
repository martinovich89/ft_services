#!/bin/sh

eval $(minikube docker-env)

docker build -t wordpress srcs/wordpress
kubectl delete -f srcs/wordpress.yaml
kubectl create -f srcs/wordpress.yaml