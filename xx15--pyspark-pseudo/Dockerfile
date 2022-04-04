#
# docker build --tag=jdvelasq/pyspark:3.0.1-pseudo .
# docker push jdvelasq/pyspark:3.0.1-pseudo
# docker run --rm -it -v "$PWD":/datalake  --name pyspark -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/pyspark:3.0.1-pseudo
# docker run --rm -it -v datalake:/datalake --name pyspark  -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/pyspark:3.0.1-pseudo
# docker exec -it pyspark bash
#
FROM jdvelasq/spark:3.1.3

ENV PYSPARK_VERSION 3.1.3

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# Capa conpartida con python-ml
# RUN pip3 install --trusted-host pypi.python.org  \
#         altair \
#         matplotlib \
#         networkx \
#         numpy \
#         pandas \
#         seaborn \
#         wordcloud

# PySpark
ENV PYSPARK_DRIVER_PYTHON ipython
ENV PYSPARK_PYTHON python3
RUN pip3 install  --trusted-host pypi.python.org \
        findspark  \
        pyspark==$PYSPARK_VERSION

# Parte generica
EXPOSE  50070  8088  8888  5000
EXPOSE  8881   8880  4040  4041
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
WORKDIR /workspace
ENTRYPOINT /etc/init.d/ssh start && bash hadoop-start.sh && bash && bash hadoop-stop.sh