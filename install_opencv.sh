sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential cmake git wget unzip yasm pkg-config libswscale-dev libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libavformat-dev libpq-dev
sudo apt-get install -y libv4l-dev libgphoto2-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y ffmpeg
sudo apt-get install -y libgtk2.0-dev
export OPENCV_VERSION="4.2.0"
wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip && unzip ${OPENCV_VERSION}.zip && mkdir opencv-${OPENCV_VERSION}/cmake_binary
cd opencv-${OPENCV_VERSION}
git clone https://github.com/opencv/opencv_contrib.git
cd cmake_binary
cmake \
-D BUILD_TIFF=ON \
-D BUILD_opencv_java=OFF \
-D WITH_CUDA=OFF \
-D ENABLE_AVX=ON \
-D WITH_OPENGL=ON \
-D WITH_OPENCL=ON \
-D WITH_IPP=ON \
-D WITH_TBB=ON \
-D WITH_EIGEN=ON \
-D WITH_V4L=ON \
-D BUILD_TESTS=OFF \
-D BUILD_PERF_TESTS=OFF \
-D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
-D BUILD_opencv_python2=ON \
-D BUILD_opencv_python3=ON \
-D PYTHON2_EXECUTABLE=/usr/bin/python \
-D PYTHON3_EXECUTABLE=/usr/bin/python3 \
-D PYTHON2_LIBRARY==$(python -c "from distutils.sysconfig import get_config_var;from os.path import dirname,join ; print(join(dirname(get_config_var('LIBPC')),get_config_var('LDLIBRARY')))") \
-D PYTHON2_NUMPY_INCLUDE_DIRS=$(python -c "import numpy; print(numpy.get_include())") \
-D PYTHON3_EXECUTABLE=$(which python3) \
-D PYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
-D PYTHON_INCLUDE_DIR2=$(python3 -c "from os.path import dirname; from distutils.sysconfig import get_config_h_filename; print(dirname(get_config_h_filename()))") \
-D PYTHON_LIBRARY=$(python3 -c "from distutils.sysconfig import get_config_var;from os.path import dirname,join ; print(join(dirname(get_config_var('LIBPC')),get_config_var('LDLIBRARY')))") \
-D PYTHON3_NUMPY_INCLUDE_DIRS=$(python3 -c "import numpy; print(numpy.get_include())") \
-D PYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules -DOPENCV_ENABLE_NONFREE=ON ..

sudo make install -j$(nproc)
