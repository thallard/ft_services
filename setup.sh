GREENB='\033[1;32m'
BLANK='\033[0m'
export MINIKUBE_HOME=/Users/thallard/goinfre

minikube delete
minikube start --driver=virtualbox
eval $(minikube docker-env)
IP_MINIKUBE=$(minikube ip)

# Sed original files for applying minikube IP
sed -e "s/IP_START/$IP_MINIKUBE/g;s/IP_END/$IP_MINIKUBE/g" srcs/original_before_changes/config.txt > srcs/metallb/metallb.yaml
sed -e "s/IP/$IP_MINIKUBE/g" srcs/original_before_changes/original_create_wp > srcs/wordpress/create_wp.sh
sed -e "s/CHANGEIP/$IP_MINIKUBE/g" srcs/original_before_changes/original_Dockerfile > srcs/ftps/Dockerfile

# MetalLB part + Volumes saves
echo -n > traces.log
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml >> traces.log
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml >> traces.log
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" >> traces.log
kubectl apply -f srcs/metallb/. >> traces.log

# InfluxDB
printf "${GREENB}Creating InfluxDB image and container.\n${BLANK}"
docker build -t influxdb-image srcs/influxdb 1>/dev/null
kubectl apply -f srcs/influxdb/influxdb.yaml 1>/dev/null

# MySQL container
printf "${GREENB}Creating MySQL image and container.\n${BLANK}"
docker build -t mysql-image srcs/mysql 1>/dev/null
kubectl apply -f srcs/mysql/mysql.yaml 1>/dev/null

# Nginx main
printf "${GREENB}Creating NGINX image and container.\n${BLANK}"
docker build -t nginx-image srcs/nginx/ 1>/dev/null
kubectl apply -f srcs/nginx/nginx.yaml 1>/dev/null

# Wordpress
printf "${GREENB}Creating Wordpress image and container.\n${BLANK}"
docker build -t wordpress-image srcs/wordpress 1>/dev/null
kubectl apply -f srcs/wordpress/wordpress.yaml 1>/dev/null

# PHPMyAdmin
printf "${GREENB}Creating PHPMyAdmin image and container.\n${BLANK}"
docker build -t phpmyadmin-image srcs/phpmyadmin 1>/dev/null
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml 1>/dev/null

# Grafana
printf "${GREENB}Creating Grafana image and container.\n${BLANK}"
docker build -t grafana-image srcs/grafana 1>/dev/null
kubectl apply -f srcs/grafana/grafana.yaml 1>/dev/null

# FTPS
printf "${GREENB}Creating FTPS image and container.\n${BLANK}"
docker build -t ftps-image srcs/ftps 1>/dev/null
kubectl apply -f srcs/ftps/ftps.yaml 1>/dev/null

# Launch dashboard
minikube dashboard
