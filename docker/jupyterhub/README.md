## jupyterhub kubespawner on k8s


需要注意的点就是jupyterhub的spawner，在这用的是kubespawner。
对kubespawner修改的地方有：

- 1 k8s的client中config修改为incluster配置。
- 2 添加用户和nodes的mapping策略。也就是c.KubeSpawner.user_node_mapping配置。
- 3 `jupyterhub_config.py`中打开了profile_list配置。使用时需注意配置的作用域问题。放在profile_list
    外面的配置才可以对所有用户生效。本目录下的`jupyterhub_config.py`必须根据自己情况后修改使用。
    


    