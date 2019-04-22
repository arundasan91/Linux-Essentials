sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential cmake git wget unzip yasm pkg-config libswscale-dev libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libavformat-dev libpq-dev
sudo apt-get install -y libv4l-dev libgphoto2-dev
sudo apt-get install -y libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install -y ffmpeg
sudo apt-get install -y gtk2.0
git clone https://github.com/opencv/opencv_contrib.git
export OPENCV_VERSION="4.1.0"
wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
unzip ${OPENCV_VERSION}.zip
mkdir opencv-${OPENCV_VERSION}/cmake_binary
cd opencv-${OPENCV_VERSION}/cmake_binary
cmake -DBUILD_TIFF=ON   -DBUILD_opencv_java=OFF   -DWITH_CUDA=ON   -DWITH_CUBLAS=ON -DCUDA_NVCC_FLAGS="-D_FORCE_INLINES" -DENABLE_FAST_MATH=1 -DCUDA_FAST_MATH=1 -DENABLE_AVX=ON   -DWITH_OPENGL=ON   -DWITH_OPENCL=ON   -DWITH_IPP=ON   -DWITH_TBB=ON   -DWITH_EIGEN=ON   -DWITH_V4L=ON   -DBUILD_TESTS=OFF   -DBUILD_PERF_TESTS=OFF   -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DPYTHON2_EXECUTABLE=/usr/bin/python -DPYTHON3_EXECUTABLE=/usr/bin/python3 -DPYTHON2_LIBRARY='/usr/lib/x86_64-linux-gnu/libpython2.7.so' -DPYTHON2_NUMPY_INCLUDE_DIRS='/usr/lib/python2.7/dist-packages/numpy/core/include/' -D BUILD_opencv_python2=ON -D BUILD_opencv_python3=ON -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules -DOPENCV_ENABLE_NONFREE=ON ..
sudo make install -j$(nproc)
