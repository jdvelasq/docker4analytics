#########################################################################################
FROM jdvelasq/hadoop:classroom

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
ENV HIVE_VERSION 2.3.9
ENV HIVE_HOME /opt/hive
ENV HIVE_CONF_DIR /opt/hive/conf
ENV PATH $PATH:/opt/hive/bin   

RUN tar -xzf apache-hive-$HIVE_VERSION-bin.tar.gz \
    && mv apache-hive-$HIVE_VERSION-bin /opt/hive \
    && rm apache-hive-$HIVE_VERSION-bin.tar.gz \
    && mv conf/hive-site.xml /opt/hive/conf/ \
    && cp bin/*.sh /usr/local/bin/ \
    && rm /opt/hive/lib/log4j-slf4j-impl-2.6.2.jar

#########################################################################################
ENV DEBIAN_FRONTEND= 
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT mkdir -p /user/hive/warehouse \
    && mkdir -p /tmp/hive \
    && chmod 777 /tmp/hive \
    && chmod 777 /user/hive/warehouse \
    && schematool -dbType derby -initSchema \
    && cd /workspace \
    && hive -f pregunta.hql