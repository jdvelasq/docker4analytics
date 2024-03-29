#
# docker build --tag=jdvelasq/hadoop:2.10.1 .
# docker push jdvelasq/hadoop:2.10.1
# docker run --rm -it -v "$PWD":/workspace --name hadoop -p 8888:8888 -p 50070:50070 -p 8088:8088 jdvelasq/hadoop:2.10.1
# docker exec -it hadoop bash
#
FROM jdvelasq/jupyterlab:3.2.9

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

ENV PRESTO_VERSION 0.272.1

# --< Java >-----------------------------------------------------------------------------
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin
RUN apt-get update \
    && apt-get install -yq --no-install-recommends openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*


RUN tar -xzf presto-server-${PRESTO_VERSION}.tar.gz \
    && mv presto-server-${PRESTO_VERSION} /opt/presto \
    && rm presto-server-${PRESTO_VERSION}.tar.gz \
    && mv etc/* /opt/presto/etc/ \
    && chmod 0777 /opt/presto \ 
    && mkdir -p /usr/local/bin/presto \
    && mv presto-cli-${PRESTO_VERSION}-executable.jar /usr/local/bin/presto/ \
    && chmod 0777 /usr/local/bin/presto \
    && rm -rf /var/lib/apt/lists/* 


# https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.272.1/presto-cli-0.272.1-executable.jar


#########################################################################################


# -- bash -------------------------------------------------------------------------------
# RUN apt-get update \
#     && apt-get install -yq --no-install-recommends \
#     tree \
#     nano \
#     ssh \
#     && apt-get autoremove -y \
#     && apt-get clean -y \
#     && rm -rf /var/lib/apt/lists/* 


# -- ssh --------------------------------------------------------------------------------
# RUN apt-get update \
#     && apt-get install -yq --no-install-recommends \
#     pdsh \
#     rsync \
#     ssh \
#     && apt-get autoremove -y \
#     && apt-get clean -y \
#     && rm -rf /var/lib/apt/lists/* \
#     && mv ssh/ssh_config /etc/ssh/ssh_config \
#     && rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa \
#     && ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa \
#     && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
#     && chmod 0600 /root/.ssh/authorized_keys 
#
# ENV PDSH_RCMD_TYPE=ssh




# --< Apache Hadoop >--------------------------------------------------------------------
# ENV HDP_VERSION 2.10.1
# ENV HADOOP_HOME /opt/hadoop
# ENV PATH $PATH:/opt/hadoop/bin:/opt/hadoop/sbin
# ENV HADOOP_CLASSPATH /opt/jdk-18/lib/tools.jar
# ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop
# ENV HADOOP_COMMON_LIB_NATIVE_DIR /opt/hadoop/lib/native
# ENV HADOOP_OPTS "-Djava.library.path=/opt/hadoop/lib/native"
# ENV HADOOP_ROOT_LOGGER "ERROR,console"
# ENV HDFS_NAMENODE_USER="root"
# ENV HDFS_DATANODE_USER="root"
# ENV HDFS_SECONDARYNAMENODE_USER="root"
# ENV YARN_RESOURCEMANAGER_USER="root"
# ENV YARN_NODEMANAGER_USER="root"


# RUN curl -O https://downloads.apache.org/hadoop/common/hadoop-${HDP_VERSION}/hadoop-${HDP_VERSION}.tar.gz

# RUN tar -xzf hadoop-${HDP_VERSION}.tar.gz \
#     && mv hadoop-${HDP_VERSION} /opt/hadoop \
#     && rm hadoop-${HDP_VERSION}.tar.gz \
#     && chmod 0777 /opt/hadoop \ 
#     && rm -rf /var/lib/apt/lists/* \
#     && mv conf/* /opt/hadoop/etc/hadoop/ \
#     && mv bin/* /usr/local/bin/ \
#     && mkdir /opt/hadoop/logs

##    && mv etc/environment /etc/environment \

# -- Hadoop streaming in Python ---------------------------------------------------------
# RUN pip3 install --upgrade pip

# RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
#     mrjob==0.7.4 \
#     snakebite-py3==3.0.5 \
#     csvkit

# --< Parte generica >-------------------------------------------------------------------
EXPOSE  8888  50070  8088
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT 

# ENTRYPOINT /etc/init.d/ssh start \
#     && bash hadoop-start.sh \
#     && /bin/bash \
#     && bash hadoop-stop.sh
