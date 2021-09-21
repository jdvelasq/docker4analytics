#
#  docker build --tag=jdvelasq/sphinx:3.0.4  .
#  docker run --rm -v "$PWD":/app jdvelasq/sphinx:3.0.4
#  docker push jdvelasq/sphinx:3.0.4
#
# REPOSITORY        TAG       IMAGE ID       CREATED              SIZE
# jdvelasq/sphinx   3.0.4     4fd741635121   About a minute ago   402MB
#
FROM python:3.7-slim

WORKDIR /app

RUN apt-get update \
    && apt-get -yq --no-install-recommends install  pandoc  make \
    && apt-get clean \
    && apt-get autoremove -yq \
    && rm -rf /var/lib/apt/lists/* 

RUN pip install --trusted-host pypi.python.org \
    sphinx==4.0.3 \
    sphinx_rtd_theme \
    sphinx_copybutton \
    sphinx-book-theme \
    sphinx-autodoc-typehints \
    sphinx-intl \
    nbsphinx==0.8.5\
    docutils==0.16 \
    pygments \
    ipykernel 

VOLUME /datalake

ENTRYPOINT cd /app && make html && cp /tmp/sphinx-*.log /app/
