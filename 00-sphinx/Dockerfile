#
# How to run:
#
#    docker run --rm -v "$PWD":/app jdvelasq/sphinx:2.2.1
#
# How to make:
#
#    docker build --tag=jdvelasq/sphinx:2.2.1  .
#
# How to push:
#
#    docker push jdvelasq/sphinx:2.2.1
#

FROM python:3.7-slim

WORKDIR /app

RUN apt-get update \
    && apt-get -yq --no-install-recommends install  pandoc  make \
    && apt-get clean \
    && apt-get autoremove -yq \
    && rm -rf /var/lib/apt/lists/* 

RUN pip install --trusted-host pypi.python.org \
        sphinx==2.2.1 \
        sphinx_rtd_theme \
        sphinx_copybutton \
        nbsphinx \
        pygments \
        ipykernel 

VOLUME /datalake

ENTRYPOINT cd /app && make html
