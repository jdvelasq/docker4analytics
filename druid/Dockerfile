#########################################################################################
FROM jdvelasq/hadoop:3.2.1

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
    python2

#########################################################################################
RUN apt-get autoremove -y \
    && apt autoremove -y \
    && apt-get clean -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
ENV DRUID_VERSION 0.22.1
ENV DRUID_HOME /opt/druid
ENV PATH $PATH:${DRUID_HOME}/bin

RUN tar -xzf apache-druid-${DRUID_VERSION}-bin.tar.gz \
    && mv apache-druid-${DRUID_VERSION} ${DRUID_HOME} \
    && mkdir -p ${DRUID_HOME}/conf/druid/single-server/nano-quickstart/_common/hadoop-xml/ \
    && cp /opt/hadoop/etc/hadoop/*.xml ${DRUID_HOME}/conf/druid/single-server/nano-quickstart/_common/hadoop-xml/ \
    && mv common.runtime.properties ${DRUID_HOME}/conf/druid/single-server/nano-quickstart/_common/ \
    && mv runtime.properties ${DRUID_HOME}/conf/druid/single-server/nano-quickstart/router/

#########################################################################################
EXPOSE 8088
EXPOSE 8888
EXPOSE 9870
EXPOSE 9999
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && rm -rf /tmp/hadoop-root/dfs/name \
    && hdfs namenode -format \
    && bash start-dfs.sh \
    && bash start-yarn.sh \
    && hdfs dfs -mkdir /tmp \
    && hdfs dfs -chmod -R 777 /tmp \
    && hdfs dfs -mkdir /user \
    && hdfs dfs -mkdir /user/root \
    && hdfs dfs -chmod -R 777 /user \
    && hdfs dfs -mkdir /druid \
    && hdfs dfs -mkdir /druid/segments \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  3.2.1" \
    && echo "         druid  0.22.1" \
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
    && echo " Druid is available at:" \
    && echo \
    && echo "     http://127.0.0.1:9999/" \
    && echo \
    && echo "     Press CTRL+C to finish" \
    && echo \
    && echo "---------------------------------------------------" \
    && echo \
    && start-nano-quickstart

