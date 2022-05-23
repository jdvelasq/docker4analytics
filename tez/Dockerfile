#
# docker build --tag=jdvelasq/hadoop:2.10.1 .
# docker push jdvelasq/hadoop:2.10.1
# docker run --rm -it -v "$PWD":/workspace --name hadoop -p 8888:8888 -p 50070:50070 -p 8088:8088 jdvelasq/hadoop:2.10.1
# docker exec -it hadoop bash
#
FROM jdvelasq/hadoop:2.10.1

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
ENV TEZ_VERSION 0.7.1
ENV TEZ_HOME /opt/tez
ENV TEZ_CONF_DIR /opt/tez/conf
ENV TEZ_JARS /opt/tez
ENV HADOOP_CLASSPATH ${TEZ_CONF_DIR}:${TEZ_JARS}/*:${TEZ_JARS}/lib/*

RUN tar -xzf apache-tez-${TEZ_VERSION}-bin.tar.gz \
    && mv apache-tez-${TEZ_VERSION}-bin /opt/tez/ \
    && mkdir -p /opt/tez/conf \
    && mv conf/* /opt/tez/conf/  \
    && mv hadoop/etc/hadoop/* /opt/hadoop/etc/hadoop/ \
    && mv bin/* /usr/local/bin/ \
    && rm apache-tez-${TEZ_VERSION}-bin.tar.gz

#########################################################################################
EXPOSE 50070
EXPOSE 8088
EXPOSE 8888
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && bash hadoop-start.sh \
    && /bin/bash

