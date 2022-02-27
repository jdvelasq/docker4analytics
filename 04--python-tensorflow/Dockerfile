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
FROM jdvelasq/python3:aws-emr

ENV LANG C.UTF-8 

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive


# -- Tensorflow on Google Colab  --------------------------------------------------------
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    tensorflow==2.5.0 \
    tensorflow-datasets==4.0.1 \
    tensorflow-estimator==2.5.0 \
    tensorflow-gcs-config==2.5.0 \
    tensorflow-hub==0.12.0 \
    tensorflow-metadata==1.1.0 \
    tensorflow-probability==0.13.0

ENV DEBIAN_FRONTEND=dialog

#
# Parte generica
#
EXPOSE   8888  5000  8000  6006 
RUN rm -rf /app/*
WORKDIR /datalake
ENTRYPOINT /etc/init.d/ssh start && jupyter lab



# -- Graficación ------------------------------------------------------------------------
# RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
#     altair \
#     bokeh \
#     calmap \
#     chord \
#     circlify \
#     dash \
#     graphviz \
#     imageio \
#     leidenalg \
#     matplotlib \
#     matplotlib \        
#     matplotlib_venn \
#     mne \
#     networkx \
#     plotly \
#     pydotplus \
#     pydot \
#     python-igraph \
#     pywaffle \
#     scikit-image \
#     seaborn \
#     squarify \
#     yellowbrick \
#     wordcloud \
#     'plotnine[all]' \
#     pyviz \
#     holoviews


# RUN apt update \
#     && apt install -yq --no-install-recommends graphviz \
#     && apt autoremove -y \
#     && apt clean -y \
#     && rm -rf /var/lib/apt/lists/*


# -- Progress bars ----------------------------------------------------------------------
# RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
#     progressbar2 \
#     tdqm

# -- Desarrollo web ---------------------------------------------------------------------
# RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
#     flask  \
#     Jinja2 

# -- Scrapping --------------------------------------------------------------------------
# RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
#     bs4

# -- Machine Learning -------------------------------------------------------------------
# RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
#     statsmodels \
#     scikit-learn \
#     sklearn-pandas

# -- Text Analytics ---------------------------------------------------------------------
# RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
#     gensim \
#     nltk \
#     spacy \
#     gensim \
#     snowballstemmer


# -- Deep Learning ----------------------------------------------------------------------
# RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \    
#     tensorflow \
#     tensorboard \
#     tensorflow-addons \
#     tensorflow-datasets \
#     tensorflow-estimator \
#     tensorflow-hub \
#     tensorflow-text \
#     tensorflow_io \
#     pyyaml \
#     h5py \
#     keras-tuner && \
#     pip install -q git+https://github.com/tensorflow/docs && \
#     pip install -q git+https://github.com/tensorflow/examples.git

# -- Sphinx -----------------------------------------------------------------------------
# RUN pip3 --disable-pip-version-check --no-cache-dir install \
#     sphinx==4.0.3 \
#     sphinx-intl \
#     nbsphinx \
#     sphinx-rtd-theme \ 
#     sphinx_copybutton \    
#     pygments



# RUN echo "import nltk; nltk.download('stopwords'); nltk.download('wordnet'); nltk.download('averaged_perceptron_tagger')" > n.py \
#     && python3 n.py


##
## Cartopy & GeoPandas
##
# RUN apt-get update \
#     && apt-get install -yq --no-install-recommends \
#     libproj-dev \
#     proj-data \
#     proj-bin \
#     libgeos-dev \
#     libgeos-c1v5 \
#     && apt-get autoremove -y \
#     && apt-get clean -y \
#     && rm -rf /var/lib/apt/lists/* \
#     && pip install --trusted-host pypi.python.org --default-timeout=100 \
#     Cython \
#     && pip install --trusted-host pypi.python.org --default-timeout=100 \ 
#     six \
#     pyshp \
#     shapely \
#     cartopy \
#     geopandas \
#     geoplot

##
## R Language
##
# RUN apt-get update \
#     && apt-get install -yq --no-install-recommends \
#     r-base \
#     r-base-dev \
#     r-recommended \
#     libffi-dev \
#     libldap2-dev \
#     libsasl2-dev \
#     libxml2-dev \
#     libzmq3-dev \
#     libcurl4-openssl-dev \
#     libssh2-1-dev \
#     libssl-dev \
#     && apt-get autoremove -y \
#     && apt-get clean -y \
#     && rm -rf /var/lib/apt/lists/* \
#     && pip install --trusted-host pypi.python.org --default-timeout=100 rpy2==2.9.0 simplegeneric \
#     && Rscript -e "install.packages(c('formatR', 'styler'), repos = 'http://cran.us.r-project.org')" \
#     && Rscript -e "install.packages(c('devtools'), repos = 'http://cran.us.r-project.org')"  \
#     && Rscript -e "install.packages(c('tidyverse'), repos = 'http://cran.us.r-project.org')"  \
#     && Rscript -e "install.packages(c('tidytext'), repos = 'http://cran.us.r-project.org')" 

#     && Rscript -e "install.packages(c('ggraph'), repos = 'http://cran.us.r-project.org')"  \
#     && Rscript -e "install.packages(c('igraph'), repos = 'http://cran.us.r-project.org')"  \
#     && Rscript -e "install.packages(c('widyr'), repos = 'http://cran.us.r-project.org')"  \
#     && Rscript -e "install.packages(c('bibliometrix'), repos = 'http://cran.us.r-project.org')" 

