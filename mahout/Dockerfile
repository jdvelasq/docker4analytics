#
# docker build --tag=jdvelasq/mahout:0.13.0-pseudo .
# docker push jdvelasq/mahout:0.13.0-pseudo
# docker run --rm -it -v "$PWD":/datalake  --name mahout -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/mahout:0.13.0-pseudo
# docker run --rm -it -v datalake:/datalake --name mahout  -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/mahout:0.13.0-pseudo
# docker exec -it mahout bash
#
FROM jdvelasq/hadoop:2.8.5-pseudo

ENV MAHOUT_VERSION 0.13.0

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

RUN pip3 install bigdata

# Mahout
ENV MAHOUT_HOME  /usr/local/mahout
ENV PATH $PATH:/usr/local/mahout/bin
RUN apt-get update \ 
    && curl -O https://downloads.apache.org/mahout/$MAHOUT_VERSION/apache-mahout-distribution-$MAHOUT_VERSION.tar.gz \
    && tar -xzf apache-mahout-distribution-$MAHOUT_VERSION.tar.gz \
    && mv apache-mahout-distribution-$MAHOUT_VERSION /usr/local/mahout \
    && rm apache-mahout-distribution-$MAHOUT_VERSION.tar.gz \
    && rm -rf /var/lib/apt/lists/*

# Parte generica
EXPOSE 5000
EXPOSE 8088
EXPOSE 8888
EXPOSE 9870
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT /etc/init.d/ssh start && bash hadoop-start.sh && mr-jobhistory-daemon.sh start historyserver && bash && bash hadoop-stop.sh
