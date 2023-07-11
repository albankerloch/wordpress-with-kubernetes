# Wordpress with Kubernetes

An Kubernetes cluster with all the services needed for a Wordpress website

Features:
- Nginx (port 443 and 80)
- Load Balancer (Ingress)
- Kubernetes web dashboard (Grafana on port 3000)
- MariaDb Database
- PhpMyAdmin (port 5000)
- SFTP server (port 21)
- Wordpress (port 5050)

## Installation

Launch the container with those commands : 

```bash
sudo docker-compose -up -d
```

(docker and docker-compose needed : https://docs.docker.com/engine/install/debian/ 
or https://docs.docker.com/desktop/install/windows-install/)

## Usage

- Open localhost on your web browser (port 3000, 5050, 5000, 80 or 443)
- Use the SFTP with Filezilla (172.17.0.2 / akerloc- / 123 / 21)
- Access the nginx container with ssh

Useful commands : 
```bash
ssh -i srcs/nginx/ssh/id_rsa -p 30022 "ak@172.17.0.2"
kubectl exec -it $(kubectl get pods | grep mysql | cut -d" " -f1) -- /bin/sh -c "kill 1"
kubectl exec -it $(kubectl get pods | grep mysql | cut -d" " -f1) -- /bin/sh -c "ps"
kubectl exec -it $(kubectl get pods | grep mysql | cut -d" " -f1) -- /bin/sh -c "kill number"
```

#### Author : Alban Kerloc'h
#### Category: DevSecOps
#### Tag: Dockerfile,Docker
