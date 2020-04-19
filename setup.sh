#!/bin/bash

minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=1-35000 --cpus 2 --disk-size=10000mb --memory=2000mb

minikube addons enable ingress
minikube addons enable dashboard

eval $(minikube docker-env)

docker build -t image-nginx srcs/nginx
docker build -t image-grafana srcs/grafana
docker build -t image-influxdb srcs/influxdb
docker build -t image-telegraf srcs/telegraf
docker build -t image-ftps srcs/ftps
docker build -t image-mysql srcs/mysql
docker build -t image-phpmyadmin srcs/phpmyadmin
docker build -t image-wordpress srcs/wordpress

kubectl apply -k srcs/yaml

sleep 25

kubectl exec -i $(kubectl get pods | grep mysql | cut -d" " -f1) -- /bin/sh wp.sh
