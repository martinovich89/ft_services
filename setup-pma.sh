#!/bin/sh

eval $(minikube docker-env)

docker build -t phpmyadmin srcs/phpmyadmin
kubectl delete -f srcs/phpmyadmin.yaml
kubectl create -f srcs/phpmyadmin.yaml