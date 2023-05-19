# Dockerfile

ARG BASE_IMAGE=nvcr.io/nvidia/tensorflow:20.10-tf1-py3
FROM $BASE_IMAGE

RUN  apt-key del 7fa2af80 \
&& apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/3bf863cc.pub \
&& apt-get update  \
&& apt-get install -y build-essential \
&& pip install --upgrade pip \
&& pip install setuptools \
        wheel \
        matplotlib \
        numpy \
        pymysql \
        sqlalchemy \
        scipy \
        open3d \
        tqdm \
        scikit-learn \
        plyfile 

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y
