FROM alpine

RUN apk update && apk add --no-cache --upgrade bash \
&& apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-6.6.0.linux-amd64.tar.gz \
&& tar -zxvf grafana-6.6.0.linux-amd64.tar.gz \
&& rm /grafana-6.6.0/conf/defaults.ini \
&& rm -rf /var/cache/apk/* 	

RUN mkdir -p /etc/grafana/provisioning/dashboards

COPY datasources.yml /etc/grafana/provisioning/datasources/
COPY dashboard.yml /etc/grafana/provisioning/dashboards/
COPY *.json /etc/grafana/provisioning/dashboards/

EXPOSE 3000

ENTRYPOINT /usr/sbin/grafana-server --config=/etc/grafana.ini
