From conda:base

WORKDIR /
USER root

COPY requirements.txt /tmp/requirements.txt
RUN /bin/bash -c "source activate py35 &&\
    conda install --yes --file /tmp/requirements.txt &&\
    conda clean -tipy &&\
    rm -rf /root/.cache"

COPY packages.txt /tmp/packages.txt
COPY settings.sh /tmp/settings.sh
RUN bash /tmp/settings.sh

COPY custom_env.sh /tmp/custom_env.sh
COPY start.sh start.sh
CMD ["/bin/bash", "start.sh"]
