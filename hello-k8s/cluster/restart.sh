#!/bin/bash
kubeadm reset && \
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.1.106 --kubernetes-version=v1.10.0 && \
rm -rf  /root/.kube/* && cp -f /etc/kubernetes/admin.conf /root/.kube/config && \
rm -rf /home/h/.kube/* && cp -f /etc/kubernetes/admin.conf /home/h/.kube/config && \
chown h:h /home/h/.kube/config && \
kubectl get pods --namespace=kube-system && sleep 5 && \
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml && \
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml && \
kubectl taint nodes --all node-role.kubernetes.io/master- && \
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml && \

kubectl get pods --namespace=kube-system
echo "kubectl get pods --namespace=kube-system"

#kubectl get pods --all-namespaces -o wide
#kubectl proxy --address="0.0.0.0"  --port=9090 --accept-hosts='^*$'
#http://master-ip:port/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/







