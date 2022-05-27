#########################################################################################
FROM jdvelasq/hadoop:2.10.1

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
#
# curl -O https://dlcdn.apache.org/zookeeper/zookeeper-3.7.1/apache-zookeeper-3.7.1-bin.tar.gz
#
ENV ZOOKEEPER_VERSION 3.7.1
ENV ZOOKEEPER_HOME /opt/zookeeper
ENV PATH $PATH:${ZOOKEEPER_HOME}/bin   

RUN tar -xzf apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz \
    && mv apache-zookeeper-${ZOOKEEPER_VERSION}-bin ${ZOOKEEPER_HOME} \
    && rm apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz \
    && mv conf/zoo.cfg ${ZOOKEEPER_HOME}/conf/zoo.cfg

#########################################################################################
EXPOSE 50070
EXPOSE 8088
EXPOSE 8888
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
    && zkServer.sh start \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  2.10.1" \
    && echo "     zookeeper  3.7.1" \
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

