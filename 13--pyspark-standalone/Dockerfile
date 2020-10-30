#
# docker build --tag=jdvelasq/pyspark:2.4.7-standalone .
# docker push jdvelasq/pyspark:2.4.7-standalone
# docker run --rm -it -v "$PWD":/datalake  --name pyspark -p 8888:8888 jdvelasq/pyspark:2.4.7-standalone
# docker run --rm -it -v datalake:/datalake --name pyspark  -p 8888:8888 jdvelasq/pyspark:2.4.7-standalone
# docker exec -it pyspark bash
#
FROM jdvelasq/pyspark:2.4.7-pseudo

ENV PYSPARK_VERSION 2.4.7

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

RUN mv conf/* /usr/local/hadoop/etc/hadoop/ 
RUN rm -rf /app/*

# Parte generica
EXPOSE  50070  8088  8888  5000   8881   8880  4040  4041
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT bash