#!/bin/sh
wp core install --url=https://192.168.99.253:5050 --title=supertropcool --admin_user=admin --admin_password=admin --admin_email=rdm@email.com --path='/usr/share/webapps/wordpress/' --skip-email
while [ $? -ne 0 ] ; do
    wp core install --url=https://192.168.99.253:5050 --title=supertropcool --admin_user=admin --admin_password=admin --admin_email=rdm@email.com --path='/usr/share/webapps/wordpress/' --skip-email
done
wp core install --url=https://192.168.99.253:5050 --title=supertropcool --admin_user=admin --admin_password=admin --admin_email=rdm@email.com --path='/usr/share/webapps/wordpress/' --skip-email
php-fpm7  && (sh loop.sh &) && nginx -g 'pid /tmp/nginx.pid; daemon off;'
