#!/bin/bash

minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000 --cpus 2 --disk-size=10000mb --memory=2000mb

minikube addons enable ingress

export IP_MINIKUBE=$(minikube ip)

eval $(minikube docker-env)

docker build -t nginx-image srcs/nginx
docker build -t telegraf-image srcs/telegraf
docker build -t influxdb-image srcs/influxdb
docker build -t grafana-image srcs/grafana
docker build -t ftps-image srcs/ftps

kubectl apply -k srcs/yaml
