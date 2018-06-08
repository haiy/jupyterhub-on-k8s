c.Application.log_level = 10
#c.JupyterHub.active_server_limit = 5
c.JupyterHub.admin_access = True
base_path="/opt/conda/envs/py35/share/jupyter/hub/"
c.JupyterHub.data_files_path = base_path
c.JupyterHub.template_paths = [base_path + '/templates']

c.JupyterHub.authenticator_class = 'oauthenticator.gitlab.GitLabOAuthenticator'

c.KubeSpawner.singleuser_uid = None
c.KubeSpawner.singleuser_fs_gid = None
c.KubeSpawner.singleuser_image_pull_policy = 'Always'

import os
app_name = os.environ["APP_NAME"]
namespace_name = os.environ["POD_NAMESPACE"]

# must change

c.GitLabOAuthenticator.oauth_callback_url = callback_url

c.GitLabOAuthenticator.client_id = os.environ['GITLAB_CLIENT_ID']
c.GitLabOAuthenticator.client_secret = os.environ['GITLAB_CLIENT_SECRET']


#c.Spawner.env_keep = []


c.Authenticator.admin_users = set([])


from kubespawner import KubeSpawner

c.KubeSpawner.start_timeout = 60
c.KubeSpawner.singleuser_image_spec = 'ai-notebook:base'

#c.KubeSpawner.singleuser_privileged = True
# determin the inner cluster ip
import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
host_ip = s.getsockname()[0]
s.close()

c.JupyterHub.ip = '0.0.0.0'
c.JupyterHub.hub_ip = '0.0.0.0'

c.KubeSpawner.hub_connect_ip = host_ip
c.JupyterHub.hub_connect_ip = c.KubeSpawner.hub_connect_ip

import os
import shutil

c.JupyterHub.spawner_class = KubeSpawner

# c.KubeSpawner.namespace="jupyterhub"
#c.KubeSpawner.singleuser_node_selector = {'disktype': 'ssd'}

c.KubeSpawner.profile_list = [
	{
	    'display_name': 'TrainingEnvCPU-Python',
        'default': True,
	    'kubespawner_override': {
		'singleuser_image_spec': 'ai-notebook:base',
		'cpu_limit': 1,
		'mem_limit': '8G',
		'user_node_mapping' : {
            "queue=common":["userA"],
            "queue=private":["userA"]
        },
		}
	},
	{
	    'display_name': 'TrainingEnvGPU-Python',
	    'kubespawner_override': {
		'singleuser_image_spec': 'ai-notebook:base',
		'cpu_limit': 1,
		'mem_limit': '8G',
		}
	    },
	{
	    'display_name': 'ServingEnv',
	    'kubespawner_override': {
		'singleuser_image_spec': 'serving:v1',
		'cpu_limit': 0.5,
		'mem_limit': '2G',
		}
	    }
	]


c.KubeSpawner.volumes = [
    {
        'name': 'nfs',
        'persistentVolumeClaim': {
            'claimName': 'notebook'
        }
    },
    {
        'name': 'users-list',
        'configMap': {
            "name": "users.txt"
        }
    },
]
c.KubeSpawner.volume_mounts = [
    {
        'mountPath': '/notebook',
        'name': 'nfs'
    },
    {
        'mountPath': '/root/users',
        'name': 'users-list'
    },
]
