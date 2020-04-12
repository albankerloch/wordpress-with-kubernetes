FROM alpine:3.11
USER root
RUN apk upgrade
RUN apk add openrc
RUN apk add mysql mysql-client --no-cache
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /run/mysqld
RUN cp -rp /var/run/mysqld /var/run/mysqld.bak
RUN openrc
RUN touch /run/openrc/softlevel
COPY start.sh /tmp/start.sh
COPY my.cnf /etc/mysql/my.cnf
VOLUME ["/var/lib/mysql"]
EXPOSE 3306
ENTRYPOINT sh tmp/start.sh