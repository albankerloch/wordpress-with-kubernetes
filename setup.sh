#!/bin/bash

minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000

minikube addons enable ingress

eval $(minikube docker-env)

docker build -t nginx-image srcs/nginx

kubectl apply -k srcs/yaml
