FROM alpine:latest

RUN apk upgrade && \
    apk update && \
    apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache && \
    rm -rf /var/cache/apk/*

COPY files/pure-ftpd.pem /etc/ssl/private/
COPY scripts/start.sh /bin/start-tmp.sh

ENTRYPOINT ["/bin/start-tmp.sh"]
