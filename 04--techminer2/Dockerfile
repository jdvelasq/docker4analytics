#
# docker build --tag=jdvelasq/python3:techminer2 .
# docker push jdvelasq/python3:techminer2
# docker run --rm -it -v "$PWD":/datalake --name aws-emr -p 8888:8888 -p 5000:5000 jdvelasq/python3:techminer2
# docker run --rm -it -v datalake:/datalake -name aws-emr -p 8888:8888 jdvelasq/python3:techminer2
# docker exec -it techminer2 bash
#
# docker run --rm -it  --name aws-emr -p 8888:8888 -p 5000:5000 jdvelasq/python3:techminer2
#

FROM jdvelasq/python3:aws-emr

ENV LANG C.UTF-8 

WORKDIR /app
COPY . /app


ENV DEBIAN_FRONTEND noninteractive

# -- Package development ----------------------------------------------------------------
RUN pip3 install --upgrade pip

RUN pip3 install -q -U git+https://github.com/jdvelasq/techminer2

ENV DEBIAN_FRONTEND=dialog

#
# Parte generica
#
EXPOSE   8888  8866 5000  8000  6006 
RUN rm -rf /app/*
WORKDIR /datalake
SHELL ["/bin/bash", "-c"]
ENTRYPOINT /etc/init.d/ssh start && jupyter lab
