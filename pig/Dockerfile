#
# How to build:
#
#    docker build --tag=jdvelasq/pig:0.17.0  .
#
# How to push
#
#    docker push jdvelasq/pig:0.17.0
#
# How to run:
#
#    docker run --rm -it -v "$PWD":/datalake -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/pig:0.17.0
#
#    docker run --rm -it -v datalake:/datalake -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/pig:0.17.0
#

FROM jdvelasq/hadoop:2.8.5

ENV PIG_VERSION 0.17.0

WORKDIR /app
COPY .  /app

ENV DEBIAN_FRONTEND noninteractive

# Jupyter extension
RUN pip3 install bigdata

# Pig
ENV PIG_HOME  /usr/local/pig
ENV PATH $PATH:/usr/local/pig/bin
RUN curl -O https://www-eu.apache.org/dist/pig/pig-$PIG_VERSION/pig-$PIG_VERSION.tar.gz \
    && tar -xzf pig-$PIG_VERSION.tar.gz \
    && mv pig-$PIG_VERSION /usr/local/pig \
    && mv conf/* /usr/local/pig/conf/ \
    && rm pig-$PIG_VERSION.tar.gz \
    && rm -rf /var/lib/apt/lists/*

# Parte generica
EXPOSE 50070 8088 8888 5000
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT bash hdp-start.sh && /bin/bash && bash hdp-stop.sh

