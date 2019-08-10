FROM jdvelasq/jupyterlab:hadoop

ARG SPARK_VERSION

WORKDIR /app
COPY .  /app

##
## Sistema operativo
##
ENV DEBIAN_FRONTEND noninteractive

##
## R + IRkernel
##
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        r-base \
        libssl-dev \
        libffi-dev \
        libldap2-dev \
        libsasl2-dev \
        libxml2-dev \
        libzmq3-dev \
        libcurl4-openssl-dev \
        build-essential && \
    pip3 install --trusted-host pypi.python.org rpy2 && \
    Rscript -e "install.packages(c('repr', 'IRdisplay', 'IRkernel', 'dplyr'), repos = 'http://cran.us.r-project.org', type = 'source'); IRkernel::installspec(user=FALSE)"  && \
    Rscript -e "IRkernel::installspec(user=FALSE)" && \
    apt-get purge -yq build-essential && \
    apt-get autoremove -yq && \
    rm -rf /var/lib/apt/lists/*


##
## Spark
##
ENV SPARK_HOME /usr/local/spark

ENV SPARK_DIST_CLASSPATH /usr/local/hadoop/etc/hadoop:/usr/local/hadoop/share/hadoop/common/lib/*:/usr/local/hadoop/share/hadoop/common/*:/usr/local/hadoop/share/hadoop/hdfs:/usr/local/hadoop/share/hadoop/hdfs/lib/*:/usr/local/hadoop/share/hadoop/hdfs/*:/usr/local/hadoop/share/hadoop/yarn/lib/*:/usr/local/hadoop/share/hadoop/yarn/*:/usr/local/hadoop/share/hadoop/mapreduce/lib/*:/usr/local/hadoop/share/hadoop/mapreduce/*:/usr/lib/jvm/java-8-openjdk-amd64/lib/tools.jar:/usr/local/hadoop/contrib/capacity-scheduler/*.jar

ENV PYSPARK_DRIVER_PYTHON ipython

ENV PYSPARK_PYTHON python3

ENV PATH $PATH:/usr/local/pig/spark

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        curl && \
    curl -O https://www-eu.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop.tgz && \
    tar -xzf spark-$SPARK_VERSION-bin-without-hadoop.tgz && \
    mv spark-$SPARK_VERSION-bin-without-hadoop /usr/local/spark && \
    rm spark-$SPARK_VERSION-bin-without-hadoop.tgz && \
    apt-get purge -yq curl && \
    apt-get autoremove -yq && \
    rm -rf /var/lib/apt/lists/*


##
## Python - base
##
RUN pip3 install --trusted-host pypi.python.org  \
         numpy    pandas   matplotlib   wordcloud

##
## PySpark
##
RUN pip3 install  --trusted-host pypi.python.org \
        findspark  \
        pyspark

##
## Sparklyr + SparkR
## 

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        build-essential && \
    Rscript -e "install.packages('sparklyr', repos = 'http://cran.us.r-project.org')" && \
    Rscript -e "library(sparklyr); spark_install(version = '2.4')" && \
    Rscript -e "install.packages('SparkR', repos = 'http://cran.us.r-project.org')" && \
    apt-get purge -yq build-essential && \
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
EXPOSE  8881   8880  4040  4041

CMD bash hdp-start.sh && jupyter lab --ip=0.0.0.0 --allow-root --no-browser && bash hdp-stop.sh