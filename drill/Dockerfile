#########################################################################################
FROM jdvelasq/hadoop:2.10.1

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
# RUN apt-get update \
#     && apt update

#########################################################################################
# RUN apt-get install -yq \
#     python2

#########################################################################################
# RUN apt-get autoremove -y \
#     && apt autoremove -y \
#     && apt-get clean -y \
#     && apt clean -y \
#     && rm -rf /var/lib/apt/lists/*

#########################################################################################
ENV DRILL_VERSION 1.19.0
ENV DRILL_HOME /opt/drill
ENV PATH $PATH:${DRILL_HOME}/bin

RUN tar -xvzf apache-drill-${DRILL_VERSION}.tar.gz \
    && mv apache-drill-${DRILL_VERSION} ${DRILL_HOME} \
    && rm apache-drill-${DRILL_VERSION}.tar.gz \
    && cp conf/* ${DRILL_HOME}/conf \
    && mkdir -p ${DRILL_HOME}/sys.storage_plugins/ \
    && cp plugins/*.drill /opt/drill/sys.storage_plugins/ 

#########################################################################################
EXPOSE 31010
EXPOSE 50070
EXPOSE 8047
EXPOSE 8088
EXPOSE 8888
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
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  2.10.1" \
    && echo "         drill  1.20.1" \
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
    && bash

