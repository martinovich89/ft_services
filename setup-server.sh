#!/bin/sh

eval $(minikube docker-env)

docker build -t nginx srcs/nginx
docker build -t phpmyadmin srcs/phpmyadmin
docker build -t mysql srcs/mysql
docker build -t wordpress srcs/wordpress

kubectl delete -f srcs/nginx.yaml
kubectl delete -f srcs/phpmyadmin.yaml
kubectl delete -f srcs/mysql.yaml
kubectl delete -f srcs/wordpress.yaml

kubectl create -f srcs/nginx.yaml
kubectl create -f srcs/phpmyadmin.yaml
kubectl create -f srcs/mysql.yaml
kubectl create -f srcs/wordpress.yaml
