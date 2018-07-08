#!/bin/bash
mkdir -p $HOME/packages
cd $HOME/packages
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
python3 get-pip.py --user
sudo apt-get install python-dev python3-dev htop dstat
sudo apt-get install sudo apt-get install linux-headers-$(uname -r)
pip3 install scikit-learn scikit-image Pandas Pillow matplotlib jupyter jupyterlab networkx keras --user
