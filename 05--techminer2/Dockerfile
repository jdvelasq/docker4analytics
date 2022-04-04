#
# docker build --tag=jdvelasq/techminer2:0.0.0 --no-cache .
# docker push jdvelasq/jdvelasq/techminer2:0.0.0
# docker run --rm -it -v "$PWD":/datalake --name aws-emr -p 8888:8888  jdvelasq/techminer2:0.0.0
# docker run --rm -it -v datalake:/datalake -name aws-emr -p 8888:8888 jdvelasq/techminer2:0.0.0
# docker exec -it techminer2 bash
#
# docker run --rm -it  --name aws-emr -p 8888:8888 jdvelasq/techminer2:0.0.0
#

FROM jdvelasq/jupyterlab:3.2.9

ENV LANG C.UTF-8 

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# -- Package development ----------------------------------------------------------------
RUN pip3 install --upgrade pip

RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    "cdlib==0.2.5" \
    "python-Levenshtein==0.12.2" \
    "squarify==0.4.3" \
    circlify  \
    matplotlib \
    networkx==2.6.3 \
    nltk==3.2.5 \
    pandas \
    PyYAML \
    seaborn \
    textblob \
    wordcloud 


RUN python3 -c "import nltk; nltk.download('punkt'); nltk.download('brown'); nltk.download('averaged_perceptron_tagger'); nltk.download('stopwords'); "
RUN pip3 install -q -U git+https://github.com/jdvelasq/techminer2
ENV DEBIAN_FRONTEND=dialog

#
# Parte generica
#
EXPOSE   8888
RUN rm -rf /app/*
WORKDIR /workspace
SHELL ["/bin/bash", "-c"]
ENTRYPOINT jupyter lab
