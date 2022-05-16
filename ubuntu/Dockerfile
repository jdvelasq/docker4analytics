#
# docker build --tag=jdvelasq/ubuntu:20.04 .
# docker push jdvelasq/ubuntu:20.04
# docker run --rm -it --name ubuntu jdvelasq/ubuntu:20.04
#
FROM ubuntu:20.04

#########################################################################################
ENV LANG C.UTF-8 
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
RUN apt-get update \
    && apt update

#########################################################################################
RUN apt-get install -yq --no-install-recommends \
    bsdmainutils \
    curl \
    git-all \
    less \
    make \
    nano \
    python3-pip \
    tree \
    unzip \
    vim \
    wget \
    zip

#########################################################################################
RUN pip3 install --upgrade pip \
    && pip3 install csvkit

#########################################################################################
RUN apt install -yq --no-install-recommends \
    python3.8-venv 

#########################################################################################
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt update \
    && apt install gh

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT /bin/bash 
