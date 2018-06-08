FROM ubuntu:16.04

WORKDIR /

COPY 16-04-source.list /etc/apt/sources.list
COPY packages.txt /tmp/packages.txt
COPY settings.sh /tmp/settings.sh

# install and config settings
RUN bash /tmp/settings.sh

# env settings
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN mkdir /root/.pip
COPY pip.conf /root/.pip/pip.conf

CMD ["/bin/bash"]