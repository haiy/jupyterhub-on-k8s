# install minikube

### steps

[hello-minikube](https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/)
[docker commands](https://docs.docker.com/edge/engine/reference/commandline/docker/#child-commands)

-------

0 macOs install [virtualbox](https://www.virtualbox.org/wiki/Downloads)
1 install kubectl, download kubectl, minikube, [down site](https://github.com/kubernetes/minikube/releases)
3  chmod and cp

```
sudo chmod +x kubectl
sudo chmod +x minikube
sudo cp kubectl minikube /usr/local/bin
```
4 start and check minikube

```
minikube start --vm-driver=virtualbox
kubectl config use-context minikube
kubectl cluster-info
# open browser dashboard
minikube dashboard

# ready begin simple node app check
cd hell-node

#begin to build and test the simple node app 
# no need to push img to remote registry, so need to set local img env
# no need to push img to remote registry, so need to set local img env
eval $(minikube docker-env)
eval $(minikube docker-env)
```

### ref: https://kubernetes.io/docs/tasks/tools/install-minikube/

## k8s cmds info
================

### build.sh   
docker build -t hello-node:v1 .

### check_deploy.sh   
kubectl get deployments

### check_events.sh   
kubectl get events

### check_pods.sh   
kubectl get pods

### check_service.sh   
kubectl get services

### check.sh   
kubectl get deployments

### del_imgs.sh   
docker rmi hello-node:v1 hello-node:v2 -f

### del_minikube.sh   
minikube delete

### del_service.sh   
kubectl delete service hello-node
kubectl delete deployment hello-node

### deploy.sh   
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

