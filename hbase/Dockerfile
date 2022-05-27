#
# docker build --tag=jdvelasq/hive:2.3.9 .
# docker push jdvelasq/hive:2.3.9
# docker run --rm -it -v "$PWD":/datalake  --name hive -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/hive:2.3.9
# docker run --rm -it -v datalake:/datalake --name hive  -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/hive:2.3.9
# docker exec -it hive bash
#
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
EXPOSE 9870
ENV DEBIAN_FRONTEND= 
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && service mysql start \
    && rm -rf /tmp/hadoop-root/dfs/name \
    && hdfs namenode -format \
    && bash start-dfs.sh \
    && hdfs dfs -mkdir /tmp \
    && hdfs dfs -chmod 777 /tmp \
    && hdfs dfs -mkdir /user \
    && hdfs dfs -mkdir /user/root \
    # && hdfs dfs -mkdir -p /apps/tez \
    # && hdfs dfs -copyFromLocal /opt/tez/share/tez-0.7.1.tar.gz /apps/tez/ \
    && bash start-yarn.sh \
    && start-hbase.sh \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  3.2.1" \
    # && echo "           tez  0.7.1" \
    && echo "       mariadb  10.3.34" \
    && echo "         spark  3.1.3" \
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

