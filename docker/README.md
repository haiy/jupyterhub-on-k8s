## All images and pods config

Suppose you've alreay have a k8s ready to play:

- 1. build all images with `all_build.sh`
- 2. fire the jupyterhub pod with `start_k8s_jpt_app.sh`

Now let's check the pods :

```bash
kubectl get pods --all-namespaces -o wide | grep jupyterhub
```

Note: If you want mount a local dir into jupyterhub like me, change the `hostPath:path` in `jupyterhub.yaml`.


## Dockerfile detail

All dockerfile has almost the same structure.Basically each has four parts:

- copy required packages list files
- install system and python packages 
- config the settings
- start scripts(optional)

the differences between `settings.sh` and `start.sh` is whether we need to packe it into the image.
