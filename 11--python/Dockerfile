#
# docker build --tag=jdvelasq/pyhon:3.8-ubuntu .
# docker push jdvelasq/python:3.8-ubuntu
# docker run --rm -it -v "$PWD":/workspace --name python3.8 -p 8888:8888 jdvelasq/python:3.8-ubuntu
# docker exec -it python3.8 bash
#
# 
FROM ubuntu:20.04

WORKDIR /app
COPY . /app

ENV LANG C.UTF-8 
ENV DEBIAN_FRONTEND noninteractive

# -- utils  -----------------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    wget \
    curl \
    tree \
    git-all \
    make \
    zip \
    unzip \
    bsdmainutils \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# -- python3  ---------------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    python3-pip \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


# -- pip upgrade ------------------------------------------------------------------------
RUN pip3 install --upgrade pip





# -- Parte generica ---------------------------------------------------------------------
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT /bin/bash







# RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
#     setuptools \
#     wheel 



# RUN apt-get update \
#     && apt-get install -yq --no-install-recommends \
#     apt-utils \
#     bsdmainutils \
#     build-essential \
#     bash \
#     bash-completion \
#     curl \
#     git \
#     make \
#     tree \
#     nano \
#     wget \
#     && apt-get autoremove -y \
#     && apt-get clean -y \
#     && rm -rf /var/lib/apt/lists/*


#    && echo "source /etc/profile.d/bash_completion.sh" >> /root/.bashrc \
#    && mv inputrc /root/.inputrc \


# -- ssh --------------------------------------------------------------------------------
# RUN apt-get update \
#     && apt-get install -yq --no-install-recommends \
#     pdsh \
#     rsync \
#     ssh \
#     && apt-get autoremove -y \
#     && apt-get clean -y \
#     && rm -rf /var/lib/apt/lists/* \
#     && mv ssh/ssh_config /etc/ssh/ssh_config \
#     && rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa \
#     && ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa \
#     && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
#     && chmod 0600 /root/.ssh/authorized_keys  






# -- Python 3 ---------------------------------------------------------------------------
# RUN apt-get update \
#     && apt-get install -yq --no-install-recommends \
#     python-dev \
#     python3-minimal \
#     python3-pip \
#     python3-dev \       
#     python3-venv \ 
#     && apt-get autoremove -y \
#     && apt-get clean -y \
#     && rm -rf /var/lib/apt/lists/*



# RUN add-apt-repository ppa:deadsnakes/ppa \
#     && apt-get update \
#     && apt-get install python3.9 \
#     && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1 \
#     && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2 \
#     && update-alternatives --config python3



# --- Herramientas usadas en todos los modulos -------------------------------------------
# RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
#     tdqm \
#    ipywidgets 

# -- Debugger ---------------------------------------------------------------------------
# RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
#     ipykernel \
#     notebook



# -- Table of Content -------------------------------------------------------------------
# RUN jupyter labextension install @jupyterlab/toc 

# -- DrawIO -----------------------------------------------------------------------------
# RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
#     jupyterlab-drawio


# -- VS code tools ----------------------------------------------------------------------
# RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
#     bandit \
#     flake8 \
#     jedi \
#     mypy \
#     nose \
#     poetry \
#     prospector \
#     pycodestyle \
#     pylama \
#     pylint \
#     pytest \
#     rope \
#     yapf


