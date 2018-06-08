#https://kubernetes.io/docs/tasks/tools/install-kubectl/
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.26.0/minikube-darwin-amd64 && chmod +x minikube 

