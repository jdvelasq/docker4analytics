#
#  docker build --tag=jdvelasq/sphinx:5.3.0  .
#  docker run --rm -v "$PWD":/app jdvelasq/sphinx:5.3.0
#  docker push jdvelasq/sphinx:5.3.0
#
#
FROM python:3.7-slim


WORKDIR /workspace

RUN apt-get update \
    && apt-get -yq --no-install-recommends install  pandoc  make \
    && apt-get clean \
    && apt-get autoremove -yq \
    && rm -rf /var/lib/apt/lists/* 

RUN pip install --trusted-host pypi.python.org \
    sphinx==4.5.0 \
    sphinx_rtd_theme \
    sphinx_copybutton \
    sphinx-book-theme \
    sphinx-autodoc-typehints \
    sphinx-intl \
    nbsphinx\
    docutils \
    pygments \
    ipykernel \
    MarkupSafe

ENTRYPOINT cd /workspace && make html
