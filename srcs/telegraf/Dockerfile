FROM telegraf:alpine

COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY entrypoint.sh /entrypoint.sh

EXPOSE 4999

ENTRYPOINT ./entrypoint.sh
