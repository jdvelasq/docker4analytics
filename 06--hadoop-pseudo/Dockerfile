#
# docker build --tag=jdvelasq/hadoop:2.8.5-pseudo .
# docker push jdvelasq/hadoop:2.8.5-pseudo
# docker run --rm -it -v "$PWD":/datalake --name hadoop -p 8888:8888 -p 50070:50070 -p 8088:8088 jdvelasq/hadoop:2.8.5-pseudo
# docker exec -it hadoop bash
#
FROM ubuntu:20.04

WORKDIR /app
COPY . /app

# -- wget / curl  -----------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    wget \
    curl \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


# -- Python 3 ---------------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    python-dev \
    python3-minimal \
    python3-pip \
    python3-dev \       
    python3-venv \ 
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# -- nodejs -----------------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -y ca-certificates xz-utils \
    && curl -O https://nodejs.org/dist/v16.4.0/node-v16.4.0-linux-x64.tar.xz \
    && tar -xf node-v16.4.0-linux-x64.tar.xz \
    && cp -r node-v16.4.0-linux-x64/* /usr/ \
    && ln -s "$(which node)" /usr/bin/nodejs \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# -- pip upgrade ------------------------------------------------------------------------
RUN pip3 install --upgrade pip

# -- draw.io ----------------------------------------------------------------------------
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \    
    jupyterlab-drawio


# -- Jupyter Lab ------------------------------------------------------------------------
RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
    jupyterlab==3.2.9 \
    && mkdir /root/.jupyter \
    && mv jupyter_notebook_config.py /root/.jupyter/ \
    && mkdir /root/.jupyter/lab \
    && mkdir /root/.jupyter/lab/user-settings \
    && mkdir /root/.jupyter/lab/user-settings/@jupyterlab \
    && mkdir /root/.jupyter/lab/user-settings/@jupyterlab/notebook-extension \
    && mv tracker.jupyterlab-settings /root/.jupyter/lab/user-settings/@jupyterlab/notebook-extension/

# -- Code Formater ----------------------------------------------------------------------
RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
    jupyterlab_code_formatter \
    black \
    isort \
    && mkdir /root/.jupyter/lab/user-settings/@ryantam626 \
    && mkdir /root/.jupyter/lab/user-settings/@ryantam626/jupyterlab_code_formatter \
    && mv settings_jupyterlab-settings /root/.jupyter/lab/user-settings/@ryantam626/jupyterlab_code_formatter/settings.jupyterlab-settings


#########################################################################################

# FROM jdvelasq/python3:jupyterlab
ENV HDP_VERSION 2.8.5

# WORKDIR /app
# COPY . /app

ENV DEBIAN_FRONTEND noninteractive

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

ENV PDSH_RCMD_TYPE=ssh

# -- Java -------------------------------------------------------------------------------
# ENV JAVA_HOME /opt/jdk-18
# ENV PATH $PATH:$JAVA_HOME/bin
# RUN tar -xzf openjdk-18_linux-x64_bin.tar.gz \
#     && mv jdk-18 /opt/jdk-18 \
#     && rm openjdk-18_linux-x64_bin.tar.gz \
#    && chmod 0777 /opt/jdk-18 

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin
RUN apt-get update \
    && apt-get install -yq --no-install-recommends openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*


# -- Hadoop ------------------------------------------------------------------------------
ENV PATH $PATH:/opt/hadoop/bin:/opt/hadoop/sbin
ENV HADOOP_CLASSPATH /opt/jdk-18/lib/tools.jar
ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop
ENV HADOOP_COMMON_LIB_NATIVE_DIR  /opt/hadoop/lib/native
ENV HADOOP_OPTS "-Djava.library.path=/opt/hadoop/lib/native"
ENV HADOOP_ROOT_LOGGER "ERROR,console"
ENV HDFS_NAMENODE_USER="root"
ENV HDFS_DATANODE_USER="root"
ENV HDFS_SECONDARYNAMENODE_USER="root"
ENV YARN_RESOURCEMANAGER_USER="root"
ENV YARN_NODEMANAGER_USER="root"


# RUN curl -O https://downloads.apache.org/hadoop/common/hadoop-${HDP_VERSION}/hadoop-${HDP_VERSION}.tar.gz

RUN tar -xzf hadoop-${HDP_VERSION}.tar.gz \
    && mv hadoop-${HDP_VERSION} /opt/hadoop \
    && rm hadoop-${HDP_VERSION}.tar.gz \
    && chmod 0777 /opt/hadoop \ 
    && rm -rf /var/lib/apt/lists/* \
    && mv conf/* /opt/hadoop/etc/hadoop/ \
    && mv bin/* /usr/local/bin/ \
    && mv etc/environment /etc/environment \
    && mkdir /opt/hadoop/logs

# -- Parte generica ---------------------------------------------------------------------
EXPOSE  8888  50070  8088
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start && bash hadoop-start.sh && /bin/bash && bash hadoop-stop.sh
