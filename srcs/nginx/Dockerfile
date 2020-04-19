FROM alpine

USER root

RUN apk add --update openssl openssh nginx && \
    mkdir -p var/run/nginx && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=ak' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt && \
    mkdir -p /usr/share/nginx/html

COPY ssh/sshd_config /etc/ssh/sshd_config
COPY ssh/id_dsa /etc/ssh/ssh_host_dsa_key
COPY ssh/id_rsa /etc/ssh/ssh_host_rsa_key
RUN chmod 600 /etc/ssh/ssh_host_*

COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

EXPOSE 30022 80 443

ENTRYPOINT sh /entrypoint.sh
