#
# docker build --tag=jdvelasq/hadoop:2.10.1 .
# docker push jdvelasq/hadoop:2.10.1
# docker run --rm -it -v "$PWD":/workspace --name hadoop -p 8888:8888 -p 50070:50070 -p 8088:8088 jdvelasq/hadoop:2.10.1
# docker exec -it hadoop bash
#
FROM jdvelasq/jupyterlab:3.2.9

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
    openjdk-8-jdk \
    ssh  

#########################################################################################
RUN mv ssh/ssh_config /etc/ssh/ssh_config \
    && rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa \
    && ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa \
    && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
    && chmod 0600 /root/.ssh/authorized_keys 

ENV PDSH_RCMD_TYPE=ssh

#########################################################################################
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

#########################################################################################
#
# curl -O https://downloads.apache.org/hadoop/common/hadoop-${HDP_VERSION}/hadoop-${HDP_VERSION}.tar.gz
#
ENV HDP_VERSION 2.10.1
ENV HADOOP_HOME /opt/hadoop
ENV PATH $PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
ENV HADOOP_CLASSPATH /opt/jdk-18/lib/tools.jar
ENV HADOOP_CONF_DIR ${HADOOP_HOME}/etc/hadoop
ENV HADOOP_COMMON_LIB_NATIVE_DIR ${HADOOP_HOME}/lib/native
ENV HADOOP_OPTS "-Djava.library.path="${HADOOP_HOME}"/lib/native"
ENV HADOOP_ROOT_LOGGER "ERROR,console"
ENV HDFS_NAMENODE_USER="root"
ENV HDFS_DATANODE_USER="root"
ENV HDFS_SECONDARYNAMENODE_USER="root"
ENV YARN_RESOURCEMANAGER_USER="root"
ENV YARN_NODEMANAGER_USER="root"

RUN tar -xzf hadoop-${HDP_VERSION}.tar.gz \
    && mv hadoop-${HDP_VERSION} ${HADOOP_HOME} \
    && rm hadoop-${HDP_VERSION}.tar.gz \
    && chmod 0777 ${HADOOP_HOME} \
    && mv conf/* ${HADOOP_HOME}/etc/hadoop/ \
    && mv bin/* /usr/local/bin/ \
    && mkdir ${HADOOP_HOME}/logs

#########################################################################################
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    mrjob==0.7.4 \
    snakebite-py3==3.0.5

#########################################################################################
RUN apt-get autoremove -y \
    && apt autoremove -y \
    && apt-get clean -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE 50070
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
    && hdfs dfs -chmod 777 /tmp \
    && hdfs dfs -mkdir /user \
    && hdfs dfs -mkdir /user/root \
    && echo \
    && echo =============================================== \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  2.10.1" \
    && echo ".............................................." \    
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

#
# Test:
#
# hdfs dfs -mkdir input
# hdfs dfs -copyFromLocal /opt/hadoop/etc/hadoop/*.xml input
# hadoop jar /opt/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.10.1.jar grep input output 'dfs[a-z.]+'
# hdfs dfs -cat output/part-r-00000
#