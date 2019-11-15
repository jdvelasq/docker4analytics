#
# How to build:
#
#    docker build --tag=jdvelasq/hive:2.3.6-pseudo .
#
# How to push
#
#    docker push jdvelasq/hive:2.3.6-pseudo
#
# How to run:
#
#    docker run --rm -it -v "$PWD":/datalake  --name hive -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/hive:2.3.6-pseudo
#
#    docker run --rm -it -v datalake:/datalake --name hive  -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/hive:2.3.6-pseudo
#
# How to connect to container:
#
#    docker exec -it hive bash
#

FROM jdvelasq/hadoop:2.8.5-pseudo

ENV HIVE_VERSION 2.3.6

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive
 
# Jupyter extension
RUN pip3 install bigdata

# Hive
ENV HIVE_HOME  /usr/local/hive
ENV HIVE_CONF_DIR  /usr/local/hive/conf
ENV PATH $PATH:/usr/local/hive/bin        
RUN curl -O https://www-eu.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz \
    && tar -xzf apache-hive-$HIVE_VERSION-bin.tar.gz \
    && mv apache-hive-$HIVE_VERSION-bin /usr/local/hive \
    && rm apache-hive-$HIVE_VERSION-bin.tar.gz
COPY conf/hive-site.xml  /usr/local/hive/conf/ 

# Scripts de inicio de hadoop
COPY bin/*.sh /usr/local/bin/

# Parte generica
EXPOSE 50070 8088 8888 5000
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT bash hdp-start.sh && bash hive-start.sh && mr-jobhistory-daemon.sh start historyserver && bash && bash hdp-stop.sh