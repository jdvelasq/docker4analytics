#
# docker build --tag=jdvelasq/pig:0.17.0-standalone .
# docker push jdvelasq/pig:0.17.0-standalone
# docker run --rm -it -v "$PWD":/datalake  --name pig -p 8888:8888 jdvelasq/pig:0.17.0-standalone
# docker run --rm -it -v datalake:/datalake --name pig  -p 8888:8888 jdvelasq/pig:0.17.0-standalone
# docker exec -it pig bash
#
FROM jdvelasq/pig:0.17.0-pseudo

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

ENV PIG_HOME /usr/local/pig
ENV PATH $PATH:/usr/local/pig/bin

RUN mv conf/* /usr/local/hadoop/etc/hadoop/ 
RUN rm -rf /app/*

# Parte generica
EXPOSE 8888
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT bash 
