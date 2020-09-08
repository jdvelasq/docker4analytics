#
# docker build --tag=jdvelasq/hive:2.3.6-standalone .
# docker push jdvelasq/hive:2.3.6-standalone
# docker run --rm -it -v "$PWD":/datalake  --name hive -p 8888:8888 jdvelasq/hive:2.3.6-standalone
# docker run --rm -it -v datalake:/datalake --name hive  -p 8888:8888 jdvelasq/hive:2.3.6-standalone
# docker exec -it hive bash
#
FROM jdvelasq/hive:2.3.6-pseudo

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive
ENV HIVE_HOME /usr/local/hive
ENV HIVE_CONF_DIR /usr/local/hive/conf
ENV PATH $PATH:/usr/local/hive/bin        


RUN mv conf/* /usr/local/hadoop/etc/hadoop/ 
RUN rm -rf /app/*

# Parte generica
EXPOSE 8888

ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT bash hive-start.sh && bash