#!/bin/sh
wp core install --url=https://192.168.99.252:5050 --title=supertropcool --admin_user=admin --admin_password=admin --admin_email=rdm@email.com --path='/usr/share/webapps/wordpress/' --skip-email
while [ $? -ne 0 ] ; do
    wp core install --url=https://192.168.99.252:5050 --title=supertropcool --admin_user=admin --admin_password=admin --admin_email=rdm@email.com --path='/usr/share/webapps/wordpress/' --skip-email
done
wp core install --url=https://192.168.99.252:5050 --title=supertropcool --admin_user=admin --admin_password=admin --admin_email=rdm@email.com --path='/usr/share/webapps/wordpress/' --skip-email
wp user create bob bob@example.com --path='/usr/share/webapps/wordpress/' --role=author
php-fpm7  && (sh loop.sh &) && nginx -g 'pid /tmp/nginx.pid; daemon off;'
