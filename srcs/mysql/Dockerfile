FROM alpine:3.12

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
