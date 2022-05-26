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
RUN apt-get install -yq --no-install-recommends \    
    build-essential \
    gcc \
    python3-dev \
    libsasl2-dev

#########################################################################################
#
# curl -O https://dlcdn.apache.org/hive/hive-2.3.9/apache-hive-2.3.9-bin.tar.gz
#
ENV HIVE_VERSION 2.3.9
ENV HIVE_HOME /opt/hive
ENV HIVE_CONF_DIR /opt/hive/conf
ENV PATH $PATH:/opt/hive/bin   

RUN tar -xzf apache-hive-$HIVE_VERSION-bin.tar.gz \
    && mv apache-hive-$HIVE_VERSION-bin /opt/hive \
    && rm apache-hive-$HIVE_VERSION-bin.tar.gz \
    && mv conf/hive-site.xml /opt/hive/conf/ \
    && cp bin/*.sh /usr/local/bin/ \
    && rm /opt/hive/lib/log4j-slf4j-impl-2.6.2.jar

RUN pip install 'pyhive[hive]'

#########################################################################################
RUN apt-get --purge remove -y \
    build-essential \
    gcc \
    python3-dev \
    libsasl2-dev

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
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
    && hdfs dfs -copyFromLocal ${TEZ_HOME}/share/tez-0.7.1.tar.gz /apps/tez/ \
    && bash start-yarn.sh \
    && bash hive-start.sh \
    && mr-jobhistory-daemon.sh start historyserver \
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
    && echo "          hive  2.3.4" \
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
    && echo =============================================== \
    && echo \
    && /bin/bash






