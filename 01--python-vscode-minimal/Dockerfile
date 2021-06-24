#
# docker build --tag=jdvelasq/python3:vscode-minimal .
# docker push jdvelasq/python3:vscode-minimal
# docker run --rm -it -v "$PWD":/datalake --name python3-vscode-minimal -p 8888:8888 -p 5000:5000 jdvelasq/python3:vscode-minimal .
# docker run --rm -it -v datalake:/datalake --name python3-vscode-minimal -p 8888:8888 jdvelasq/python3:vscode-minimal .
# docker exec -it python3-vscode-minimal bash
#
# docker run --rm -it  --name python3-vscode-minimal -p 8888:8888 -p 5000:5000 jdvelasq/python3:vscode-minimal
#
FROM ubuntu:20.04

ENV LANG C.UTF-8 

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

##
##  Base
##
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    apt-utils \
    bsdmainutils \
    curl \
    git \
    nano \
    wget \
    make \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

##
##  ssh 
##
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

##
## nodejs
##
RUN apt-get update \
    && apt-get install -y ca-certificates xz-utils \
    && curl -O https://nodejs.org/dist/v13.12.0/node-v13.12.0-linux-x64.tar.xz \
    && tar -xf node-v13.12.0-linux-x64.tar.xz \
    && cp -r node-v13.12.0-linux-x64/* /usr/ \
    && ln -s "$(which node)" /usr/bin/nodejs \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

##
## Essencials
##
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    build-essential \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*     


RUN apt update \
    && apt install -yq --no-install-recommends \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt install -yq --no-install-recommends \
    python3-pip \
    python3.9 \
    python3.9-dev \
    python3-dev \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/* 


##
## Jupyter Lab
##

#    python3-minimal \
#    python3-pip \
#    python3-dev \       
# python-dev \

RUN pip3 install --upgrade pip \
    && pip install --trusted-host pypi.python.org  --default-timeout=100 \
    setuptools \
    wheel \
    && pip install --trusted-host pypi.python.org --default-timeout=100 \
    jupyterlab \
    && mkdir /root/.jupyter \
    && mv jupyter_notebook_config.py /root/.jupyter/ \
    && mkdir /root/.jupyter/lab \
    && mkdir /root/.jupyter/lab/user-settings \
    && mkdir /root/.jupyter/lab/user-settings/@jupyterlab \
    && mkdir /root/.jupyter/lab/user-settings/@jupyterlab/notebook-extension \
    && mv tracker.jupyterlab-settings /root/.jupyter/lab/user-settings/@jupyterlab/notebook-extension/


# "jupyterLab>=2.2.0,<3.0.0a0" \

##
## Jupyter Lab extensions
##
# RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager 
# RUN jupyter labextension install @lckr/jupyterlab_variableinspector
# RUN jupyter labextension install @jupyterlab/toc 
# RUN jupyter labextension install @jupyterlab/github
# RUN pip install lckr-jupyterlab-variableinspector
RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
    jupyterlab_code_formatter \
    black \
    isort

# RUN jupyter labextension install \
#     @ryantam626/jupyterlab_code_formatter \
#     && pip install --trusted-host pypi.python.org --default-timeout=100 \
#     jupyterlab_code_formatter \
#     black \
#     isort \
#     && jupyter serverextension enable --system --py jupyterlab_code_formatter
# RUN jupyter labextension install nbdime-jupyterlab@2.0.0 \
#     && pip install --trusted-host pypi.python.org --upgrade --default-timeout=100 jupyterlab-git \
#     && jupyter lab build
## requiere 'jupyterLab >=2.2.0,<3.0.0a0'
# RUN pip install --trusted-host pypi.python.org --default-timeout=100 jupyter-lsp \
#     && jupyter labextension install @krassowski/jupyterlab-lsp \
#     && pip install --trusted-host pypi.python.org --default-timeout=100 'python-language-server[all]'

##
## VS Code
##
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




# RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
#     graphviz \
#     h5py \
#     ipython-sql \
#     pydot \
#     pygments \
#     pymysql \    
#     pyPDF2 \
#     pyyaml \
#     tables \
#     bs4

# RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
#     flask \
#     WTForms \
#     Flask-WTF

# RUN pip install --trusted-host pypi.python.org  \
#     altair \
#     bokeh \
#     dash \
#     imageio \
#     matplotlib \        
#     networkx \
#     plotly \
#     scikit-image \
#     seaborn \
#     vega_datasets \
#     wordcloud \
#     squarify \
#     pywaffle \
#     calmap \
#     python-igraph \
#     leidenalg 



ENV DEBIAN_FRONTEND=dialog

#
# Parte generica
#
EXPOSE   8888  5000  8000  6006 
RUN rm -rf /app/*
WORKDIR /datalake
ENTRYPOINT /etc/init.d/ssh start && jupyter lab
