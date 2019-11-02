#
# How to run:
#
#    docker run --rm -it -v "$PWD":/datalake -p 8888:8888 jdvelasq/python:3.7-minimal
#
# How to make:
#
#    docker build --tag=jdvelasq/python:3.7-minimal  .
#
# How to push
#
#    docker push jdvelasq/python:3.7-minimal
#
# How to run jupyter lab:
#
#    jupyter lab --ip=0.0.0.0 --allow-root --no-browser
#

FROM ubuntu:18.04

WORKDIR /app
COPY .  /app

ENV DEBIAN_FRONTEND noninteractive

# ssh 
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        ssh \
        rsync \
    && rm -rf /var/lib/apt/lists/*
    
RUN mv ssh/ssh_config  /etc/ssh/ssh_config \
	&& rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa \
	&& ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa \
	&& cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
	&& chmod 0600 /root/.ssh/authorized_keys  

# Python 3.7
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        python3.7-minimal \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --trusted-host pypi.python.org setuptools wheel \
    && pip3 install --trusted-host pypi.python.org jupyterlab

# nodejs
RUN apt-get update \
    && apt-get install -yq --no-install-recommends curl \
    && curl -sL https://deb.nodesource.com/setup_13.x | bash - \
    && apt-get install -yq --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

VOLUME /datalake


# Ports
EXPOSE   8888

CMD bash
