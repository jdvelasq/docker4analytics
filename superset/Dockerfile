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
    apache-superset \
    flask \
    jinja2 \
    pillow \
    Werkzeug==2.0.0 \
    && mv superset_config.py /root/superset_config.py \
    && mv superset.db /root/superset.db 

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
ENTRYPOINT echo "\n=========================\n\n\nRunning on http://127.0.0.1:8088/\n\n=========================\n" \
    && superset run -p 8088 --host 0.0.0.0 

# --with-threads --reload --debugger

# ENTRYPOINT superset db upgrade \
#     && /bin/bash 
#     && superset load_examples \ 
#     && superset fab create-admin \
#     && 
#     && superset init \
#     && superset run -p 8088 --host 0.0.0.0 --with-threads --reload --debugger
