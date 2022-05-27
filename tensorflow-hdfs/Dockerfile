#
# docker build --tag=jdvelasq/tensorflow:2.8 .
# docker push jdvelasq/tensorflow:2.8
# docker run --rm -it -v "$PWD":/workspace --name tensorflow -p 8888:8888 -p 5001:5000 jdvelasq/tensorflow:2.8
# docker run --rm -it -v datalake:/workspace -name tensorflow -p 8888:8888 -p 5001:5000 jdvelasq/tensorflow:2.8
# docker exec -it tensorflow bash
#
# docker run --rm -it  --name tensorflow -p 8888:8888 -p 5000:5000 jdvelasq/tensorflow:2.8
#
FROM jdvelasq/hadoop:3.2.1

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
    graphviz

#########################################################################################
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    matplotlib \
    pandas \
    scikit-learn \
    tensorflow \
    tensorflow_decision_forests \
    tensorflow-datasets \
    tensorflow-recommenders \
    tensorflow-text

RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    h5py \
    keras-tuner \
    pydot \
    pyyaml

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE 5000
EXPOSE 6006
EXPOSE 8088
EXPOSE 8888
EXPOSE 50070
EXPOSE 9999
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
SHELL ["/bin/bash", "-c"]
ENTRYPOINT /etc/init.d/ssh start \
    && rm -rf /tmp/hadoop-root/dfs/name \
    && hdfs namenode -format \
    && bash start-dfs.sh \
    && bash start-yarn.sh \
    && hdfs dfs -mkdir /tmp \
    && hdfs dfs -chmod 777 /tmp \
    && hdfs dfs -mkdir /user \
    && hdfs dfs -mkdir /user/root \
    && echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "    jupyterlab  3.2.9" \
    && echo "        hadoop  3.2.1" \
    && echo "    tensorflow  2.9.1" \
    && echo "---------------------------------------------------" \    
    && echo \
    && echo " Hadoop NameNode at: " \
    && echo \
    && echo "    http://127.0.0.1:9870/" \
    && echo \
    && echo " Yarn ResourceManager at: "\
    && echo \
    && echo "     http://127.0.0.1:8088/" \
    && echo \
    && echo "---------------------------------------------------" \
    && echo \
    && jupyter lab