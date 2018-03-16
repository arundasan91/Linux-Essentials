#!/usr/bin/env bash
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | sudo apt-key add -
sudo apt-get -o Dpkg::Options::="--force-overwrite" install openjdk-9-jdk
sudo apt-get -y update && sudo apt-get -y install bazel
sudo apt-get -y upgrade bazel
