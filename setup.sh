#!/bin/sh

minikube delete

minikube start --driver=docker --cpus=4 --memory=3000

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/metalLB.yaml

eval $(minikube docker-env)

docker build -t nginx ./srcs/nginx
docker build -t ftps ./srcs/ftps
docker build -t mysql ./srcs/mysql
docker build -t wordpress ./srcs/wordpress
docker build -t phpmyadmin ./srcs/phpmyadmin
docker build -t influxdb ./srcs/influxdb
docker build -t telegraf ./srcs/telegraf
docker build -t grafana ./srcs/grafana

kubectl create -f ./srcs/nginx.yaml
kubectl create -f ./srcs/mysql.yaml
kubectl create -f ./srcs/wordpress.yaml
kubectl create -f ./srcs/ftps.yaml
kubectl create -f ./srcs/phpmyadmin.yaml
kubectl create -f ./srcs/influxdb.yaml
kubectl create -f ./srcs/telegraf.yaml
kubectl create -f ./srcs/grafana.yaml


minikube dashboard