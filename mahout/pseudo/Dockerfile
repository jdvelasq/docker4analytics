FROM jdvelasq/hadoop:2019-2

ARG MAHOUT_VERSION

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
## Mahout
##
ENV MAHOUT_HOME  /usr/local/mahout
ENV PATH $PATH:/usr/local/mahout/bin
RUN apt-get update && \ 
    apt-get install -yq --no-install-recommends curl && \
    curl -O http://archive.apache.org/dist/mahout/$MAHOUT_VERSION/apache-mahout-distribution-$MAHOUT_VERSION.tar.gz && \
    tar -xzf apache-mahout-distribution-$MAHOUT_VERSION.tar.gz && \
    mv apache-mahout-distribution-$MAHOUT_VERSION /usr/local/mahout && \
    rm apache-mahout-distribution-$MAHOUT_VERSION.tar.gz && \
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

CMD /etc/init.d/ssh start &&  bash hadoop-start.sh && bash && bash hadoop-stop.sh