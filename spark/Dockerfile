#
# docker build --tag=jdvelasq/pyspark:3.1.3 .
# docker push jdvelasq/pyspark:3.1.3
# docker run --rm -it -v "$PWD":/workspace --name pyspark -p 8888:8888 -p 50070:50070 -p 8088:8088 -p 4040:4040 -p 5001:5000  jdvelasq/pyspark:3.1.3
#
FROM jdvelasq/hadoop:2.10.1

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
RUN apt-get update \
    && apt update

#########################################################################################
RUN apt-get install -yq --no-install-recommends \    
    netcat \
    net-tools

#########################################################################################
#
# curl -O https://downloads.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop.tgz
#
ENV SPARK_VERSION 3.1.3
ENV SPARK_HOME /opt/spark
ENV PATH $PATH:/opt/spark/bin

RUN tar -xzf spark-$SPARK_VERSION-bin-without-hadoop.tgz \
    && mv spark-$SPARK_VERSION-bin-without-hadoop /opt/spark \
    && rm spark-$SPARK_VERSION-bin-without-hadoop.tgz \
    && mv conf/spark-env.sh /opt/spark/conf/

#########################################################################################
ENV PYSPARK_VERSION 3.1.3
ENV PYSPARK_DRIVER_PYTHON ipython
ENV PYSPARK_PYTHON python3

RUN pip3 install  --trusted-host pypi.python.org  \
    findspark  \
    matplotlib \
    mlflow[extras] \    
    pandas \
    pyspark==$PYSPARK_VERSION \
    scikit-learn==1.0.2 \
    shap \
    SQLAlchemy 

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE 4040
EXPOSE 50070
EXPOSE 8088
EXPOSE 8888
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND=dialog
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && bash hadoop-start.sh \
    && bash 