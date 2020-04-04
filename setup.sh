#!/bin/bash

minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
eval $(minikube docker-env)

docker build -t nginxalban srcs/nginx
docker build -t mysqlalban srcs/mysql
docker build -t wordpressalban srcs/wordpress
docker build -t phpmyadminalban srcs/phpmyadmin

docker build -t services/grafana srcs/grafana
docker build -t services/influxdb srcs/influxdb
docker build -t services/telegraf srcs/telegraf

kubectl apply -f srcs/mysql-pv-claim.yaml
kubectl apply -f srcs/mysql-pv-volume.yaml
kubectl apply -f srcs/wp-pv-claim.yaml
kubectl apply -f srcs/wp-pv-volume.yaml
kubectl apply -f srcs/influxdb-pv-claim.yaml

kubectl apply -f srcs/deployment-nginx.yaml
kubectl apply -f srcs/deployment-mysql.yaml
kubectl apply -f srcs/deployment-wordpress.yaml
kubectl apply -f srcs/deployment-phpmyadmin.yaml

kubectl apply -f srcs/grafana.yaml
kubectl apply -f srcs/telegraf.yaml
kubectl apply -f srcs/influxdb.yaml
kubectl apply -f srcs/service-nginx.yaml
kubectl apply -f srcs/service-mysql.yaml
kubectl apply -f srcs/service-wordpress2.yaml
kubectl apply -f srcs/service-phpmyadmin2.yaml
sleep 1
echo -ne "\033[1;32m+>\033[0;33m Test \n"
kubectl exec -i $(kubectl get pods | grep mysql | cut -d" " -f1) -- mysql -u root -e 'CREATE DATABASE wordpress;'
kubectl exec -i $(kubectl get pods | grep mysql | cut -d" " -f1) -- mysql wordpress -u root < ./srcs/mysql/wordpress.sql
