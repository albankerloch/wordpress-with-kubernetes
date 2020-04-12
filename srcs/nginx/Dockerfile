FROM nginx:alpine

RUN apk add --update openssl openssh && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=ak' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

COPY ssh/sshd_config /etc/ssh/sshd_config
COPY ssh/id_rsa.pub /etc/ssh/ssh_host_dsa_key
COPY ssh/id_rsa /etc/ssh/ssh_host_rsa_key
RUN chmod 600 /etc/ssh/ssh_host_*

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

EXPOSE 30022 80 443

ENTRYPOINT sh /entrypoint.sh
