# Jupyterhub on k8s

## Target

Provide an easy environment for deep learning researchers or data scientists.

## Powered by

k8s + jupyterhub + jupyterlab

- [k8s](https://github.com/kubernetes/kubernetes/): container based resource abstraction 
- [jupyterhub](https://github.com/jupyterhub/jupyterhub): multiple user env manager
- [jupyterlab](https://github.com/jupyterlab/jupyterlab): single user env

## Details

- 1 build the basic docker
- 2 make sure they are work normally in local mode
- 3 create k8s deployment and debug env errors
