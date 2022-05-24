#
# docker build --tag=jdvelasq/sqoop:1.4.7 .
# docker push jdvelasq/sqoop:1.4.7
# docker run --rm -it -v "$PWD":/datalake  --name sqoop -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/sqoop:1.4.7
# docker exec -it sqoop bash
#
FROM jdvelasq/hive:2.3.9

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    mysql-connector-python \
    pandas

#########################################################################################
#
#  https://github.com/xerial/sqlite-jdbc
#  http://archive.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
#  http://ftp.ntu.edu.tw/MySQL/Downloads/Connector-J/mysql-connector-java-5.1.49.tar.gz
#
ENV SQOOP_VERSION 1.4.7
ENV SQOOP_HOME /opt/sqoop
ENV HADOOP_HOME /opt/hadoop 
ENV PATH $PATH:${SQOOP_HOME}/bin  
ENV HADOOP_COMMON_HOME /opt/hadoop 
ENV HADOOP_MAPRED_HOME /opt/hadoop

ENV HBASE_HOME /opt/hbase
ENV HCAT_HOME /opt/hcatalog
ENV ACCUMULO_HOME /opt/accumulo
ENV ZOOKEEPER_HOME /opt/zookeeper

RUN mkdir -p /opt/hbase \
    && mkdir -p /opt/hcatalog \
    && mkdir -p /opt/accumulo \
    && mkdir -p /opt/zookeeper

RUN tar -xzf sqoop-${SQOOP_VERSION}.bin__hadoop-2.6.0.tar.gz \
    && mv sqoop-${SQOOP_VERSION}.bin__hadoop-2.6.0 ${SQOOP_HOME} \
    && rm sqoop-${SQOOP_VERSION}.bin__hadoop-2.6.0.tar.gz \
    && mv conf/sqoop-env.sh /opt/sqoop/conf/

#########################################################################################
RUN tar -xzf mysql-connector-java-5.1.49.tar.gz \
    && mv mysql-connector-java-5.1.49/mysql-connector-java-5.1.49-bin.jar ${SQOOP_HOME}/lib 

#########################################################################################
EXPOSE 50070
EXPOSE 8088
EXPOSE 8888  
ENV DEBIAN_FRONTEND=dialog
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
    && hdfs dfs -copyFromLocal ${TEZ_HOME}/share/tez-0.7.1.tar.gz /apps/tez/ \
    && bash start-yarn.sh \
    && bash hive-start.sh \
    && mr-jobhistory-daemon.sh start historyserver \
    && echo \
    && echo =============================================== \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  2.10.1" \
    && echo "           tez  0.7.1" \
    && echo "       mariadb  10.3.34" \
    && echo "         spark  3.1.3" \
    && echo "          hive  2.3.4" \  
    && echo "         sqoop  1.4.7" \    
    && echo ".............................................." \
    && echo \
    && echo " Hadoop NameNode at:" \
    && echo \
    && echo "    http://127.0.0.1:50070/" \
    && echo \
    && echo " Yarn ResourceManager at:" \
    && echo \
    && echo "     http://127.0.0.1:8088/" \
    && echo \
    && echo ================================================ \
    && echo \
    && /bin/bash


