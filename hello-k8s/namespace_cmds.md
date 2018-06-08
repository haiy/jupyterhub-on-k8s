## namespace operation cmds

### namespace 基本操作: https://kubernetes.io/docs/tasks/administer-cluster/namespaces-walkthrough/

```bash
kubectl get namespaces
kubectl create -f ns_dev.json

ns_dev.json
{
  "kind": "Namespace",
  "apiVersion": "v1",
  "metadata": {
    "name": "development",
    "labels": {
      "name": "development"
    }
  }
}

kubectl get namespaces --show-labels

define a context for the kubectl client to work 
kubectl config set-context dev --namespace=development \
  --cluster=lithe-cocoa-92103_kubernetes \
    --user=lithe-cocoa-92103_kubernetes

#切换context
kubectl config use-context dev
# 查看context
kubectl config current-context
#这样的话我们通过命令行的所有命令都会请求到集群的dev空间下。
# 测试应用
kubectl run snowflake --image=kubernetes/serve_hostname --replicas=2
kubectl get deployment
kubectl get pods -l run=snowflake
```

### 资源配额

```bash
#创建测试ns
kubectl create namespace quota-mem-cpu-example

#创建配额配置信息, quota-mem-cpu.yaml

apiVersion: v1
kind: ResourceQuota
metadata:
  name: mem-cpu-demo
spec:
  hard:
    requests.cpu: "1"
    requests.memory: 1Gi
    limits.cpu: "2"
    limits.memory: 2Gi

kubectl create -f quota-mem-cpu.yaml --namespace=quota-mem-cpu-example

```
