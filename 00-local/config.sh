# 
# Configuración local de la maquna similar a Amazon EMR on EKS.
# Las versiones son las mismas de Google Colab en 2021-07-28
#
sudo -H pip3 install --upgrade pip
sudo -H pip3 install \
    jupyter \
    jupyterlab \
    ipykernel \
    matplotlib==3.2.2 \
    numpy==1.19.5 \
    pandas==1.1.5 \
    plotly==4.4.1 \
    requests==2.23.0 \
    scikit-learn==0.22.2.post1 \
    scipy==1.4.1 \
    seaborn==0.11.1 \
    pylint \
    black \
    isort \
    pytest \
    jupyterlab_code_formatter
