#
# docker build --tag=jdvelasq/sqoop:1.4.7 .
# docker push jdvelasq/sqoop:1.4.7
# docker run --rm -it -v "$PWD":/datalake  --name hive -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/sqoop:1.4.7
# docker run --rm -it -v datalake:/datalake --name hive  -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/sqoop:1.4.7
# docker exec -it hive bash
#
FROM jdvelasq/hadoop:2.10.1

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    mysql-connector-python \
    pandas

#########################################################################################
#
#  https://github.com/xerial/sqlite-jdbc
#  http://archive.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
#  http://ftp.ntu.edu.tw/MySQL/Downloads/Connector-J/mysql-connector-java-5.1.49.tar.gz
#
ENV SQOOP_VERSION 1.4.7
ENV SQOOP_HOME /opt/sqoop
ENV PATH $PATH:/opt/sqoop/bin  
ENV HADOOP_COMMON_HOME /opt/hadoop 
ENV HADOOP_MAPRED_HOME /opt/hadoop
ENV HADOOP_CLASSPATH $HADOOP_CLASSPATH:/opt/sqoop/lib/sqlite-jdbc-3.36.0.3.jar

RUN tar -xzf sqoop-$SQOOP_VERSION.bin__hadoop-2.6.0.tar.gz \
    && mv sqoop-$SQOOP_VERSION.bin__hadoop-2.6.0 /opt/sqoop \
    && rm sqoop-$SQOOP_VERSION.bin__hadoop-2.6.0.tar.gz \
    && mv conf/sqoop-env.sh /opt/sqoop/conf/

#########################################################################################
RUN tar -xzf mysql-connector-java-5.1.49.tar.gz \
    && mv mysql-connector-java-5.1.49/mysql-connector-java-5.1.49-bin.jar /opt/sqoop/lib 

#########################################################################################
EXPOSE 50070
EXPOSE 8088
EXPOSE 8888  
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && bash hadoop-start.sh \
    && /bin/bash

# service mysql start
# apt-get update --quiet
# apt-get install -yq libmariadb-dev
# apt-get install -yq build-essential gcc python3-dev
# pip3 install --quiet mariadb
# RUN apt install -yq mariadb-server
#
# RUN mv sqlite-jdbc-3.36.0.3.jar /opt/sqoop/lib
# RUN mv mariadb-java-client-3.0.4.jar /opt/sqoop/lib
#


