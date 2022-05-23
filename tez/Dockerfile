#
# docker build --tag=jdvelasq/hadoop:2.10.1 .
# docker push jdvelasq/hadoop:2.10.1
# docker run --rm -it -v "$PWD":/workspace --name hadoop -p 8888:8888 -p 50070:50070 -p 8088:8088 jdvelasq/hadoop:2.10.1
# docker exec -it hadoop bash
#
FROM jdvelasq/hadoop:2.10.1

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
ENV HADOOP_HOME /opt/hadoop
ENV TEZ_VERSION 0.7.1
ENV TEZ_HOME /opt/tez
ENV TEZ_CONF_DIR ${TEZ_HOME}/conf
ENV TEZ_JARS ${TEZ_HOME}
ENV HADOOP_CLASSPATH ${TEZ_CONF_DIR}:${TEZ_JARS}/*:${TEZ_JARS}/lib/*

RUN tar -xzf apache-tez-${TEZ_VERSION}-bin.tar.gz \
    && mv apache-tez-${TEZ_VERSION}-bin ${TEZ_HOME} \
    && mkdir -p ${TEZ_HOME}/conf \
    && mv conf/* ${TEZ_HOME}/conf/  \
    && mv hadoop/etc/hadoop/* ${HADOOP_HOME}/etc/hadoop/ \
    && rm apache-tez-${TEZ_VERSION}-bin.tar.gz \
    && rm ${TEZ_HOME}/lib/slf4j-log4j12-1.7.5.jar

# && mv bin/* /usr/local/bin/ \

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
    && hdfs dfs -mkdir /tmp \
    && hdfs dfs -chmod 777 /tmp \
    && hdfs dfs -mkdir /user \
    && hdfs dfs -mkdir /user/root \
    && hdfs dfs -mkdir -p /apps/tez \
    && hdfs dfs -copyFromLocal ${TEZ_HOME}/share/tez-0.7.1.tar.gz /apps/tez/ \
    && bash start-yarn.sh \
    && echo \
    && echo =========== Hadoop on Tez =========== \
    && echo \
    && echo Hadoop NameNode at: \
    && echo \
    && echo "    http://127.0.0.1:50070/" \
    && echo \
    && echo Yarn ResourceManager at: \
    && echo \
    && echo "     http://127.0.0.1:8088/" \
    && echo \
    && echo ===================================== \
    && echo \
    && /bin/bash

#
# Test:
#
# hdfs dfs -mkdir input
# hdfs dfs -copyFromLocal /opt/hadoop/etc/hadoop/*.xml input
# hadoop jar /opt/tez/tez-examples-0.7.1.jar orderedwordcount input output
# hdfs dfs -ls output/
# hdfs dfs -cat output/part-v002-o000-r-00000
#