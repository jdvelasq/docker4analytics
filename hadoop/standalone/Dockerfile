#
# How to build:
#
#    docker build --tag=jdvelasq/hadoop:2.8.5-standalone  .
#
# How to push
#
#    docker push jdvelasq/hadoop:2.8.5-standalone
#
# How to run:
#
#    docker run --rm -it -v "$PWD":/datalake --name hadoop -p 8888:8888 jdvelasq/hadoop:2.8.5-standalone
#
#    docker run --rm -it -v datalake:/datalake --name hadoop -p 8888:8888 jdvelasq/hadoop:2.8.5-standalone
#
# How to connect to a container:
#
#    docker exec -it hadoop bash
#

FROM jdvelasq/hadoop:2.8.5-pseudo

ENV DEBIAN_FRONTEND noninteractive

RUN cp /standalone/* /usr/local/hadoop/etc/hadoop/
        
# Parte generica
EXPOSE 50070 8088 8888 5000
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT bash
