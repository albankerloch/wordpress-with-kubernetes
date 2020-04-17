#!/bin/bash

export MINI_IP=$(minikube ip)

cp srcs/mysql/template_wordpress.sql srcs/mysql/wordpress.sql
sed -i s/__MINI_IP__/$(minikube ip)/g srcs/mysql/wordpress.sql
