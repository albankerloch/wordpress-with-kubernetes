FROM alpine

RUN apk add --update influxdb 
    
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8086

ENTRYPOINT sh /entrypoint.sh
