#!/bin/bash

minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000

minikube addons enable ingress

eval $(minikube docker-env)

docker build -t nginx-image srcs/nginx
docker build -t services/grafana srcs/grafana
docker build -t services/influxdb srcs/influxdb
docker build -t services/telegraf srcs/telegraf

kubectl apply -k srcs/yaml
