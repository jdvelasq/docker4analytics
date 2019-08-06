FROM jdvelasq/jupyterlab:hadoop

WORKDIR /app
COPY .  /app

ARG HIVE_VERSION

##
## Sistema operativo
##
ENV DEBIAN_FRONTEND noninteractive
 
RUN pip3 install bigdata

##
## Hive
##
ENV HIVE_HOME  /usr/local/hive
ENV HIVE_CONF_DIR  /usr/local/hive/conf
ENV PATH $PATH:/usr/local/hive/bin        
RUN apt-get update && \ 
    apt-get install -yq --no-install-recommends curl && \
    curl -O https://www-eu.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
    tar -xzf apache-hive-$HIVE_VERSION-bin.tar.gz && \
    mv apache-hive-$HIVE_VERSION-bin /usr/local/hive && \
    rm apache-hive-$HIVE_VERSION-bin.tar.gz  && \
    apt-get purge -yq curl && \
    apt-get autoremove -yq && \
    rm -rf /var/lib/apt/lists/*


COPY conf/hive-site.xml  /usr/local/hive/conf/ 

##
## Scripts
## 
COPY bin/*.sh   /usr/local/bin/

RUN rm -rf /app/*

##
## Puertos
##
EXPOSE  50070  8088  8888  5000

CMD bash hdp-start.sh && jupyter lab --ip=0.0.0.0 --allow-root --no-browser && bash hdp-stop.sh