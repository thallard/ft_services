GREENB='\033[1;32m'
BLANK='\033[0m'
export MINIKUBE_HOME=/Users/thallard/goinfre

minikube delete
minikube start --driver=virtualbox
eval $(minikube docker-env)
IP_MINIKUBE=$(minikube ip)


# Sed original files for applying minikube IP
sed -e "s/IP_S/$IP_MINIKUBE/g;s/IP_E/$IP_MINIKUBE/g" srcs/metallb/config.txt > srcs/metallb/metallb.yaml
sed -e "s/IP/$IP_MINIKUBE/g" srcs/wordpress/original_create_wp > srcs/wordpress/create_wp.sh

# MetalLB part
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml >> last.log
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml >> last.log
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" >> last.log
kubectl apply -f srcs/metallb/. >> last.log

# InfluxDB
docker build -t influxdb-image srcs/influxdb 1>/dev/null
kubectl apply -f srcs/influxdb/influxdb.yaml 1>/dev/null
printf "${GREENB}Creating InfluxDB image and container.\n${BLANK}"

# MySQL container
docker build -t mysql-image srcs/mysql 1>/dev/null
kubectl apply -f srcs/mysql/mysql.yaml 1>/dev/null
printf "${GREENB}Creating MySQL image and container.\n${BLANK}"

# Nginx main
docker build -t nginx-image srcs/nginx/ 1>/dev/null
kubectl apply -f srcs/nginx/nginx.yaml 1>/dev/null
printf "${GREENB}Creating NGINX image and container.\n${BLANK}"

# Wordpress
docker build -t wordpress-image srcs/wordpress 1>/dev/null
kubectl apply -f srcs/wordpress/wordpress.yaml 1>/dev/null
printf "${GREENB}Creating Wordpress image and container.\n${BLANK}"

# PHPMyAdmin
docker build -t phpmyadmin-image srcs/phpmyadmin 1>/dev/null
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml 1>/dev/null
printf "${GREENB}Creating PHPMyAdmin image and container.\n${BLANK}"

# Launch dashboard
minikube dashboard
