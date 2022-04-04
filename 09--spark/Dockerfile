#
# docker build --tag=jdvelasq/spark:3.1.3 .
# docker push jdvelasq/spark:3.1.3
#
FROM jdvelasq/hadoop:2.8.5-pseudo

ENV SPARK_VERSION 3.1.3

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# -- Spark ------------------------------------------------------------------------------
ENV SPARK_HOME /usr/local/spark
ENV SPARK_DIST_CLASSPATH /opt/hadoop/etc/hadoop:/opt/hadoop/share/hadoop/common/lib/*:/opt/hadoop/share/hadoop/common/*:/opt/hadoop/share/hadoop/hdfs:/opt/hadoop/share/hadoop/hdfs/lib/*:/opt/hadoop/share/hadoop/hdfs/*:/opt/hadoop/share/hadoop/yarn/lib/*:/opt/hadoop/share/hadoop/yarn/*:/opt/hadoop/share/hadoop/mapreduce/lib/*:/opt/hadoop/share/hadoop/mapreduce/*:/usr/lib/jvm/java-8-openjdk-amd64/lib/tools.jar:/opt/hadoop/contrib/capacity-scheduler/*.jar
ENV PATH $PATH:/usr/local/spark/bin
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    netcat \
    net-tools \
    && curl -O https://downloads.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop.tgz \
    && tar -xzf spark-$SPARK_VERSION-bin-without-hadoop.tgz \
    && mv spark-$SPARK_VERSION-bin-without-hadoop /usr/local/spark \
    && rm spark-$SPARK_VERSION-bin-without-hadoop.tgz \
    && rm -rf /var/lib/apt/lists/*

# Parte generica
EXPOSE  50070  8088  8888  5000
EXPOSE  8881   8880  4040  4041
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT /etc/init.d/ssh start && bash hadoop-start.sh && bash && bash hadoop-stop.sh