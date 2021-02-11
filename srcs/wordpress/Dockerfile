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
	 openssl \
	 nginx \
	 openssh \
	&& adduser -D -g 'www' www \
	&& mkdir /www \ 
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& rm -rf /etc/nginx/nginx.conf \
	&& ssh-keygen -A \
	 && ssh-keygen -A \
	 && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Lyon/L=Lyon/O=thallard/OU=42/CN=42.fr"


COPY latest.tar.gz .
COPY wp-config.php .

RUN tar xvfz latest.tar.gz >/dev/null \
	&& mv wordpress/* /var/www/ \
	&& rm /var/www/wp-config-sample.php \
	&& cp wp-config.php /var/www/ 

EXPOSE 5050

CMD sleep infinity
