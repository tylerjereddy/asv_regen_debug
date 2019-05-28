FROM ubuntu:xenial
RUN apt-get update && apt-get install -y \
    git \
    python \
    python-pip \
    vim
RUN git clone https://github.com/scipy/scipy.git
RUN python -m pip install -U pip virtualenv
# check out a commit representative of asv build issues
# for SciPy 1.0 manuscript
RUN cd scipy && \
    git checkout 69742ba9
# install appropriate dependencies to virtualenv
RUN virtualenv /testing && \
    /bin/bash -c "source /testing/bin/activate && \
    python -m pip install -U tempita pytest six \
                  cython==0.27.3 numpy==1.8.2"

RUN apt-get install -y libopenblas-dev
# once inside the image, will have to re-run
# source /testing/bin/activate
CMD cd /scipy && /bin/bash
