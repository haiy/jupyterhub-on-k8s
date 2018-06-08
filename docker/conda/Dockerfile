FROM ubuntu:base

USER root

ENV CONDA_HOME=/opt/conda  PATH=$PATH:/opt/conda/bin
COPY Miniconda3-4.4.10-Linux-x86_64.sh /root/miniconda.sh
RUN /bin/bash -c "/bin/bash /root/miniconda.sh -b -p /opt/conda &&\
    rm /root/miniconda.sh && \
    conda config --set show_channel_urls yes && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/ && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ && \
    conda config --remove channels defaults && \
    conda config --system --set auto_update_conda false && \
    echo source activate py35 >> /etc/profile.d/py35.sh &&\
    echo source activate py35 >> /root/.bashrc &&\
    conda create -p $CONDA_HOME/envs/py35 python=3.5 &&\
    conda clean -tipy &&\
    rm -rf $CONDA_HOME/pkgs/*"

CMD ["/bin/bash"]

