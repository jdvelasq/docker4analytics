#
# docker build --tag=jdvelasq/hadoop:2.8.5-pseudo .
# docker push jdvelasq/hadoop:2.8.5-pseudo
# docker run --rm -it -v "$PWD":/datalake --name hadoop -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/hadoop:2.8.5-pseudo
# docker run --rm -it -v datalake:/datalake --name hadoop -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/hadoop:2.8.5-pseudo
# docker exec -it hadoop bash
#
FROM jdvelasq/python3:jupyterlab

ENV HDP_VERSION 3.3.2

WORKDIR /app
COPY . /app

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

# -- Java -------------------------------------------------------------------------------
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin
RUN apt-get update \
    && apt-get install -yq --no-install-recommends openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*

# -- Hadoop ------------------------------------------------------------------------------
ENV PATH $PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin
ENV HADOOP_CLASSPATH /usr/lib/jvm/java-8-openjdk-amd64/lib/tools.jar
ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV HADOOP_COMMON_LIB_NATIVE_DIR  /usr/local/hadoop/lib/native
ENV HADOOP_OPTS "-Djava.library.path=/usr/local/hadoop/lib/native"
ENV HADOOP_ROOT_LOGGER "ERROR,console"

RUN curl -O https://downloads.apache.org/hadoop/common/hadoop-${HDP_VERSION}/hadoop-${HDP_VERSION}.tar.gz

RUN tar -xzf hadoop-${HDP_VERSION}.tar.gz \
    && mv hadoop-${HDP_VERSION} /usr/local/hadoop \
    && rm hadoop-${HDP_VERSION}.tar.gz \
    && chmod 0777 /usr/local/hadoop \ 
    && rm -rf /var/lib/apt/lists/* \
    && mv conf/* /usr/local/hadoop/etc/hadoop/ \
    && mv bin/* /usr/local/bin/ \
    && mv etc/environment /etc/environment

#
# Parte generica
#
EXPOSE 8888 50070 8088  5000
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start && bash hadoop-start.sh && /bin/bash && bash hadoop-stop.sh
