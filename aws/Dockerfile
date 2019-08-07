FROM jdvelasq/jupyterlab:hadoop

WORKDIR /app
COPY .  /app


## --------------------------------------------------------
##
##  Hive
##
## --------------------------------------------------------

ARG HIVE_VERSION

##
## Sistema operativo
##
ENV DEBIAN_FRONTEND noninteractive
 
RUN pip3 install bigdata

##
## Hive
##
ENV HIVE_HOME  /usr/local/hive
ENV HIVE_CONF_DIR  /usr/local/hive/conf
ENV PATH $PATH:/usr/local/hive/bin        
RUN apt-get update && \ 
    apt-get install -yq --no-install-recommends curl && \
    curl -O https://www-eu.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
    tar -xzf apache-hive-$HIVE_VERSION-bin.tar.gz && \
    mv apache-hive-$HIVE_VERSION-bin /usr/local/hive && \
    rm apache-hive-$HIVE_VERSION-bin.tar.gz  && \
    apt-get purge -yq curl && \
    apt-get autoremove -yq && \
    rm -rf /var/lib/apt/lists/*


COPY conf/hive-site.xml  /usr/local/hive/conf/ 

##
## Scripts
## 
COPY bin/*.sh   /usr/local/bin/

## --------------------------------------------------------
##
##  Pig
##
## --------------------------------------------------------

ARG PIG_VERSION

ENV PIG_HOME  /usr/local/pig
ENV PATH $PATH:/usr/local/pig/bin
RUN apt-get update && \ 
    apt-get install -yq --no-install-recommends curl && \
    curl -O https://www-eu.apache.org/dist/pig/pig-$PIG_VERSION/pig-$PIG_VERSION.tar.gz && \
    tar -xzf pig-$PIG_VERSION.tar.gz && \
    mv pig-$PIG_VERSION /usr/local/pig && \
    rm pig-$PIG_VERSION.tar.gz && \
    apt-get purge -yq curl && \
    apt-get autoremove -yq && \
    rm -rf /var/lib/apt/lists/*

## --------------------------------------------------------
##
##  Mahout
##
## --------------------------------------------------------

ARG MAHOUT_VERSION

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

## --------------------------------------------------------
##
##  Spark
##
## --------------------------------------------------------

ARG SPARK_VERSION

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



RUN rm -rf /app/*

##
## Puertos
##
EXPOSE  8888  5000  8000  6006  9000  50070  8088  8080  8881  8880  4040  4041

CMD bash hdp-start.sh && jupyter lab --ip=0.0.0.0 --allow-root --no-browser && bash hdp-stop.sh