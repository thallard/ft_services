
minikube delete
minikube start --driver=virtualbox
eval $(minikube docker-env)
IP_MINIKUBE=$(minikube ip)
sed -e "s/IP_S/$IP_MINIKUBE/g;s/IP_E/$IP_MINIKUBE/g" srcs/metallb/config.txt > srcs/metallb/metallb.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml >> last.log
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml >> last.log
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" >> last.log
	kubectl apply -f srcs/metallb/. >> last.log

docker build -t nginx-image srcs/nginx/
kubectl apply -f srcs/config.yaml
minikube dashboard
