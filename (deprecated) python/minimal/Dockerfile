#
# docker build --tag=jdvelasq/python:3.6.9-minimal .
# docker push jdvelasq/python:3.6.9-minimal
# docker run --rm -it -v "$PWD":/datalake --name python-min -p 8888:8888 -p 5000:5000 jdvelasq/python:3.6.9-minimal
# docker run --rm -it -v datalake:/datalake -name python-min -p 8888:8888 jdvelasq/python:3.6.9-minimal
# docker exec -it python-min bash
#
#
FROM ubuntu:18.04

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# git, curl, wget, nano
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        apt-utils \ 
        bsdmainutils \
        curl \
        csvkit \
        gawk \
        git \
        nano \
        wget \ 
    && rm -rf /var/lib/apt/lists/*

# ssh 
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        pdsh \
        rsync \
        ssh \
    && rm -rf /var/lib/apt/lists/* \
    && mv ssh/ssh_config /etc/ssh/ssh_config \
	&& rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa \
	&& ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa \
	&& cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
	&& chmod 0600 /root/.ssh/authorized_keys  

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - \
    && apt-get update \
    && apt-get install -yq --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

# Python 3.7 + jupyter
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        python3-minimal \
        python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --trusted-host pypi.python.org \
        setuptools \
        wheel \
    && pip3 install --trusted-host pypi.python.org \
        jupyterlab \
    && mkdir /root/.jupyter \
    && mv jupyter_notebook_config.py /root/.jupyter/ \
    && pip3 install --trusted-host pypi.python.org \
        matplotlib \
        pandas \
        tables \
        pyPDF2 \
        scipy \
        flask \
        WTForms \
        Flask-WTF

# Sphinx
RUN apt-get update \
    && apt-get -yq --no-install-recommends install \
        make \
        pandoc \  
    && rm -rf /var/lib/apt/lists/*  \
    && pip3 install --trusted-host pypi.python.org \
        sphinx \
        sphinx_rtd_theme \
        nbsphinx \
        pygments \
        ipykernel \ 
        pyyaml

# jupyter 
EXPOSE 8888

# generic
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
# VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT /etc/init.d/ssh start && bash

# MySQL
# RUN apt-get update \
#     && apt-get install -yq --no-install-recommends  \ 
#         build-essential \
#         python3-dev \
#         python-dev \
#         libssl-dev \
#         libffi-dev \
#     && pip3 install --trusted-host pypi.python.org  \
#         cryptography \
#     && apt-get install -yq --no-install-recommends \
#         mysql-server \
#         libmysqlclient-dev \
#     && rm -rf /var/lib/apt/lists/* \
#     && pip3 install --trusted-host pypi.python.org  \ 
#         ipython-sql \
#         pymysql \
#         mysqlclient

# Apache Superset
# ENV LANG=C.UTF-8 \
#     LC_ALL=C.UTF-8 \
#     FLASK_APP=superset
# RUN apt-get update -y \
#     && apt-get install -yq --no-install-recommends \
#         apt-transport-https \
#         build-essential \
#         libssl-dev \
#         libffi-dev \
#         python3.6-dev \
#         python-dev \
#         python-pip \
#         libsasl2-dev \
#         libldap2-dev \
#         libxi-dev \
#     && rm -rf /var/lib/apt/lists/* \
#     && pip3 install --trusted-host pypi.python.org apache-superset \
#     && superset db upgrade \
#     && superset init
    
## flask fab create-admin \
# EXPOSE 8080