#
# docker build --tag=jdvelasq/tensorflow:2.8 .
# docker push jdvelasq/tensorflow:2.8
# docker run --rm -it -v "$PWD":/datalake --name tensorflow -p 8888:8888 -p 5001:5000 jdvelasq/tensorflow:2.8
# docker run --rm -it -v datalake:/datalake -name tensorflow -p 8888:8888 -p 5001:5000 jdvelasq/tensorflow:2.8
# docker exec -it tensorflow bash
#
# docker run --rm -it  --name tensorflow -p 8888:8888 -p 5000:5000 jdvelasq/tensorflow:2.8
#
# REPOSITORY         TAG          IMAGE ID       CREATED          SIZE
#
#
FROM jdvelasq/sklearn:1.0.2

ENV LANG C.UTF-8 

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    tensorflow \
    tensorboard \
    tensorflow-addons \
    tensorflow-datasets \
    tensorflow-estimator \
    tensorflow-gcs-config \
    tensorflow-hub \
    tensorflow-metadata \
    tensorflow-probability \
    tensorflow-text\
    tensorflow_decision_forests \
    git+https://github.com/tensorflow/docs \
    tensorflow-recommenders

RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
    keras-tuner


# -- Almacenamiento de modelos en formato HDF5 ------------------------------------------
RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
    pyyaml \
    h5py

# -- Visualizacion de modelos en TensorFlow ---------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    graphviz \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    pydot


# -- Parte generica ---------------------------------------------------------------------
EXPOSE   8888 6006 5000
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT jupyter lab