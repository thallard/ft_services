FROM alpine:3.12

RUN  apk update && apk add --no-cache \
	wget \
	php \
	php-cli \
	php-cgi \
	php-mbstring \
	php-fpm \
	php-json \
	sudo \
	openssl \
	openssh

COPY phpmyadmin.tar.gz .

RUN tar xvfz phpmyadmin.tar.gz  >/dev/null \
	&& mv phpMyAdmin-4.9.7-all-languages phpmyadmin \
	&& mv phpmyadmin /var/www/

CMD sleep infinity