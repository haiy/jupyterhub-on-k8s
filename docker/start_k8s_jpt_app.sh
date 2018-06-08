# jupyterhub img: jupyterhub:base
# notebook img: ai-cpu-notebook:base

# build img
#./all_build.sh
#clean exists service
kubectl delete deployment,service jupyterhub
# local run deployment
kubectl create -f jupyterhub.yaml
# expose as service
kubectl expose deployment jupyterhub --port=8000 --type="LoadBalancer"
kubectl get svc jupyterhub
