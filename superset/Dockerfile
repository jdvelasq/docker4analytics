#
# docker build --tag=jdvelasq/superset:1.5.0 .
# docker push jdvelasq/superset:1.5.0
# docker run --rm -it -v "$PWD":/workspace --name superset -p 8888:8888 -p 5001:5000 jdvelasq/superset:1.5.0
# docker run --rm -it -v datalake:/workspace -name superset -p 8888:8888 -p 5001:5000 jdvelasq/superset:1.5.0
# docker exec -it superset bash
#
FROM ubuntu:20.04

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
    default-libmysqlclient-dev \
    libffi-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    python3-dev \
    python3-pip

#########################################################################################
ENV SUPERSET_CONFIG_PATH /root/superset_config.py
ENV FLASK_APP=superset
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    flask \
    apache-superset \
    && mv superset_config.py /root/superset_config.py

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE 8088
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT superset db upgrade \
    && superset fab create-admin \
    && superset load_examples \
    && superset init
