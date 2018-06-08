echo "http://master-ip:port/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/"
kubectl proxy --address="0.0.0.0"  --port=9090 --accept-hosts='^*$'
