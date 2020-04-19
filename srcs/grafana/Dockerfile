FROM alpine
 
RUN apk update && \
    apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache  && \
    mkdir -p /etc/grafana/provisioning/dashboards

COPY datasources.yml /usr/share/grafana/conf/provisioning/datasources/
COPY dashboard.yml /usr/share/grafana/conf/provisioning/dashboards/
COPY *.json /etc/grafana/provisioning/dashboards/

EXPOSE 3000

WORKDIR /usr/share/grafana

ENTRYPOINT /usr/sbin/grafana-server --config=/etc/grafana.ini