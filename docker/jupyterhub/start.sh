#!/bin/bash

# clean before start
#rm $BASE_DIR/jupyterhub_cookie_secret
#rm $BASE_DIR/jupyterhub.sqlite

source activate py35
cd $BASE_DIR/kubespawner && pip install -e . && cd $BASE_DIR
jupyterhub -f $BASE_DIR/jupyterhub_config.py
