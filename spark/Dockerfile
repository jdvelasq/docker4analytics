#########################################################################################
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
ENV PATH $PATH:${SPARK_HOME}/bin

RUN tar -xzf spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
    && mv spark-${SPARK_VERSION}-bin-without-hadoop ${SPARK_HOME} \
    && rm spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
    && mv conf/spark-env.sh ${SPARK_HOME}/conf/

#########################################################################################
ENV PYSPARK_VERSION 3.1.3
ENV PYSPARK_DRIVER_PYTHON ipython
ENV PYSPARK_PYTHON python3

RUN pip3 install  --trusted-host pypi.python.org  \
    findspark  \
    matplotlib \
    mlflow[extras] \    
    pandas \
    pyspark==${PYSPARK_VERSION} \
    scikit-learn \
    shap \
    SQLAlchemy 

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE 4040
EXPOSE 8088
EXPOSE 8888
EXPOSE 50070
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND=dialog
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && rm -rf /tmp/hadoop-root/dfs/name \
    && hdfs namenode -format \
    && bash start-dfs.sh \
    && hdfs dfs -mkdir /tmp \
    && hdfs dfs -chmod 777 /tmp \
    && hdfs dfs -mkdir /user \
    && hdfs dfs -mkdir /user/root \
    && bash start-yarn.sh \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  2.10.1" \
    && echo "         spark  3.1.3" \
    && echo "---------------------------------------------------" \    
    && echo \
    && echo " Hadoop NameNode at: " \
    && echo \
    && echo "    http://127.0.0.1:50070/" \
    && echo \
    && echo " Yarn ResourceManager at: "\
    && echo \
    && echo "     http://127.0.0.1:8088/" \
    && echo \
    && echo "---------------------------------------------------" \
    && echo \
    && jupyter lab

