FROM alpine:3.12

RUN apk update && apk add --no-cache influxdb

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache 
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8086

CMD (telegraf conf &) && influxd run -config /etc/influxdb.conf