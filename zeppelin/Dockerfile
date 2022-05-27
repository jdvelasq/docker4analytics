#
# docker build --tag=jdvelasq/zeppelin:0.10.1 .
# docker push jdvelasq/zeppelin:0.10.1
# docker run --rm -it -v "$PWD":/workspace --name zeppelin -p 8080:8080 jdvelasq/zeppelin:0.10.1
# docker run --rm -it -v datalake:/workspace --name zeppelin  -p 8080:8080 jdvelasq/zeppelin:0.10.1
# docker exec -it zeppelin bash
#
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
RUN apt-get install -yq --no-install-recommends \
    openjdk-8-jdk

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

#########################################################################################
ENV ZEPPELIN_VERSION 0.10.1
ENV PATH $PATH:/opt/zeppelin/bin

RUN tar -xzf zeppelin-$ZEPPELIN_VERSION-bin-netinst.tgz \
    && mv zeppelin-$ZEPPELIN_VERSION-bin-netinst /opt/zeppelin \
    && cp conf/* /opt/zeppelin/conf/ \
    && /opt/zeppelin/bin/install-interpreter.sh --name md,shell,python \
    && mkdir /opt/zeppelin/run \
    && rm zeppelin-$ZEPPELIN_VERSION-bin-netinst.tgz

#########################################################################################
EXPOSE 9870
EXPOSE 8088
EXPOSE 8888
EXPOSE 8080
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && rm -rf /tmp/hadoop-root/dfs/name \
    && hdfs namenode -format \
    && bash start-dfs.sh \
    && hdfs dfs -mkdir /tmp \
    && hdfs dfs -chmod 777 /tmp \
    && hdfs dfs -mkdir /user \
    && hdfs dfs -mkdir /user/root \
    # && hdfs dfs -mkdir -p /apps/tez \
    # && hdfs dfs -copyFromLocal ${TEZ_HOME}/share/tez-0.7.1.tar.gz /apps/tez/ \
    && bash start-yarn.sh \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  2.10.1" \
    # && echo "           tez  0.7.1" \
    && echo "      zeppelin  0.10.1" \
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
    && echo " Zeppelin run at:" \
    && echo \
    && echo "     http://localhost:8080/" \
    && echo \
    && echo "---------------------------------------------------" \
    && echo \
    && zeppelin.sh
