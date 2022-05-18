#
# docker build --tag=jdvelasq/zeppelin:0.10.1 .
# docker push jdvelasq/zeppelin:0.10.1
# docker run --rm -it -v "$PWD":/workspace --name zeppelin -p 8080:8080 jdvelasq/zeppelin:0.10.1
# docker run --rm -it -v datalake:/workspace --name zeppelin  -p 8080:8080 jdvelasq/zeppelin:0.10.1
# docker exec -it zeppelin bash
#
FROM jdvelasq/ubuntu:20.04

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
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*


#########################################################################################
EXPOSE 8080
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
WORKDIR /workspace
ENTRYPOINT echo "\n\n\nRun at localhost:8080\n\n\n" \
    && zeppelin.sh 

