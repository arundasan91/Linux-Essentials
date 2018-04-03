sudo apt-get update
sudo apt-get install -y build-essential cmake git wget unzip yasm pkg-config libswscale-dev libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libavformat-dev libpq-dev
sudo apt-get install libv4l-dev libgphoto2-2-dev
sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install ffmpeg
export OPENCV_VERSION="3.4.1"
wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip && unzip ${OPENCV_VERSION}.zip && mkdir opencv-${OPENCV_VERSION}/cmake_binary && cd opencv-${OPENCV_VERSION}/cmake_binary
cmake -DBUILD_TIFF=ON   -DBUILD_opencv_java=OFF   -DWITH_CUDA=OFF   -DENABLE_AVX=ON   -DWITH_OPENGL=ON   -DWITH_OPENCL=ON   -DWITH_IPP=ON   -DWITH_TBB=ON   -DWITH_EIGEN=ON   -DWITH_V4L=ON   -DBUILD_TESTS=OFF   -DBUILD_PERF_TESTS=OFF   -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$(python -c "import sys; print(sys.prefix)") -DPYTHON_EXECUTABLE=$(which python) -DPYTHON_INCLUDE_DIR=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") -DPYTHON_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") ..
sudo make install
