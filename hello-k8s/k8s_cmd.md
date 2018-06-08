## k8s cmds info
================
### build.sh   
docker build -t hello-node:v1 .
docker rmi hello-node:v1 hello-node:v2 -f

kubectl get deployments
kubectl get events
kubectl get pods
kubectl get services 
kubectl get svc

kubectl delete service,deployment hello-node

kubectl run hello-node --image=hello-node:v1 --port=8080

### expose_service.sh   
kubectl expose deployment hello-node --type=LoadBalancer

### start_mini.sh   
minikube start

### start_service.sh   
minikube service hello-node

### stop_minikube.sh   
minikube stop
eval $(minikube docker-env -u)

### view_k8s_conf.sh   
kubectl config view

