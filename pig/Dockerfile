#########################################################################################
FROM jdvelasq/hadoop:2.10.1

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
#
# curl -O https://downloads.apache.org/pig/pig-$PIG_VERSION/pig-$PIG_VERSION.tar.gz
#
ENV PIG_VERSION 0.17.0
ENV PIG_HOME /opt/pig
ENV PATH $PATH:${PIG_HOME}/bin

RUN tar -xzf pig-$PIG_VERSION.tar.gz \
    && mv pig-${PIG_VERSION} ${PIG_HOME} \
    && mv conf/* ${PIG_HOME}/conf/ \
    && rm pig-${PIG_VERSION}.tar.gz 

#########################################################################################
EXPOSE 8088
EXPOSE 8888 
EXPOSE 50070
ENV DEBIAN_FRONTEND= 
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && rm -rf /tmp/hadoop-root/dfs/name \
    && hdfs namenode -format \
    && bash start-dfs.sh \
    && hdfs dfs -mkdir /tmp \
    && hdfs dfs -chmod 777 /tmp \
    && hdfs dfs -mkdir /user \
    && hdfs dfs -mkdir /user/root \
    && bash start-yarn.sh \
    && mr-jobhistory-daemon.sh start historyserver \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  3.2.1" \
    && echo "           pig  0.17.0" \
    && echo "---------------------------------------------------" \    
    && echo \
    && echo " Hadoop NameNode at: " \
    && echo \
    && echo "    http://127.0.0.1:50070/" \
    && echo \
    && echo " Yarn ResourceManager at: "\
    && echo \
    && echo "     http://127.0.0.1:8088/" \
    && echo \
    && echo "---------------------------------------------------" \
    && echo \
    && /bin/bash

