#!/bin/bash

minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
eval $(minikube docker-env)

docker build -t nginxalban srcs/nginx

kubectl apply -k srcs/yaml
