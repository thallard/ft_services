
rm -rf /etc/nginx/sites-enabled/default
cp nginx.conf /etc/nginx/sites-enabled/

nginx -g 'pid /tmp/nginx.pid; daemon off;'

tail -f /var/log/nginx/access.log /var/log/nginx/error.log
