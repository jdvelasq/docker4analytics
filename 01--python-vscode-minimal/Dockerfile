#
# docker build --tag=jdvelasq/python3:vscode-minimal .
# docker push jdvelasq/python3:vscode-minimal
# docker run --rm -it -v "$PWD":/datalake --name python3-vscode-minimal -p 8888:8888 -p 5000:5000 jdvelasq/python3:vscode-minimal .
# docker run --rm -it -v datalake:/datalake --name python3-vscode-minimal -p 8888:8888 jdvelasq/python3:vscode-minimal .
# docker exec -it python3-vscode-minimal bash
#
# docker run --rm -it  --name python3-vscode-minimal -p 8888:8888 -p 5000:5000 jdvelasq/python3:vscode-minimal
#
FROM ubuntu:18.04

ENV LANG C.UTF-8 

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# -- Base -------------------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    apt-utils \
    bsdmainutils \
    curl \
    git \
    make \
    nano \
    wget \
    pandoc \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


# -- ssh --------------------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    pdsh \
    rsync \
    ssh \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && mv ssh/ssh_config /etc/ssh/ssh_config \
    && rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa \
    && ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa \
    && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
    && chmod 0600 /root/.ssh/authorized_keys  


# -- nodejs -----------------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -y ca-certificates xz-utils \
    && curl -O https://nodejs.org/dist/v16.4.0/node-v16.4.0-linux-x64.tar.xz \
    && tar -xf node-v16.4.0-linux-x64.tar.xz \
    && cp -r node-v16.4.0-linux-x64/* /usr/ \
    && ln -s "$(which node)" /usr/bin/nodejs \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


# -- Python 3 ---------------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    build-essential \
    python-dev \
    python3-minimal \
    python3-pip \
    python3-dev \       
    python3-venv \ 
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --upgrade pip \
    && pip install --trusted-host pypi.python.org  --default-timeout=100 \
    setuptools \
    wheel 


# -- Jupyter Lab ------------------------------------------------------------------------
RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
    jupyterlab \
    ipywidgets \
    ipykernel \
    && mkdir /root/.jupyter \
    && mv jupyter_notebook_config.py /root/.jupyter/ \
    && mkdir /root/.jupyter/lab \
    && mkdir /root/.jupyter/lab/user-settings \
    && mkdir /root/.jupyter/lab/user-settings/@jupyterlab \
    && mkdir /root/.jupyter/lab/user-settings/@jupyterlab/notebook-extension \
    && mv tracker.jupyterlab-settings /root/.jupyter/lab/user-settings/@jupyterlab/notebook-extension/


# -- Code Formater ----------------------------------------------------------------------
RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
    jupyterlab_code_formatter \
    black \
    isort


# -- Table of Content -------------------------------------------------------------------
RUN jupyter labextension install @jupyterlab/toc 

# -- DrawIO -----------------------------------------------------------------------------
RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
    jupyterlab-drawio


# -- VS code tools ----------------------------------------------------------------------
RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
    bandit \
    flake8 \
    jedi \
    mypy \
    nose \
    poetry \
    prospector \
    pycodestyle \
    pylama \
    pylint \
    pytest \
    rope \
    yapf









ENV DEBIAN_FRONTEND=dialog

#
# Parte generica
#
EXPOSE   8888  5000  8000  6006 
RUN rm -rf /app/*
WORKDIR /datalake
ENTRYPOINT /etc/init.d/ssh start && jupyter lab
