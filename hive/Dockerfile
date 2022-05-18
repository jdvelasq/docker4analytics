#
# docker build --tag=jdvelasq/hive:2.3.9 .
# docker push jdvelasq/hive:2.3.9
# docker run --rm -it -v "$PWD":/datalake  --name hive -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/hive:2.3.9
# docker run --rm -it -v datalake:/datalake --name hive  -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/hive:2.3.9
# docker exec -it hive bash
#
FROM jdvelasq/hadoop:2.10.1

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
    build-essential \
    gcc \
    python3-dev \
    libsasl2-dev

#########################################################################################
#
# curl -O https://dlcdn.apache.org/hive/hive-2.3.9/apache-hive-2.3.9-bin.tar.gz
#
ENV HIVE_VERSION 2.3.9
ENV HIVE_HOME /opt/hive
ENV HIVE_CONF_DIR /opt/hive/conf
ENV PATH $PATH:/opt/hive/bin   

RUN tar -xzf apache-hive-$HIVE_VERSION-bin.tar.gz \
    && mv apache-hive-$HIVE_VERSION-bin /opt/hive \
    && rm apache-hive-$HIVE_VERSION-bin.tar.gz \
    && mv conf/hive-site.xml /opt/hive/conf/ \
    && cp bin/*.sh /usr/local/bin/

RUN pip install 'pyhive[hive]'

#########################################################################################
RUN apt-get --purge remove -y \
    build-essential \
    gcc \
    python3-dev \
    libsasl2-dev

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE 50070 8088 8888
ENV DEBIAN_FRONTEND= 
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && bash hadoop-start.sh \
    && bash hive-start.sh \
    && mr-jobhistory-daemon.sh start historyserver \
    && bash