#
# docker build --tag=jdvelasq/hive:2.3.9 .
# docker push jdvelasq/hive:2.3.9
# docker run --rm -it -v "$PWD":/datalake  --name hive -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/hive:2.3.9
# docker run --rm -it -v datalake:/datalake --name hive  -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/hive:2.3.9
# docker exec -it hive bash
#
FROM jdvelasq/hbase:2.3.0

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
RUN apt-get update \
    && apt update

#########################################################################################
RUN apt-get install -yq \
    python2 \
    && ln -s /usr/bin/python2 /usr/bin/python


#########################################################################################
RUN apt-get autoremove -y \
    && apt autoremove -y \
    && apt-get clean -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
#
# curl -O 
#
ENV PHOENIX_VERSION 5.1.2
ENV PHOENIX_HOME /opt/phoenix
ENV PATH $PATH:${PHOENIX_HOME}/bin   

RUN tar -xzf phoenix-hbase-2.3-${PHOENIX_VERSION}-bin.tar.gz \
    && mv phoenix-hbase-2.3-${PHOENIX_VERSION}-bin ${PHOENIX_HOME} \
    && rm phoenix-hbase-2.3-${PHOENIX_VERSION}-bin.tar.gz \
    && cp ${PHOENIX_HOME}/phoenix-server-hbase-2.3-${PHOENIX_VERSION}.jar ${HBASE_HOME}/lib/ \
    && rm /opt/phoenix/phoenix-client-hbase-2.3-5.1.2.jar

#########################################################################################
EXPOSE 16010
EXPOSE 50070
EXPOSE 8088
EXPOSE 8888
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
    && hdfs dfs -mkdir -p /apps/tez \
    && hdfs dfs -copyFromLocal /opt/tez/share/tez-0.7.1.tar.gz /apps/tez/ \
    && bash start-yarn.sh \
    && start-hbase.sh \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  2.10.1" \
    && echo "           tez  0.7.1" \
    && echo "       mariadb  10.3.34" \
    && echo "         spark  3.1.3" \
    && echo "     zookeeper  3.7.1" \
    && echo "         hbase  2.4.12" \
    && echo "       phoenix  5.1.2" \
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

