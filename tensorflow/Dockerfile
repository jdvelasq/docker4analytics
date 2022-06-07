#########################################################################################
FROM jdvelasq/sklearn:1.1.1

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
    graphviz

#########################################################################################
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    git+https://github.com/tensorflow/docs \
    tensorboard \
    tensorflow==2.9.1 \
    tensorflow_decision_forests \
    tensorflow-addons \
    tensorflow-datasets \
    tensorflow-estimator \
    tensorflow-gcs-config \
    tensorflow-hub \
    tensorflow-metadata \
    tensorflow-probability \
    tensorflow-recommenders \
    tensorflow-text

RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    h5py \
    keras-tuner \
    pydot \
    pyyaml

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE 5000
EXPOSE 6006
EXPOSE 8888
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
SHELL ["/bin/bash", "-c"]
ENTRYPOINT jupyter lab