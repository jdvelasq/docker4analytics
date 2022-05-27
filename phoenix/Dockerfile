#########################################################################################
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
RUN apt-get install -yq --no-install-recommends \    
    build-essential \
    gcc \
    krb5-config \
    libkrb5-dev \
    libsasl2-dev \
    libsasl2-dev \
    libsasl2-modules-gssapi-mit \
    libssl-dev \
    python3-dev

#########################################################################################
# RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
#     phoenixdb 

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
    && cp ${PHOENIX_HOME}/phoenix-server-hbase-2.3-${PHOENIX_VERSION}.jar ${HBASE_HOME}/lib/ 
## && rm /opt/phoenix/phoenix-client-hbase-2.3-5.1.2.jar


#########################################################################################
# ENV PATH $PATH:/opt/query-server/bin   

# RUN tar -xzf phoenix-queryserver-6.0.0-bin.tar.gz \
#     && mv phoenix-queryserver-6.0.0 /opt/query-server \
#     && rm phoenix-queryserver-6.0.0-bin.tar.gz


#########################################################################################
RUN apt-get --purge remove -y \
    build-essential \
    gcc \
    libsasl2-dev \
    python3-dev

#########################################################################################
RUN apt-get autoremove -y \
    && apt autoremove -y \
    && apt-get clean -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE 16010
EXPOSE 50070
EXPOSE 8088
EXPOSE 8765
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
    && start-hbase.sh \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  2.10.1" \
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

