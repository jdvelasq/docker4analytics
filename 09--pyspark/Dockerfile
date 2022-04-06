#
# docker build --tag=jdvelasq/pyspark:3.1.3 .
# docker push jdvelasq/pyspark:3.1.3
# docker run --rm -it -v "$PWD":/workspace --name pyspark -p 8888:8888 -p 50070:50070 -p 8088:8088 -p 4040:4040 -p 5001:5000  jdvelasq/pyspark:3.1.3
#
FROM jdvelasq/hadoop:2.8.5

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# -- Spark ------------------------------------------------------------------------------
ENV SPARK_VERSION 3.1.3
ENV SPARK_HOME /opt/spark
ENV SPARK_DIST_CLASSPATH /opt/hadoop/etc/hadoop:/opt/hadoop/share/hadoop/common/lib/*:/opt/hadoop/share/hadoop/common/*:/opt/hadoop/share/hadoop/hdfs:/opt/hadoop/share/hadoop/hdfs/lib/*:/opt/hadoop/share/hadoop/hdfs/*:/opt/hadoop/share/hadoop/yarn/lib/*:/opt/hadoop/share/hadoop/yarn/*:/opt/hadoop/share/hadoop/mapreduce/lib/*:/opt/hadoop/share/hadoop/mapreduce/*:/usr/lib/jvm/java-8-openjdk-amd64/lib/tools.jar:/opt/hadoop/contrib/capacity-scheduler/*.jar
ENV PATH $PATH:/opt/spark/bin

RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    netcat \
    net-tools \
    && tar -xzf spark-$SPARK_VERSION-bin-without-hadoop.tgz \
    && mv spark-$SPARK_VERSION-bin-without-hadoop /opt/spark \
    && rm spark-$SPARK_VERSION-bin-without-hadoop.tgz \
    && rm -rf /var/lib/apt/lists/*

# && curl -O https://downloads.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop.tgz \

# -- PySpark ----------------------------------------------------------------------------

ENV PYSPARK_VERSION 3.1.3
ENV PYSPARK_DRIVER_PYTHON ipython
ENV PYSPARK_PYTHON python3

RUN pip3 install  --trusted-host pypi.python.org \
    findspark  \
    pyspark==$PYSPARK_VERSION


# -- Machine learning  ------------------------------------------------------------------
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    matplotlib \
    pandas \
    scikit-learn==1.0.2 \
    seaborn


# -- MLflow  ----------------------------------------------------------------------------
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    shap \
    SQLAlchemy \
    mlflow[extras]

# Parte generica
EXPOSE  50070  8088  8888  5000 4040
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND=dialog
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start && bash hadoop-start.sh && bash && bash hadoop-stop.sh