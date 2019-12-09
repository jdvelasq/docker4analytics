#
# docker build --tag=jdvelasq/hadoop:2.8.5-standalone .
# docker push jdvelasq/hadoop:2.8.5-standalone
# docker run --rm -it -v "$PWD":/datalake --name hadoop -p 8888:8888 jdvelasq/hadoop:2.8.5-standalone
# docker run --rm -it -v datalake:/datalake --name hadoop -p 8888:8888 jdvelasq/hadoop:2.8.5-standalone
# docker exec -it hadoop bash
#

FROM jdvelasq/hadoop:2.8.5-pseudo

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

RUN mv conf/* /usr/local/hadoop/etc/hadoop/ 
RUN rm -rf /app/*

# Parte generica
EXPOSE 8888
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT bash
