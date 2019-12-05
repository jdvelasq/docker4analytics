#
# docker build --tag=jdvelasq/hadoop:2.8.5-pseudo .
# docker push jdvelasq/hadoop:2.8.5-pseudo
# docker run --rm -it -v "$PWD":/datalake --name hadoop -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/hadoop:2.8.5-pseudo
# docker run --rm -it -v datalake:/datalake --name hadoop -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/hadoop:2.8.5-pseudo
# docker exec -it hadoop bash
#
FROM jdvelasq/python:3.6.9-minimal

ENV HDP_VERSION 2.8.5

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# Java
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin
RUN apt-get update \
    && apt-get install -yq --no-install-recommends openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*

# Hadoop
ENV PATH $PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin
ENV HADOOP_CLASSPATH /usr/lib/jvm/java-8-openjdk-amd64/lib/tools.jar
ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV HADOOP_COMMON_LIB_NATIVE_DIR  /usr/local/hadoop/lib/native
ENV HADOOP_OPTS "-Djava.library.path=/usr/local/hadoop/lib/native"
ENV HADOOP_ROOT_LOGGER "ERROR,console"

RUN curl -O https://www-eu.apache.org/dist/hadoop/common/hadoop-${HDP_VERSION}/hadoop-${HDP_VERSION}.tar.gz \
    && tar -xzf hadoop-${HDP_VERSION}.tar.gz \
    && mv hadoop-${HDP_VERSION} /usr/local/hadoop \
    && rm hadoop-${HDP_VERSION}.tar.gz \
    && chmod 0777 /usr/local/hadoop \ 
    && rm -rf /var/lib/apt/lists/* \
    && mv conf/* /usr/local/hadoop/etc/hadoop/ \
    && mv bin/* /usr/local/bin/ \
    && mv etc/environment /etc/environment
        
# Parte generica
EXPOSE 50070 8088 8888 5000
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT /etc/init.d/ssh start && bash hadoop-start.sh && /bin/bash && bash hadoop-stop.sh
