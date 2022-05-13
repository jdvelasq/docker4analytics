#
# docker build --tag=jdvelasq/hive:2.3.9 .
# docker push jdvelasq/hive:2.3.9
# docker run --rm -it -v "$PWD":/datalake  --name hive -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/hive:2.3.9
# docker run --rm -it -v datalake:/datalake --name hive  -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/hive:2.3.9
# docker exec -it hive bash
#

FROM jdvelasq/hadoop:2.8.5

ENV HIVE_VERSION 2.3.9

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# Jupyter extension
RUN pip3 install --upgrade pip
RUN pip3 install bigdata
# RUN pip install 'pyhive[hive]' \
#     && pip install 'pyhive[presto]' \
#     && pip install 'pyhive[trino]'

# Hive
ENV HIVE_HOME /opt/hive
ENV HIVE_CONF_DIR /opt/hive/conf
ENV PATH $PATH:/opt/hive/bin   

# curl -O https://downloads.apache.org/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz \

RUN tar -xzf apache-hive-$HIVE_VERSION-bin.tar.gz \
    && mv apache-hive-$HIVE_VERSION-bin /opt/hive \
    && rm apache-hive-$HIVE_VERSION-bin.tar.gz \
    && mv conf/hive-site.xml /opt/hive/conf/ \
    && cp bin/*.sh /usr/local/bin/

# Parte generica
EXPOSE 50070 8088 8888
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && bash hadoop-start.sh \
    && bash hive-start.sh \
    && mr-jobhistory-daemon.sh start historyserver \
    && bash \
    && bash hadoop-stop.sh