# k8s
====

## 1 concepts

doc https://kubernetes.io/docs/concepts/

**核心概念**

- components: https://kubernetes.io/docs/concepts/overview/components/

### master

- kube-apiserver 
- etcd 集群所有配置数据
- kube-scheduler
- kube-controller-manager(node, replication, endpoint, service account)

### node

- kubelet
- kube-proxy

### objects

在k8s里面，API里描述的所有的对象都可以以yaml的形式表示的。每个yaml或者object都有两个信息spec和staus。
spec里面是期望状态，status是实际状态。
举例来说，Deployment表示的就是运行在k8s上的服务。spec里面就描述里期望的启动方式。
k8s会读取Deployment的spec并作响应的启动。status就会记录k8s操作的结果情况。

### namespace and DNS

每创建一个ns的时候都会新增一个类似<service-name>.<namespace-name>.svc.cluster.local的DNS entry。
当直接用<service-name>来访问应用时，默认就是当前的namespace。这样的好处很明显就是同样的配置可以用ns
来作预发线上等环境隔离。跨ns访问的话就用完整的名字。

### pod

- a running process on your cluster
- ip,pvc,存储对pod内container都是共享的


### deployment，最常用的controller

## most 常用命令

### Pod 创建,删除



