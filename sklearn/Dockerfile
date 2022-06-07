#########################################################################################
FROM jdvelasq/jupyterlab:3.4.2

#########################################################################################
ENV DEBIAN_FRONTEND noninteractive

#########################################################################################
RUN apt-get update \
    && apt update

#########################################################################################
RUN apt-get install -yq --no-install-recommends \
    sqlite3 \
    build-essential \
    gcc \
    python3-dev

#########################################################################################
RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
    datatest \
    dvc \
    faker \
    great_expectations \ 
    ipywidgets \
    luigi \
    matplotlib \
    mlflow \
    pandas \
    pyaml \
    pytest \
    scikit-learn==1.1.1 \
    seaborn \
    shap \
    SQLAlchemy \
    tdqm

#########################################################################################
RUN apt-get --purge remove -y \
    build-essential \
    gcc \
    python3-dev

#########################################################################################
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

#########################################################################################
EXPOSE 5000
EXPOSE 8082 
EXPOSE 8888
ENV DEBIAN_FRONTEND=dialog
RUN rm -rf /app/*
WORKDIR /workspace
SHELL ["/bin/bash", "-c"]
ENTRYPOINT jupyter lab



# graphviz==0.10.1 \ 
# ipykernel==4.10.1 \
# ipywidgets==7.6.5 \


# RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
#     ipympl \
#     voila \
#     voila-gridstack 

# -- Voila, bqplot, ipysheet  ----------------------------------------------------------
# RUN pip3 install --trusted-host pypi.python.org  --default-timeout=100 \
#     bqplot \
#     traitlets \
#     traittypes  \
#     ipysheet \


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
#     && apt install -yq --no-install-recommends graphviz 


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

