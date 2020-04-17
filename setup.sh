#!/bin/bash

minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=1-35000 --cpus 2 --disk-size=10000mb --memory=2000mb

minikube addons enable ingress
minikube addons enable dashboard

cp srcs/mysql/template_wordpress.sql srcs/mysql/wordpress.sql
sed -i s/__MINI_IP__/$(minikube ip)/g srcs/mysql/wordpress.sql

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

sleep 30

kubectl exec -i $(kubectl get pods | grep mysql | cut -d" " -f1) -- mysql -u root -e 'CREATE DATABASE wordpress;'
kubectl exec -i $(kubectl get pods | grep mysql | cut -d" " -f1) -- mysql wordpress -u root < ./srcs/mysql/wordpress.sql
