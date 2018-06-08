### basic

cmds cheat sheet: <https://kubernetes.io/docs/reference/kubectl/cheatsheet/>

kubectl get - list resources
kubectl describe - show detailed information about a resource
kubectl logs - print the logs from a container in a pod
kubectl exec - execute a command on a container in a pod

### 创建一个k8s服务并暴露给外部服务使用

k8s的deployment只是创建了一个对k8集群内可见的服务，那么要将服务真正暴露给外部系统使用的话，实际
上还需要一步，端口暴露给node主机上的端口。那么端口暴露的方式有三种: 直接转发,load balancer,service。
下面就以一个简单的样例来走下流程:

#### 1 server.js

```js
var http = require('http');

var handleRequest = function(request, response) {
      console.log('Received request for URL: ' + request.url);
        response.writeHead(200);
          response.end('Hello World!');
};
var www = http.createServer(handleRequest);
www.listen(8080);
```

#### 2 Dockerfile

```dockerfile
FROM node:6.9.2
EXPOSE 8080
COPY server.js .
CMD node server.js
```

#### 3 deploy and expose

* normal

```bash
docker build -t hello-node .
kubectl run hello-node --image=hello-node:v1 --port=8080
kubectl expose deployment hello-node --type=LoadBalancer

#第二种暴露端口方法
#kubectl expose deployment hello-node --port=8080 --target-port=9376
```


#### 4 check and test

```bash
# check detail
hss@ubuntu:$ kubectl describe pods hello-node --namespace=default
Name:           hello-node-658d8f6754-947rj
Namespace:      default
Node:           ubuntu/192.168.1.106
Start Time:     Fri, 20 Apr 2018 17:21:08 +0800
Labels:         pod-template-hash=2148492310
                run=hello-node
Annotations:    <none>
Status:         Running
IP:             10.244.0.27
....

# general info
kubectl get pods -l run=hello-node -o wide

# check container log
$kubectl logs -l run=hello-node
Received request for URL: /
Received request for URL: /

# check service info
$ kubectl get services -l run=hello-node
NAME              TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
example-service   NodePort       10.99.202.100   <none>        8080:31446/TCP   37m
hello-node        LoadBalancer   10.103.52.224   <pending>     8080:30364/TCP   2d 

# curl hello
$curl http://127.0.0.1:31446
Hello World!

# shell to running container

doc: https://kubernetes.io/docs/tasks/debug-application-cluster/get-shell-running-container/

kubectl exec -it hello-node-xxxx -- /bin/bash

```

#### 5 update image and other configurations

doc: https://kubernetes.io/docs/tasks/run-application/rolling-update-replication-controller/

```bash
# kubectl rolling-update NAME [NEW_NAME] --image=IMAGE:TAG
$ kubectl rolling-update hello-node --image=hello-node:v2

# 如果报错，手动调整配置中的镜像
kubectl edit deployment hello-node
```


#### 6 destory deployment and service

```bash
kubectl delete service hello-node
kubectl delete pods hello-node-658d8f6754-947rj

#force
kubectl delete pods hello-node-658d8f6754-947rj --grace-period=0
```


