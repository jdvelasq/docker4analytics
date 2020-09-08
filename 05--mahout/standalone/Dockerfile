#
# docker build --tag=jdvelasq/mahout:0.13.0-standalone .
# docker push jdvelasq/mahout:0.13.0-standalone
# docker run --rm -it -v "$PWD":/datalake  --name mahout -p 8888:8888 jdvelasq/mahout:0.13.0-standalone
# docker run --rm -it -v datalake:/datalake --name mahout  -p 8888:8888 jdvelasq/mahout:0.13.0-standalone
# docker exec -it mahout bash
#
FROM jdvelasq/mahout:0.13.0-pseudo

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
