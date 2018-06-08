From conda:base

WORKDIR /
USER root

COPY requirements.txt /tmp/requirements.txt
RUN /bin/bash -c "source activate py35 && \
    conda install --yes --file /tmp/requirements.txt &&\
    pip install oauthenticator==0.7.* && \
    conda clean -tipy &&\
    rm -rf /root/.cache"

#BASE_DIR=/notebook/models/deben/jupyterhub
ENV BASE_DIR=/jupyterhub

RUN mkdir $BASE_DIR
COPY jupyterhub_config.py /jupyterhub/jupyterhub_config.py
COPY kubespawner $BASE_DIR/kubespawner

COPY start.sh start.sh
CMD [ "/bin/bash", "start.sh"]
