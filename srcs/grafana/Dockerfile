FROM alpine:3.12


RUN apk -U upgrade && apk add --no-cache openrc \
    grafana --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache 

COPY grafana.db /usr/share/grafana/data/grafana.db
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3000

CMD (telegraf conf &) && grafana-server --homepath "/usr/share/grafana" start