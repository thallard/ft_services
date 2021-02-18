FROM alpine:3.12

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN apk update && apk add --no-cache \
	mysql \
	mysql-client \
	openrc \
	rm -f /var/cache/apk/*

COPY config /etc/my.cnf.d/mariadb-server.cnf
COPY database.sh .

RUN chmod +x database.sh

EXPOSE 3306

CMD sh database.sh
