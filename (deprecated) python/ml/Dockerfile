#
# docker build --tag=jdvelasq/python:3.6.9-ml .
# docker push jdvelasq/python:3.6.9-ml
# docker run --rm -it -v "$PWD":/datalake --name python-ml -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/python:3.6.9-ml
# docker run --rm -it -v datalake:/datalake --name python-ml -p 50070:50070 -p 8088:8088 -p 8888:8888 -p 5000:5000 jdvelasq/python:3.6.9-ml
# docker exec -it python-ml bash
#

FROM jdvelasq/python:3.6.9-minimal

ENV DEBIAN_FRONTEND noninteractive

# Capa compartida con Hive
RUN pip3 install --trusted-host pypi.python.org  \
        altair \
        networkx \
        numpy \
        seaborn \
        wordcloud

# Cartopy & GeoPandas
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        g++ \
        python3-dev \
        libproj-dev \
        proj-data \
        proj-bin \
        libgeos-dev \
        libgeos-c1v5 \
    && pip3 install --trusted-host pypi.python.org Cython \
    && pip3 install --trusted-host pypi.python.org  \ 
        six \
        pyshp \
        shapely \
        cartopy \
        geopandas \
        geoplot \
    && rm -rf /var/lib/apt/lists/*

# Python ML
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        python3-venv \
        libssh2-1-dev \ 
        build-essential \
        pylint \
        pandoc \
        csvkit \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --trusted-host pypi.python.org  \   
        bokeh \    
        dask \
        ipykernel \
        ipython-sql \
        nbsphinx \
        nltk \ 
        nose \          
        numba \
        paver \      
        Pygments \
        pymysql \    
        rednose \            
        sklearn \
        statsmodels \
        twine

# R Language
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        r-base \
        r-base-dev \
        r-recommended \
        libssl-dev \
        libffi-dev \
        libldap2-dev \
        libsasl2-dev \
        libxml2-dev \
        libzmq3-dev \
        libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --trusted-host pypi.python.org rpy2 \
    && Rscript -e "install.packages(c('tidyverse'), repos = 'http://cran.us.r-project.org')" \
    && Rscript -e "install.packages(c('devtools'), repos = 'http://cran.us.r-project.org')" \
    && Rscript -e "install.packages(c('txtplot'), repos = 'http://cran.us.r-project.org')"  

# Parte generica
EXPOSE   8888  5000  8000  6006 
RUN rm -rf /app/*
ENV DEBIAN_FRONTEND= 
# VOLUME /datalake
WORKDIR /datalake
ENTRYPOINT /etc/init.d/ssh start && bash
