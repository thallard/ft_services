FROM alpine:3.12

RUN  apk update && apk add mysql \
	 wget \
	 php \
	 php-cli \
	 php-cgi \
	 php-mbstring \
	 php-fpm \
	 php-json \
	 sudo \
	 nginx


COPY . .

RUN chmod 777 setup.sh

EXPOSE 80
EXPOSE 443

CMD ["sh", "setup.sh"]