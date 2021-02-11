FROM alpine:3.12

RUN apk update && apk add --no-cache \
	mysql \
	mysql-client 

COPY database.sql .

EXPOSE 3306

CMD mysql < database.sql