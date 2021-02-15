FROM alpine:3.12

RUN apk -U upgrade && \
	apk add --no-cache \
	wget \
	php7-fpm php7-mysqli php7-mbstring php7-json php7-session php-phar curl nginx openssl openssh openrc sudo \
	&& adduser -D -g 'www' www \
	&& mkdir /www \ 
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& ssh-keygen -A \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/selfsigned.key -out /etc/ssl/certs/selfsigned.crt -subj "/C=FR/ST=Lyon/L=Lyon/O=thallard/OU=42/CN=42.fr" \
	&& mkdir -p /usr/share/webapps/ \
	&& cd /usr/share/webapps/ \
	&& wget http://wordpress.org/latest.tar.gz >/dev/null\
	&& tar -xzvf latest.tar.gz >/dev/null && rm latest.tar.gz \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp


COPY latest.tar.gz .
COPY wp-config.php .
COPY create_wp.sh .
COPY loop.sh .

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY wp-config.php /usr/share/webapps/wordpress/wp-config.php
RUN chmod +x loop.sh
RUN chmod +x create_wp.sh
# RUN rm /etc/nginx/conf.d/default.conf
# COPY default.conf /etc/nginx/conf.d/default.conf


# RUN tar xvfz latest.tar.gz \
# 	&& mv wordpress/* /var/www/ \
# 	&& rm /var/www/html/wp-config-sample.php \
# 	&&cp wp-config.php /var/www/

EXPOSE 5050

CMD sh create_wp.sh
