FROM alpine

USER root

RUN apk upgrade && \
    apk add mysql mysql-client --no-cache && \
    mkdir -p /run/mysqld  && \
    cp -rp /var/run/mysqld /var/run/mysqld.bak

COPY my.cnf /etc/mysql/my.cnf

COPY wordpress.sql /wordpress.sql

COPY wp.sh /wp.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT sh /entrypoint.sh

EXPOSE 3306
