#
# docker build --tag=jdvelasq/python3:colab .
# docker push jdvelasq/python3:colab
# docker run --rm -it -v "$PWD":/datalake --name colab -p 8888:8888 -p 5000:5000 jdvelasq/python3:colab
# docker run --rm -it -v datalake:/datalake -name colab -p 8888:8888 jdvelasq/python3:colab
# docker exec -it colab bash
#
# docker run --rm -it  --name colab -p 8888:8888 -p 5000:5000 jdvelasq/python3:colab
#
FROM jdvelasq/python3:vscode-minimal

ENV LANG C.UTF-8 

WORKDIR /app
COPY . /app

ENV DEBIAN_FRONTEND noninteractive

# RUN pip3 install --trusted-host pypi.python.org --default-timeout=100  --user -r requeriments.txt


##
## Python Data Science & ML
##
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    numpy \
    pandas \
    pandas-datareader \
    pandas-gbq \
    pandas-profiling \
    SQLAlchemy \
    matplotlib \
    scipy \
    statsmodels \
    scikit-learn \
    sklearn-pandas \
    progressbar2 \
    ipywidgets \
    flask  \
    pydotplus  

RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
    altair \
    gensim \
    Jinja2 \
    networkx \
    seaborn \
    textblob \
    widgetsnbextension \
    wordcloud

RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
    nltk \
    spacy \
    gensim \
    snowballstemmer

RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \    
    tensorflow \
    tensorboard \
    tensorflow-addons \
    tensorflow-datasets \
    tensorflow-estimator \
    tensorflow-hub \
    tensorflow-text \
    tensorflow_io \
    pyyaml \
    h5py \
    keras-tuner


RUN pip install -q git+https://github.com/tensorflow/docs

RUN pip install -q git+https://github.com/tensorflow/examples.git

RUN apt update \
    && apt install -yq --no-install-recommends graphviz \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=dialog

#
# Parte generica
#
EXPOSE   8888  5000  8000  6006 
RUN rm -rf /app/*
WORKDIR /datalake
ENTRYPOINT /etc/init.d/ssh start && jupyter lab


# RUN echo "import nltk; nltk.download('stopwords'); nltk.download('wordnet'); nltk.download('averaged_perceptron_tagger')" > n.py \
#     && python3 n.py

# RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
#     graphviz \
#     h5py \
#     ipython-sql \
#     pydot \
#     pygments \
#     pymysql \    
#     pyPDF2 \
#     pyyaml \
#     tables \
#     bs4

# RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
#     flask \
#     WTForms \
#     Flask-WTF

# RUN pip install --trusted-host pypi.python.org  \
#     altair \
#     bokeh \
#     dash \
#     imageio \
#     matplotlib \        
#     networkx \
#     plotly \
#     scikit-image \
#     seaborn \
#     vega_datasets \
#     wordcloud \
#     squarify \
#     pywaffle \
#     calmap \
#     python-igraph \
#     leidenalg 


#
# TensorFlow 2.0
#

# RUN pip install --trusted-host pypi.python.org --upgrade --default-timeout=100 \
#     tensorflow==2.0.1 

# RUN pip install --trusted-host pypi.python.org --default-timeout=100 \
#     tensorflow-transform \
#     tensorflow_hub \
#     tensorflow-text 

# RUN pip install --trusted-host pypi.python.org --default-timeout=100 \    
#     git+https://github.com/tensorflow/docs \
#     git+https://github.com/tensorflow/examples.git \
#     tensorflow_datasets 



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

