#########################################################################################
FROM jdvelasq/hadoop:classroom

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
ENV PIG_VERSION 0.17.0
ENV PIG_HOME /opt/pig
ENV PATH $PATH:${PIG_HOME}/bin

RUN tar -xzf pig-$PIG_VERSION.tar.gz \
    && mv pig-${PIG_VERSION} ${PIG_HOME} \
    && mv conf/* ${PIG_HOME}/conf/ \
    && rm pig-${PIG_VERSION}.tar.gz 

#########################################################################################
ENV DEBIAN_FRONTEND= 
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT cd /workspace \
    && pig -f pregunta.pig

# ENTRYPOINT /etc/init.d/ssh start \
#     && rm -rf /tmp/hadoop-root/dfs/name \
#     && hdfs namenode -format \
#     && bash start-dfs.sh \
#     && hdfs dfs -mkdir /user \
#     && hdfs dfs -mkdir /user/root \
#     && hdfs dfs -mkdir /tmp \
#     && hdfs dfs -chmod 777 /tmp \
#     && bash start-yarn.sh \
#     && mr-jobhistory-daemon.sh start historyserver \
#     && cd /workspace \
#     && pig -f pregunta.pig

