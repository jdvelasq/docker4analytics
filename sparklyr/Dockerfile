FROM jdvelasq/jupyterlab:spark

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
## Sparklyr
## 

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        build-essential && \
    Rscript -e "install.packages('sparklyr', repos = 'http://cran.us.r-project.org')" && \
    Rscript -e "library(sparklyr); spark_install(version = '2.4')" && \
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