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
RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
    numpy==1.18.5 \
    pandas==1.0.5 \
    pandas-datareader==0.8.1 \
    pandas-gbq==0.11.0 \
    pandas-profiling==1.4.1 \
    scipy==1.4.1 \
    SQLAlchemy==1.3.19 \
    matplotlib==3.2.2 \
    statsmodels==0.10.2 \
    scikit-learn==0.22.2.post1 \
    sklearn-pandas==1.8.0 \
    progressbar2==3.38.0 \
    ipywidgets==7.5.1 \
    flask==1.1.2    

RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
    altair==4.1.0 \
    gensim==3.6.0 \
    Jinja2==2.11.2 \
    networkx==2.5 \
    seaborn==0.10.1 \
    textblob==0.15.3 \
    widgetsnbextension==3.5.1 \
    wordcloud==1.5.0



RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \
    nltk==3.5 \
    spacy==2.2.4 \
    gensim==3.6.0 \
    snowballstemmer==2.0.0

RUN pip install --trusted-host pypi.python.org  --default-timeout=100 \    
    tensorflow==2.3.0 \
    tensorboard==2.3.0 \
    tensorflow-addons==0.8.3 \
    tensorflow-datasets==2.1.0 \
    tensorflow-estimator==2.3.0


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

