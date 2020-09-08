#
# docker build --tag=jdvelasq/zeppelin:0.8.1-pseudo .
# docker push jdvelasq/zeppelin:0.8.1-pseudo
# docker run --rm -it -v "$PWD":/datalake --name zeppelin -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 -p 8090:8090 jdvelasq/zeppelin:0.8.1-pseudo
# docker run --rm -it -v datalake:/datalake --name zeppelin -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 -p 8090:8090 jdvelasq/zeppelin:0.8.1-pseudo
# docker exec -it zeppelin bash
#
FROM jdvelasq/hadoop:2.8.5-pseudo

ENV ZEPPELIN_VERSION 0.8.1

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# Zeppelin
ENV PATH $PATH:/usr/local/zeppelin/bin
RUN curl -O https://www-us.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-netinst.tgz \
    && tar -xzf zeppelin-${ZEPPELIN_VERSION}-bin-netinst.tgz \
    && mv zeppelin-${ZEPPELIN_VERSION}-bin-netinst /usr/local/zeppelin \
    && rm zeppelin-${ZEPPELIN_VERSION}-bin-netinst.tgz \
    && mv conf/* /usr/local/zeppelin/conf/ \
    && mkdir -p /usr/local/zeppelin/logs \
    && mkdir -p /usr/local/zeppelin/run \
    && /usr/local/zeppelin/bin/install-interpreter.sh --name md,shell \
    && pip3 install --trusted-host pypi.python.org \
        grpcio \
        protobuf 

# Parte generica
EXPOSE 50070 8088 8888 5000 8090
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT /etc/init.d/ssh start && bash hadoop-start.sh && bash && bash hadoop-stop.sh
