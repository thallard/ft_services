FROM alpine:3.12

RUN apk update && apk add --no-cache \
	wget sudo nginx openssl openssh \
	&& adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& ssh-keygen -A \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Lyon/L=Lyon/O=thallard/OU=42/CN=42.fr"

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache 
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 80 443

CMD (telegraf conf &) && nginx -g 'pid /tmp/nginx.pid; daemon off;'
