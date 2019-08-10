FROM jdvelasq/jupyterlab:minimal

ARG HDP_VERSION

WORKDIR /app
COPY .  /app

ENV DEBIAN_FRONTEND noninteractive

##
## Java
##
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        openjdk-8-jdk && \
    rm -rf /var/lib/apt/lists/*

##
## Hadoop
##
ENV PATH $PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin

ENV HADOOP_CLASSPATH  /usr/lib/jvm/java-8-openjdk-amd64/lib/tools.jar
ENV HADOOP_HOME  /usr/local/hadoop
ENV HADOOP_CONF_DIR  /usr/local/hadoop/etc/hadoop
ENV HADOOP_COMMON_LIB_NATIVE_DIR  /usr/local/hadoop/lib/native
ENV HADOOP_OPTS  "-Djava.library.path=/usr/local/hadoop/lib/native"
ENV HADOOP_ROOT_LOGGER  "ERROR,console"

RUN apt-get update && \ 
    apt-get install -yq --no-install-recommends curl && \
    curl -O https://www-eu.apache.org/dist/hadoop/common/hadoop-${HDP_VERSION}/hadoop-${HDP_VERSION}.tar.gz && \
    tar -xzf hadoop-${HDP_VERSION}.tar.gz && \
    mv hadoop-${HDP_VERSION} /usr/local/hadoop && \
    rm hadoop-${HDP_VERSION}.tar.gz && \
    chmod 0777 /usr/local/hadoop && \ 
    apt-get purge -yq curl && \
    apt-get autoremove -yq && \
    rm -rf /var/lib/apt/lists/*

RUN  mv conf/*  /usr/local/hadoop/etc/hadoop/ && \
     mv bin/*  /usr/local/bin/ && \
     mv etc/environment  /etc/environment
        
EXPOSE  50070  8088  8888  5000

RUN rm -rf /app/*

ENTRYPOINT ['bash', 'hdp-start.sh', '&&']

CMD ['jupyter lab', '--ip=0.0.0.0', '--allow-root', '--no-browser', '&&', 'bash hdp-stop.sh']

