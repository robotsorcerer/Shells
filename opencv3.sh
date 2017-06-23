
#!/bin/bash
mkdir tmp
cd tmp
# the two lines below will fail in case it's not the first time we clone
git clone https://github.com/Itseez/opencv.git
git clone https://github.com/Itseez/opencv_contrib.git

# revert the main CMakeLists.txt file in case it's not the first time
cd opencv
git reset --hard HEAD
git checkout master
git clean -dxf
git reset --hard HEAD
git pull --rebase
# Use that date because of: https://github.com/opencv/opencv_contrib/issues/919
git checkout `git rev-list -n 1 --before="2016-12-30 00:00" master`
#git checkout 3.2.0

cd ../opencv_contrib
git checkout master
git reset --hard HEAD
git pull --rebase
git checkout `git rev-list -n 1 --before="2016-12-30 00:00" master`
#git checkout 3.2.0
cd ../

cp -fr ./opencv_contrib/modules ./opencv/opencv_contrib

# revert the main CMakeLists.txt file in case it's not the first time
cd opencv
# Disable dnn for now.
rm -fr ./opencv_contrib/dnn
git checkout CMakeLists.txt
sed -i 's/set(OPENCV_EXTRA_MODULES_PATH "" CACHE PATH "Where to look for additional OpenCV modules")/set(OPENCV_EXTRA_MODULES_PATH "${CMAKE_CURRENT_SOURCE_DIR}\/opencv_contrib\/" CACHE PATH "Where to look for additional OpenCV modules")/' ./CMakeLists.txt
# Disable tests
sed -i 's/OCV_OPTION(BUILD_PERF_TESTS         "Build performance tests"                     ON  IF (NOT APPLE_FRAMEWORK) )/OCV_OPTION(BUILD_PERF_TESTS         "Build performance tests"                     OFF)/' ./CMakeLists.txt
sed -i 's/OCV_OPTION(BUILD_TESTS              "Build accuracy \& regression tests"           ON  IF (NOT APPLE_FRAMEWORK) )/OCV_OPTION(BUILD_TESTS              "Build accuracy \& regression tests"           OFF)/' ./CMakeLists.txt
# Enable Qt
sed -i 's/OCV_OPTION(WITH_QT             "Build with Qt Backend support"               OFF  IF (NOT ANDROID AND NOT IOS AND NOT WINRT) )/OCV_OPTION(WITH_QT             "Build with Qt Backend support"               ON  IF (NOT ANDROID AND NOT IOS AND NOT WINRT) )/' ./CMakeLists.txt
# Enable mangled path to have two OpenCV installable side by side
sed -i 's/OCV_OPTION(INSTALL_TO_MANGLED_PATHS "Enables mangled install paths, that help with side by side installs." OFF IF (UNIX AND NOT ANDROID AND NOT APPLE_FRAMEWORK AND BUILD_SHARED_LIBS) )/OCV_OPTION(INSTALL_TO_MANGLED_PATHS "Enables mangled install paths, that help with side by side installs." ON)/' ./CMakeLists.txt
#sed -i 's/OCV_OPTION(WITH_IPP            "Include Intel IPP support"                   NOT MINGW IF (X86_64 OR X86) AND NOT WINRT )/OCV_OPTION(WITH_IPP            "Include Intel IPP support"                   OFF)/' ./CMakeLists.txt
sed -i 's/set(OPENCV_DLLVERSION "")/set(OPENCV_DLLVERSION "3")/' ./CMakeLists.txt
echo "install(FILES package.xml DESTINATION share/opencv3)" >> ./CMakeLists.txt

mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=RELEASE -D BUILD_SHARED_LIBS=ON -D CMAKE_BUILD_TYPE=RELEASE \
 -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON \
 -DWITH_V4L=ON -D WITH_QT=ON -D INSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=ON \
 -D WITH_OPENGL=ON -D WITH_GTK=ON -D ../
 # WITH_CUDA=ON -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 \
 #  -D WITH_CUBLAS=1 -D WITH_OPENNI=ON -D WITH_OPENMP=ON -D WITH_OPENCL=ON -D CUDA_GENERATION=Kepler ../
wait

make -j$(nproc)
wait

sudo make install

# cd ../

# when configuring bloom the first time, use the tar file created above
# rm ./opencv.tar.gz
# tar --exclude-vcs -zcf ./opencv.tar.gz ./opencv/*
