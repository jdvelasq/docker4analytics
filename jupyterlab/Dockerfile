#
# docker build --tag=jdvelasq/jupyterlab:3.2.9 .
# docker push jdvelasq/jupyterlab:3.2.9
# docker run --rm -it -v "$PWD":/workspace --name jupyterlab -p 8888:8888 jdvelasq/jupyterlab:3.2.9
# docker exec -it jupyterlab bash
# 
FROM jdvelasq/ubuntu:20.04

#########################################################################################
ENV LANG C.UTF-8 
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
WORKDIR /app
COPY . /app

#########################################################################################
RUN apt-get update \
    && apt update

#########################################################################################
RUN apt-get install -y ca-certificates xz-utils \
    && curl -O https://nodejs.org/dist/v16.4.0/node-v16.4.0-linux-x64.tar.xz \
    && tar -xf node-v16.4.0-linux-x64.tar.xz \
    && cp -r node-v16.4.0-linux-x64/* /usr/ \
    && ln -s "$(which node)" /usr/bin/nodejs

#########################################################################################
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \    
    jupyterlab-drawio

#########################################################################################
RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
    jupyterlab==3.2.9 \    
    && mkdir /root/.jupyter \
    && mv jupyter_notebook_config.py /root/.jupyter/ \
    && mkdir /root/.jupyter/lab \
    && mkdir /root/.jupyter/lab/user-settings \
    && mkdir /root/.jupyter/lab/user-settings/@jupyterlab \
    && mkdir /root/.jupyter/lab/user-settings/@jupyterlab/notebook-extension \
    && mv tracker.jupyterlab-settings /root/.jupyter/lab/user-settings/@jupyterlab/notebook-extension/

#########################################################################################
RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
    jupyterlab_code_formatter \
    black \
    isort \
    && mkdir /root/.jupyter/lab/user-settings/@ryantam626 \
    && mkdir /root/.jupyter/lab/user-settings/@ryantam626/jupyterlab_code_formatter \
    && mv settings_jupyterlab-settings /root/.jupyter/lab/user-settings/@ryantam626/jupyterlab_code_formatter/settings.jupyterlab-settings

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE   8888
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
SHELL ["/bin/bash", "-c"]
ENTRYPOINT jupyter lab












