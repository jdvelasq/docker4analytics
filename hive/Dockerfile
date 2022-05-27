#########################################################################################
FROM jdvelasq/hadoop:2.10.1

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
    && apt-get autoremove -y \
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
    && rm -rf /tmp/hadoop-root/dfs/name \
    && hdfs namenode -format \
    && bash start-dfs.sh \
    && hdfs dfs -mkdir /tmp \
    && hdfs dfs -chmod 777 /tmp \
    && hdfs dfs -mkdir /user \
    && hdfs dfs -mkdir /user/root \
    && bash start-yarn.sh \
    && bash hive-start.sh \
    && mr-jobhistory-daemon.sh start historyserver \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  2.10.1" \
    && echo "          hive  2.3.9" \
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






