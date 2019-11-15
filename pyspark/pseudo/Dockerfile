#
# How to build:
#
#    docker build --tag=jdvelasq/pyspark:2.4.4-pseudo  .
#
# How to push
#
#    docker push jdvelasq/pyspark:2.4.4-pseudo
#
# How to run:
#
#    docker run --rm -it -v "$PWD":/datalake  --name pyspark -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/pyspark:2.4.4-pseudo
#
#    docker run --rm -it -v datalake:/datalake --name pyspark  -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/pyspark:2.4.4-pseudo
#
# How to connect to container:
#
#    docker exec -it pyspark bash
#

FROM jdvelasq/spark:2.4.4-pseudo

ENV PYSPARK_VERSION 2.4.4

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# Librerias base base
RUN pip3 install --trusted-host pypi.python.org  \
        numpy \
        pandas \
        matplotlib \
        seaborn \
        wordcloud

# PySpark
ENV PYSPARK_DRIVER_PYTHON ipython
ENV PYSPARK_PYTHON python3
RUN pip3 install  --trusted-host pypi.python.org \
        findspark  \
        pyspark==$PYSPARK_VERSION

# Parte generica
EXPOSE  50070  8088  8888  5000
EXPOSE  8881   8880  4040  4041
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT bash hdp-start.sh && bash && bash hdp-stop.sh