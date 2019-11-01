#
# How to run:
#
#    docker run --rm -it -v "$PWD":/app -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/hadoop:2.8.5
#
# How to make:
#
#    docker build --tag=jdvelasq/python:3.7-minimal  .
#
# How to push
#
#    docker push jdvelasq/python:3.7-minimal
#


FROM ubuntu:18.04

WORKDIR /app
COPY .  /app

ENV DEBIAN_FRONTEND noninteractive

#
#
# ssh 
#
#
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        ssh \
        rsync && \
    rm -rf /var/lib/apt/lists/*
    
RUN mv ssh/ssh_config  /etc/ssh/ssh_config  && \
	    rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa && \
	    ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa && \
	    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys && \
	    chmod 0600 /root/.ssh/authorized_keys  
#
#
# Python 3.7
#
#
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        python3.7-minimal \
        python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --trusted-host pypi.python.org setuptools wheel && \
    pip3 install --trusted-host pypi.python.org jupyterlab


VOLUME /datalake

#
# Puertos
#
EXPOSE   8888

CMD bash
# CMD jupyter lab --ip=0.0.0.0 --allow-root --no-browser