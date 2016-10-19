#!/bin/bash

# To watch the process, do "watch NVIDIA_GPU_usage.sh" or just run as a deamon by executing the script.
# A file named "nvidialog" will be created in the scipt dir.

while true
do
        nvidia-smi | grep "MiB |" | awk '{print $9}' 2>&1 | tee -a nvidialog
        sleep 2
done
