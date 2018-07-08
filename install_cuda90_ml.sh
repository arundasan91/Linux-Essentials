#!/bin/bash
mkdir -p /home/$USER/packages
cd /home/$USER/packages
# Download CUDA libraries
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/3/cuda-repo-ubuntu1604-9-0-local-cublas-performance-update-3_1.0-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
# Pre-Download CUDNN (tar - for Linux) and NCCL (deb file). Place them in /home/$USER/packages.
# This step requires NVIDIA Developer Account. Create one at https://developer.nvidia.com/cudnn.
sudo dpkg -i nccl-repo-ubuntu1604-2.2.13-ga-cuda9.0_1-1_amd64.deb
sudo apt update
sudo apt install cuda-9-0
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local-cublas-performance-update-3_1.0-1_amd64-deb
sudo apt update
sudo apt upgrade
sudo apt install libnccl2=2.2.13-1+cuda9.0 libnccl-dev=2.2.13-1+cuda9.0
# Add CUDA Path to bashrc file.
sudo cat >> ~/.bashrc <<- EOM
export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
EOM
source ~/.bashrc
# Extract CUDNN 7.1 files
tar -xzvf cudnn-9.0-linux-x64-v7.1.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
