#
# docker build --tag=jdvelasq/tensorflow:2.8 .
# docker push jdvelasq/tensorflow:2.8
# docker run --rm -it -v "$PWD":/workspace --name tensorflow -p 8888:8888 -p 5001:5000 jdvelasq/tensorflow:2.8
# docker run --rm -it -v datalake:/workspace -name tensorflow -p 8888:8888 -p 5001:5000 jdvelasq/tensorflow:2.8
# docker exec -it tensorflow bash
#
# docker run --rm -it  --name tensorflow -p 8888:8888 -p 5000:5000 jdvelasq/tensorflow:2.8
#
FROM jdvelasq/sklearn:1.0.2

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
    tensorflow \
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
    && rm -rf /var/lib/apt/lists/*

RUN apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE 8888
EXPOSE 6006
EXPOSE 5000
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
ENTRYPOINT jupyter lab