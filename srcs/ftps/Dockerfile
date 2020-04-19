FROM alpine

RUN apk upgrade && \
    apk update && \
    apk add openssl pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=ak' -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem && \
    rm -rf /var/cache/apk/* && \
    chmod 600 /etc/ssl/private/pure-ftpd.pem

COPY entrypoint.sh /entrypoint.sh

EXPOSE 21 21000

ENTRYPOINT sh entrypoint.sh
