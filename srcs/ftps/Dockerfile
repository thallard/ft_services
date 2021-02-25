FROM alpine:3.12

RUN apk -U upgrade && apk add --no-cache openrc openssl \
pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache \
&& adduser -D -g 'admin' admin \
&& echo "admin:admin" | chpasswd \
&& echo "If you see this message, that's a good new" > /home/admin/logs.txt

RUN mkdir -p /etc/ssl/private \
&& chmod 777 /etc/ssl/private \
&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \-keyout /etc/ssl/private/pure-ftpd.pem \-out /etc/ssl/private/pure-ftpd.pem \-subj "/C=FR/ST=Lyon/L=Lyon/O=thallard/OU=42/CN=42.fr" \
&& chmod 600 /etc/ssl/private/pure-ftpd.pem 

RUN mkdir -p /run/openrc/ && touch /run/openrc/softlevel \
	&& touch /run/openrc/softlevel

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 21

CMD (telegraf conf &) && /usr/sbin/pure-ftpd -Y 2 -p 30000:30009 -P 192.168.99.253
