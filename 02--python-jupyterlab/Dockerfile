#
# docker build --tag=jdvelasq/python3:jupyterlab .
# docker push jdvelasq/python3:jupyterlab
# docker run --rm -it -v "$PWD":/workspace --name python3-jupyterlab -p 8888:8888 -p 5001:5000 jdvelasq/python3:jupyterlab .
# docker exec -it python3-jupyterlab bash
#
# docker run --rm -it  --name python3-jupyterlab -p 8888:8888 -p 5001:5000 jdvelasq/python3:jupyterlab
#
# REPOSITORY         TAG          IMAGE ID       CREATED          SIZE
# jdvelasq/python3   jupyterlab   f9bdce8b7f47   17 minutes ago   912MB
# 
FROM python:3.9

ENV LANG C.UTF-8 

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# -- wget / curl  -----------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    wget \
    curl \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

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

# -- pip upgrade ------------------------------------------------------------------------
RUN pip3 install --upgrade pip

# -- draw.io ----------------------------------------------------------------------------
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \    
    jupyterlab-drawio


# -- Jupyter Lab ------------------------------------------------------------------------
RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
    jupyterlab==3.2.9 \
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
    isort \
    && mkdir /root/.jupyter/lab/user-settings/@ryantam626 \
    && mkdir /root/.jupyter/lab/user-settings/@ryantam626/jupyterlab_code_formatter \
    && mv settings_jupyterlab-settings /root/.jupyter/lab/user-settings/@ryantam626/jupyterlab_code_formatter/settings.jupyterlab-settings



# -- Parte generica ---------------------------------------------------------------------
EXPOSE   8888  6006
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
SHELL ["/bin/bash", "-c"]
ENTRYPOINT jupyter lab







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


