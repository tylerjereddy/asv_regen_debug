FROM ubuntu:xenial
RUN apt-get update && apt-get install -y \
    python \
    python-pip \
    vim
RUN python -m pip install -U pip virtualenv tempita pytest six
RUN python -m pip install cython==0.27.3 numpy==1.8.2
