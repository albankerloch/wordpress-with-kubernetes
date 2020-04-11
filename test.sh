#!/bin/bash

export IP_MINIKUBE=$(minikube ip)

cp srcs/yaml/config/template-telegraf.conf srcs/yaml/config/telegraf.conf

kubectl apply -f srcs/yaml/nginx-deployment.yaml
kubectl apply -f srcs/yaml/nginx-service.yaml
