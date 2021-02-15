FROM alpine:3.12

RUN mkdir -p /usr/share/webapps
COPY phpmyadmin.tar.gz /usr/share/webapps

RUN  apk -U upgrade && \
	apk add --no-cache wget php7-fpm php7-mysqli php7-mbstring php7-json php7-session php-phar curl nginx openssl openssh openrc sudo \
	&& adduser -D -g 'www' www \
	&& mkdir /www \ 
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& ssh-keygen -A \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Lyon/L=Lyon/O=thallard/OU=42/CN=42.fr" \
	&& mkdir -p /usr/share/webapps/ \
	&& cd /usr/share/webapps/ \
	&& tar -xzvf phpmyadmin.tar.gz && rm phpmyadmin.tar.gz \
	&& mv phpMyAdmin-4.9.7-all-languages phpmyadmin 



RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# RUN tar xvfz phpmyadmin.tar.gz \
# 	&& mv phpMyAdmin-4.9.7-all-languages phpmyadmin \
# 	&& mv phpmyadmin /var/www/

EXPOSE 5000

CMD nginx -g 'pid /tmp/nginx.pid; daemon off;'
