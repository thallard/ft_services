FROM alpine:3.12


RUN apk -U upgrade && apk add --no-cache openrc \
    grafana --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

EXPOSE 3000

CMD grafana-server --homepath "/usr/share/grafana" start