#
# docker build --tag=jdvelasq/r .
# docker push jdvelasq/r
# docker run --rm -it -v "$PWD":/datalake --name r-language  jdvelasq/r .
# docker run --rm -it -v datalake:/datalake --name r-language jdvelasq/r .
# docker exec -it r-language bash
#
# docker run --rm -it  --name r-language jdvelasq/r
#
# REPOSITORY         TAG          IMAGE ID       CREATED          SIZE
#

FROM ubuntu:18.04

ENV LANG C.UTF-8 

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive


# -- utlidades sistema operativo --------------------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    apt-utils \
    bsdmainutils \
    build-essential \
    bash \
    bash-completion \
    curl \
    git \
    make \
    nano \
    wget \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# -- ssh --------------------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    pdsh \
    rsync \
    ssh \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && mv ssh/ssh_config /etc/ssh/ssh_config \
    && rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa \
    && ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa \
    && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
    && chmod 0600 /root/.ssh/authorized_keys 

# -- R language -------------------------------------------------------------------------
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        r-base \
        r-base-dev \
        r-recommended \
        libssl-dev \
        libffi-dev \
        libldap2-dev \
        libsasl2-dev \
        libxml2-dev \
        libzmq3-dev \
        libcurl4-openssl-dev && \
    Rscript -e "install.packages(c('tidyverse'), repos = 'http://cran.us.r-project.org')"  && \
    Rscript -e "install.packages(c('devtools'), repos = 'http://cran.us.r-project.org')"  && \
    Rscript -e "install.packages(c('txtplot'), repos = 'http://cran.us.r-project.org')"  && \        
    apt-get autoremove -yq && \
    rm -rf /var/lib/apt/lists/*


ENV DEBIAN_FRONTEND=dialog

#
# Parte generica
#
# EXPOSE   8888  5000  8000  6006 
RUN rm -rf /app/*
WORKDIR /datalake
SHELL ["/bin/bash", "-c"]
ENTRYPOINT /etc/init.d/ssh start && R