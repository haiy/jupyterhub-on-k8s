#!/bin/bash

# dir related envs
export JPY_USER=$JUPYTERHUB_USER

export BASE_DIR=/notebook
export HOME_DIR=$BASE_DIR/$JPY_USER
export USER_LIST_FILE=/root/users/users.txt


# load env to all users
export CUSTOM_ENV_BASH=/tmp/custom_env.sh
if [ -f "$CUSTOM_ENV_BASH" ];then
    source $CUSTOM_ENV_BASH
    cp $CUSTOM_ENV_BASH /etc/profile.d/
fi

# create the base dir for jupyter notebook
if [ ! -d "$BASE_DIR" ];then
    mkdir $BASE_DIR
fi

# add all users
useradd appweb
cat $USER_LIST_FILE | xargs -I % useradd % -g appweb -d $BASE_DIR/% -s /bin/bash

# create user home dir if not exists
if [ ! -d "$HOME_DIR" ]; then
    mkhomedir_helper $JPY_USER
    chmod -R 700 $HOME_DIR
fi

# ready to start

cd $HOME_DIR
su $JPY_USER -c "MEM_LIMIT=$MEM_LIMIT \
	MEM_GUARANTEE=$MEM_GUARANTEE \
	CPU_LIMIT=$CPU_LIMIT \
	CPU_GUARANTEE=$CPU_GUARANTEE \
	JUPYTERHUB_USER=$JUPYTERHUB_USER \
	JUPYTERHUB_GROUP=$JUPYTERHUB_GROUP \
	JUPYTERHUB_API_URL=$JUPYTERHUB_API_URL \
	JUPYTERHUB_API_TOKEN=$JUPYTERHUB_API_TOKEN \
	JUPYTERHUB_CLIENT_ID=$JUPYTERHUB_CLIENT_ID \
	JUPYTERHUB_HOST=$JUPYTERHUB_HOST \
	JUPYTERHUB_OAUTH_CALLBACK_URL=$JUPYTERHUB_OAUTH_CALLBACK_URL \
	JUPYTERHUB_BASE_URL=$JUPYTERHUB_BASE_URL \
	JUPYTERHUB_SERVICE_URL=$JUPYTERHUB_SERVICE_URL \
	JUPYTERHUB_SERVICE_PREFIX=$JUPYTERHUB_SERVICE_PREFIX \
	&& \
	env &&\
    export PATH=/opt/conda/bin:$PATH && source activate py35 && \
    jupyterhub-singleuser --SingleUserNotebookApp.default_url='/lab' \
    --ip='0.0.0.0' --notebook-dir=$HOME_DIR "
