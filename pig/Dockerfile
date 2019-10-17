FROM jdvelasq/hadoop:2.8.5

ARG PIG_VERSION

WORKDIR /app
COPY .  /app

##
## Sistema operativo
##
ENV DEBIAN_FRONTEND noninteractive

##
## Python
##
RUN pip3 install bigdata

##
## Pig
##
ENV PIG_HOME  /usr/local/pig
ENV PATH $PATH:/usr/local/pig/bin
RUN apt-get update && \ 
    apt-get install -yq --no-install-recommends curl && \
    curl -O https://www-eu.apache.org/dist/pig/pig-$PIG_VERSION/pig-$PIG_VERSION.tar.gz && \
    tar -xzf pig-$PIG_VERSION.tar.gz && \
    mv pig-$PIG_VERSION /usr/local/pig && \
    rm pig-$PIG_VERSION.tar.gz && \
    apt-get purge -yq curl && \
    apt-get autoremove -yq && \
    rm -rf /var/lib/apt/lists/*

##
## Limpia la instalacion
##
RUN rm -rf /app/*

##
## Puertos
##
EXPOSE  50070  8088  8888  5000

CMD bash hdp-start.sh && jupyter lab --ip=0.0.0.0 --allow-root --no-browser && bash hdp-stop.sh