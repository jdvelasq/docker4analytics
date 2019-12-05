#
# docker build --tag=jdvelasq/zeppelin:0.8.2-pseudo .
# docker push jdvelasq/zeppelin:0.8.2-pseudo
# docker run --rm -it -v "$PWD":/datalake --name zeppelin -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 -p 8080:8080 jdvelasq/zeppelin:0.8.2-pseudo
# docker run --rm -it -v datalake:/datalake --name zeppelin -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 -p 8080:8080 jdvelasq/zeppelin:0.8.2-pseudo
# docker exec -it zeppelin bash
#
FROM jdvelasq/hadoop:2.8.5-pseudo

ENV ZEPPELIN_VERSION 0.8.2

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# Zeppelin
RUN curl -O https://www-us.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz \
    && tar -xzf zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz \
    && mv zeppelin-${ZEPPELIN_VERSION}-bin-all /usr/local/zeppelin \
    && rm zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz \
    && pip3 install --trusted-host pypi.python.org \
        grpcio \
        protobuf
        
# Parte generica
EXPOSE 50070 8088 8888 5000 8080
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT /etc/init.d/ssh start && bash hadoop-start.sh && /bin/bash && bash hadoop-stop.sh
