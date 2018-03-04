#!/usr/bin/env bash
sudo apt-get install -y build-essential git libopenblas-dev liblapack-dev libopencv-dev python-dev python-setuptools python-pip libgfortran3 graphviz
pip install graphviz
git clone --recursive https://github.com/apache/incubator-mxnet $HOME/packages/mxnet
cd $HOME/packages/mxnet
make -j $(nproc) USE_OPENCV=1 USE_BLAS=openblas USE_CUDA=1 USE_CUDA_PATH=/usr/local/cuda USE_CUDNN=1 USE_DIST_KVSTORE=1 USE_GPERFTOOLS=0 USE_JEMALLOC=1
cd $HOME/packages/mxnet/python
pip install --upgrade pip
pip install -e . --user
cd
