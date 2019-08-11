FROM jdvelasq/jupyterlab:minimal-2019-2

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

##
## Python - base
##
RUN pip3 install --trusted-host pypi.python.org  \
         numpy    pandas   matplotlib   wordcloud

##
## Data Science 
##
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        python3-venv \
        libssh2-1-dev && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install --trusted-host pypi.python.org  \       
        dask        numba \
        sklearn     statsmodels \
        tensorflow  mxnet       \
        seaborn     altair      bokeh       networkx   \
        rednose     nose        paver && \
    pip3 install torch==1.2.0+cpu torchvision==0.4.0+cpu -f https://download.pytorch.org/whl/torch_stable.html



##
## R + IRkernel
##
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
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
        build-essential && \
    pip3 install --trusted-host pypi.python.org rpy2 && \
    Rscript -e "install.packages(c('repr', 'IRdisplay', 'IRkernel', 'dplyr'), repos = 'http://cran.us.r-project.org', type = 'source'); IRkernel::installspec(user=FALSE)"  && \
    Rscript -e "IRkernel::installspec(user=FALSE)" && \
    apt-get purge -yq build-essential && \
    apt-get autoremove -yq && \
    rm -rf /var/lib/apt/lists/*


##
## R tidyverse + tensorflow-for-R
##
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        build-essential && \
    Rscript -e "install.packages(c('tidyverse'), repos = 'http://cran.us.r-project.org')"  && \
    Rscript -e "install.packages(c('devtools'), repos = 'http://cran.us.r-project.org')"  && \
    Rscript -e "devtools::install_github('rstudio/tensorflow')"  && \
    Rscript -e "library(tensorflow); install_tensorflow()"  && \
    apt-get purge -yq build-essential && \
    apt-get autoremove -yq && \
    rm -rf /tmp/R*


RUN pip3 install rpy2


##
## MySql
##
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        mysql-server && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --trusted-host pypi.python.org  \ 
        ipython-sql   pymysql

##
## 
##  Cartopy & GeoPandas
##
##
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        g++  python3-dev   libproj-dev  proj-data  proj-bin  libgeos-dev  libgeos-c1v5 && \
    pip3 install --trusted-host pypi.python.org  \ 
        Cython && \
    pip3 install --trusted-host pypi.python.org  \ 
        six  pyshp  shapely  cartopy  geopandas  geoplot && \
    apt-get purge -yq python3-dev  g++  && \
    apt-get autoremove -yq && \
    rm -rf /var/lib/apt/lists/*

##
## Puertos
##
EXPOSE   8888  5000  8000  6006  

CMD jupyter lab --ip=0.0.0.0 --allow-root --no-browser