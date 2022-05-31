#########################################################################################
FROM jdvelasq/ubuntu:20.04

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
RUN apt-get update \
    && apt update


#########################################################################################
#
# nodejs
#
#########################################################################################
RUN apt-get install -y ca-certificates xz-utils \
    && curl -O https://nodejs.org/dist/v16.4.0/node-v16.4.0-linux-x64.tar.xz \
    && tar -xf node-v16.4.0-linux-x64.tar.xz \
    && cp -r node-v16.4.0-linux-x64/* /usr/ \
    && ln -s "$(which node)" /usr/bin/nodejs


RUN apt-get install -yq --no-install-recommends \    
    sqlite

RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    pandas \
    SQLAlchemy


#########################################################################################
#
# Hue
#
#########################################################################################
RUN apt-get install -yq --no-install-recommends \
    ant \
    g++ \
    gcc \
    libgmp3-dev \
    libkrb5-dev \
    libldap2-dev \
    libmysqlclient-dev \
    libsasl2-dev \
    libsasl2-modules-gssapi-mit \
    libsqlite3-dev \
    libssl-dev \
    libtidy-dev \
    libxml2-dev \
    libxslt-dev \
    python-dev \
    python-setuptools \
    rsync 

#########################################################################################
ENV HUE_VERSION 4.10.0
ENV HUE_HOME /opt/hue
ENV PATH $PATH:${HUE_HOME}/build/env/bin  

RUN tar -xvzf hue-${HUE_VERSION}.tgz \
    && rm hue-${HUE_VERSION}.tgz 

WORKDIR /app/hue-${HUE_VERSION}
RUN PREFIX=/opt make install

RUN cp /app/conf/* ${HUE_HOME}/desktop/conf/

RUN useradd -ms /bin/bash hue && chown -R hue /opt/hue


# RUN apt-get --purge remove -y \
#     ant \
#     g++ \
#     gcc \
#     libgmp3-dev \
#     libkrb5-dev \
#     libldap2-dev \
#     libmysqlclient-dev \
#     libsasl2-dev \
#     libsasl2-modules-gssapi-mit \
#     libsqlite3-dev \ 
#     libssl-dev \ 
#     libtidy-dev \
#     libxml2-dev \ 
#     python-dev \
#     python-setuptools


# RUN pip3 install mysql-python

#########################################################################################
# RUN apt-get --purge remove -y \
#     build-essential \
#     gcc \
#     libsasl2-dev \
#     python3-dev

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE 8888  
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT echo \
    && echo "---------------------< stack >---------------------" \
    && echo " apache/ubuntu  20.04" \
    && echo "       mariadb  10.3.34" \
    && echo "           hue  4.10.0" \
    && echo "---------------------------------------------------" \    
    && echo \
    && echo \
    && echo "---------------------------------------------------" \
    && echo \
    && hue syncdb --noinput \
    && hue migrate \
    && supervisor 


