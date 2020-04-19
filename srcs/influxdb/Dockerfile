FROM alpine

RUN apk add --update influxdb 
    
EXPOSE 8086

ENTRYPOINT ["influxd", "run", "-config", "/etc/influxdb.conf"]
