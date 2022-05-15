#
# docker build --tag=jdvelasq/pig-zeppelin:0.17.0 .
# docker push jdvelasq/pig:0.17.0
# docker run --rm -it -v "$PWD":/datalake  --name pig -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 -p 8090:8090 jdvelasq/pig:0.17.0
# docker run --rm -it -v datalake:/datalake --name pig  -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 -p 8090:8090 jdvelasq/pig:0.17.0
# docker exec -it pig bash
#
FROM ubuntu:20.04

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# --< Java >-----------------------------------------------------------------------------
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin
RUN apt-get update \
    && apt-get install -yq --no-install-recommends openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*

# -- python3  ---------------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    python3-pip \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# --< Apache Zeppelin >------------------------------------------------------------------
ENV ZEPPELIN_VERSION 0.10.1
ENV PATH $PATH:/opt/zeppelin/bin

RUN tar -xzf zeppelin-$ZEPPELIN_VERSION-bin-netinst.tgz \
    && mv zeppelin-$ZEPPELIN_VERSION-bin-netinst /opt/zeppelin \
    && cp conf/* /opt/zeppelin/conf/ \
    && /opt/zeppelin/bin/install-interpreter.sh --name md,shell,python \
    && mkdir /opt/zeppelin/run \
    && rm zeppelin-$ZEPPELIN_VERSION-bin-netinst.tgz \
    && rm -rf /var/lib/apt/lists/* 



# --< Parte generica >-------------------------------------------------------------------
EXPOSE 8080
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
WORKDIR /workspace
ENTRYPOINT echo "Run at localhost:8080" && zeppelin.sh 

