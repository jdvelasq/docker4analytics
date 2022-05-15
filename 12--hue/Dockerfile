#
# docker build --tag=jdvelasq/pyhon:3.8-ubuntu .
# docker push jdvelasq/python:3.8-ubuntu
# docker run --rm -it -v "$PWD":/workspace --name python3.8 -p 8888:8888 jdvelasq/python:3.8-ubuntu
# docker exec -it python3.8 bash
#
# 
FROM ubuntu:20.04

WORKDIR /app
COPY . /app

ENV LANG C.UTF-8 
ENV DEBIAN_FRONTEND noninteractive
