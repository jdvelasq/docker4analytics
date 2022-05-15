#
# docker build --tag=jdvelasq/pig:0.17.0 .
# docker push jdvelasq/pig:0.17.0
# docker run --rm -it -v "$PWD":/datalake  --name pig -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 -p 8090:8090 jdvelasq/pig:0.17.0
# docker run --rm -it -v datalake:/datalake --name pig  -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 -p 8090:8090 jdvelasq/pig:0.17.0
# docker exec -it pig bash
#
FROM jdvelasq/hadoop:2.10.1

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive


# --< Apache Pig >-----------------------------------------------------------------------
ENV PIG_VERSION 0.17.0
ENV PIG_HOME  /opt/pig
ENV PATH $PATH:/opt/pig/bin

# curl -O https://downloads.apache.org/pig/pig-$PIG_VERSION/pig-$PIG_VERSION.tar.gz \

RUN tar -xzf pig-$PIG_VERSION.tar.gz \
    && mv pig-$PIG_VERSION /opt/pig \
    && mv conf/* /opt/pig/conf/ \
    && rm pig-$PIG_VERSION.tar.gz \
    && rm -rf /var/lib/apt/lists/* 

RUN pip3 install --upgrade pip
RUN pip3 install bigdata


# --< Parte generica >-------------------------------------------------------------------
EXPOSE 50070 8088 8888 5000
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && bash hadoop-start.sh \
    && mr-jobhistory-daemon.sh start historyserver \
    && /bin/bash \
    && bash hadoop-stop.sh
