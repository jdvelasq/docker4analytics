#########################################################################################
FROM jdvelasq/hadoop:classroom

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
ENV PIG_VERSION 0.17.0
ENV PIG_HOME /opt/pig
ENV PATH $PATH:${PIG_HOME}/bin

RUN tar -xzf pig-$PIG_VERSION.tar.gz \
    && mv pig-${PIG_VERSION} ${PIG_HOME} \
    && mv conf/* ${PIG_HOME}/conf/ \
    && rm pig-${PIG_VERSION}.tar.gz 

#########################################################################################
ENV DEBIAN_FRONTEND= 
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT cd /workspace \
    && pig -f pregunta.pig

