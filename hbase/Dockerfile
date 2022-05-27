#########################################################################################
FROM jdvelasq/zookeeper:3.7.1

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
#
# curl -O 
#
ENV HBASE_VERSION 2.3.0
ENV HBASE_HOME /opt/hbase
ENV HBASE_CONF_DIR ${HBASE_HOME}/conf
ENV PATH $PATH:${HBASE_HOME}/bin   

RUN tar -xzf hbase-${HBASE_VERSION}-bin.tar.gz \
    && mv hbase-${HBASE_VERSION} ${HBASE_HOME} \
    && rm hbase-${HBASE_VERSION}-bin.tar.gz \
    && cp -r conf/ ${HBASE_HOME}/ \
    && rm /opt/hbase/lib/client-facing-thirdparty/slf4j-log4j12-1.7.30.jar

#########################################################################################
EXPOSE 16010
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
    && start-hbase.sh \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  2.10.1" \
    && echo "     zookeeper  3.7.1" \
    && echo "         hbase  2.4.12" \
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
    && echo " HBase Web UI at: "\
    && echo \
    && echo "     http://localhost:16010/" \
    && echo \
    && echo "---------------------------------------------------" \
    && echo \
    && /bin/bash

