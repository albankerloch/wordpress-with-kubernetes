FROM alpine
 
USER root

COPY srcs/install.sh /tmp/install.sh

RUN sh /tmp/install.sh && rm -f /tmp/install.sh
COPY datasources.yml /usr/share/grafana/conf/provisioning/datasources/
COPY dashboard.yml /usr/share/grafana/conf/provisioning/dashboards/
COPY *.json /usr/share/grafana/provisioning/dashboards/

EXPOSE 3000

WORKDIR /usr/share/grafana

ENTRYPOINT /etc/init.d/telegraf start; /usr/sbin/grafana-server --config=/etc/grafana.ini
