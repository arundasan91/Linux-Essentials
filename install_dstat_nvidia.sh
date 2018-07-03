#/bin/bash
sudo apt-get install dstat
mkdir -p $HOME/packages/
cd $HOME/packages/
wget https://files.pythonhosted.org/packages/72/31/378ca145e919ca415641a0f17f2669fa98c482a81f1f8fdfb72b1f9dbb37/nvidia-ml-py-7.352.0.tar.gz
tar -xzvf nvidia-ml-py-7.352.0.tar.gz
cd nvidia-ml-py-7.352.0/
python setup.py install --user
python3 setup.py install --user
cd $HOME/packages/
wget https://raw.githubusercontent.com/datumbox/dstat/master/plugins/dstat_nvidia_gpu.py
sudo mv dstat_nvidia_gpu.py /usr/share/dstat/
# RUN: dstat -ndf --nvidia-gpu
