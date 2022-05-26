#
# docker build --tag=jdvelasq/mariadb:10.3.34 .
# docker push jdvelasq/mariadb:10.3.34
# docker run --rm -it -v "$PWD":/workspace  --name mariadb -p 50070:50070 -p 8088:8088 -p 8888:8888 jdvelasq/mariadb:10.3.34
# docker exec -it sqoop bash
#
FROM jdvelasq/tez:0.7.1

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
    build-essential \
    gcc \
    libsasl2-dev \
    python3-dev

#########################################################################################
RUN apt-get install -yq --no-install-recommends \
    libmariadb-dev \
    mariadb-server

RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    mariadb

#########################################################################################
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    mysql-connector-python 

#########################################################################################
RUN apt-get --purge remove -y \
    build-essential \
    gcc \
    libsasl2-dev \
    python3-dev

#########################################################################################
EXPOSE 50070
EXPOSE 8088
EXPOSE 8888  
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start \
    && service mysql start \
    && rm -rf /tmp/hadoop-root/dfs/name \
    && hdfs namenode -format \
    && bash start-dfs.sh \
    && hdfs dfs -mkdir /tmp \
    && hdfs dfs -chmod 777 /tmp \
    && hdfs dfs -mkdir /user \
    && hdfs dfs -mkdir /user/root \
    && hdfs dfs -mkdir -p /apps/tez \
    && hdfs dfs -copyFromLocal ${TEZ_HOME}/share/tez-0.7.1.tar.gz /apps/tez/ \
    && bash start-yarn.sh \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  2.10.1" \
    && echo "           tez  0.7.1" \
    && echo "       mariadb  10.3.34" \
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
    && /bin/bash


