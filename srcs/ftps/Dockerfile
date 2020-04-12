FROM alpine

RUN apk upgrade && \
    apk update && \
    apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache && \
    rm -rf /var/cache/apk/*

COPY pure-ftpd.pem /etc/ssl/private/
COPY entrypoint.sh /entrypoint.sh

EXPOSE 21 21000

ENTRYPOINT sh entrypoint.sh
