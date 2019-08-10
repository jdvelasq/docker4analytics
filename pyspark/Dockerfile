FROM jdvelasq/jupyterlab:spark

ARG SPARK_VERSION

WORKDIR /app
COPY .  /app

##
## Sistema operativo
##
ENV DEBIAN_FRONTEND noninteractive

##
## Python - base
##
RUN pip3 install --trusted-host pypi.python.org  \
         numpy    pandas   matplotlib   wordcloud

##
## PySpark
##
ENV PYSPARK_DRIVER_PYTHON ipython

ENV PYSPARK_PYTHON python3


RUN pip3 install  --trusted-host pypi.python.org \
        findspark  \
        pyspark


##
## Limpia la instalacion
##
RUN rm -rf /app/*

##
## Puertos
##
EXPOSE  50070  8088  8888  5000
EXPOSE  8881   8880  4040  4041

CMD bash hdp-start.sh && jupyter lab --ip=0.0.0.0 --allow-root --no-browser && bash hdp-stop.sh