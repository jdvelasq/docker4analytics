#
# docker build --tag=jdvelasq/python3:tensorflow .
# docker push jdvelasq/python3:tensorflow
# docker run --rm -it -v "$PWD":/datalake --name tensorflow -p 8888:8888 -p 5000:5000 jdvelasq/python3:tensorflow
# docker run --rm -it -v datalake:/datalake -name tensorflow -p 8888:8888 jdvelasq/python3:tensorflow
# docker exec -it tensorflow bash
#
# docker run --rm -it  --name tensorflow -p 8888:8888 -p 5000:5000 jdvelasq/python3:tensorflow
#
# REPOSITORY         TAG          IMAGE ID       CREATED          SIZE
# jdvelasq/python3   tensorflow   92276c1ffa50   17 seconds ago   3.03GB
#
FROM jdvelasq/python3:jupyterlab

ENV LANG C.UTF-8 

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive


RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    scikit-learn \
    matplotlib \
    pandas


RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    tensorflow \
    tensorboard \
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


# -- Almacenamiento de modelos en formato HDF5 ------------------------------------------
RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
    pyyaml \
    h5py

RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
    keras-tuner

# -- Paquetes requeridos para visualizar modelos de TF 2.x ------------------------------
RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
    tdqm \
    ipywidgets 

# -- Visualizacion de modelos en TensorFlow ---------------------------------------------
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    graphviz \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    pydot


ENV DEBIAN_FRONTEND=dialog

EXPOSE   8888 6006
RUN rm -rf /app/*
WORKDIR /datalake
# ENTRYPOINT /etc/init.d/ssh start && jupyter lab
ENTRYPOINT jupyter lab