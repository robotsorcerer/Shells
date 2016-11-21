#!/bin/bash
# olalekan ogunmolu
#June 25, 2014
#Use this script for a basic packages installation after a dry format of ubuntu 14.04.2 LTS
#creates most of the packages needful for the average engineer
echo "setting up sources for ros indigo"
printf '\n'
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

printf '\n\n'
echo "setting up your ros keys"
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116 
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

echo "Adding the Spotify repository signing key to be able to verify downloaded packages"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo "Adding the Spotify repository"
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

printf '\n\n'
echo "adding ppa for sublime-text2"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
wait

printf '\n\n'
echo "updating your apt-get ..."
cd ~ 
sudo apt-get update
wait

printf '\n\n'
sudo apt-get install -y build-essential libturbojpeg libjpeg-turbo8-dev libtool autoconf libudev-dev cmake mesa-common-dev freeglut3-dev libxrandr-dev \
doxygen libxi-dev libopencv-dev automake sublime-text openjdk-6-jdk freeglut3-dev libusb-1.0-0-dev ros-indigo-desktop-full python-catkin-tools \
python-rosinstall spotify-client  python-catkin-tools xdotool wmctrl beignet-dev opencl-headers subversion python-pip python-dev python3-pip  \
okular galculator libmatio2 mesa-utils xclip libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler \
luarocks libprotobuf-dev libprotoc-dev libprotobuf-c0-dev protobuf-c-compiler python-protobuf libhdf5-dev liblmdb-dev
libleveldb-dev 
wait

echo "Installing Caffe"
sudo apt-get install 
wait
sudo apt-get install --no-install-recommends libboost-all-dev libatlas-base-dev libgflags-dev libgoogle-glog-dev liblmdb-dev

printf '\n\n'
echo "setting up your catkin workspace"
cd ~; 
mkdir -p ~/catkin_ws/src;
cd ~/catkin_ws/src;
catkin init;
wait
cd ../; catkin build

printf '\n\n'
echo "Initializing rosdep"
sudo rosdep init
wait

printf '\n\n'
echo "updating ros dependencies"
rosdep update
wait

source ~/.bashrc
wait

printf '\n\n'
echo "installing pr2 dependencies"
install ros-indigo-pr2-controllers-msgs ros-indigo-controller-manager ros-indigo-joint-state-controller \
ros-indigo-pr2-mechanism-diagnostics ros-indigo-control-toolbox ros-indigo-pr2-controller-manager \
ros-indigo-pr2-mechanism-msgs ros-indigo-control-toolbox ros-indigo-pr2-controller-interface ros-indigo-pr2-head-action\
ros-indigo-pr2-controller-manager ros-indigo-pr2-hardware-interface ros-indigo-pr2-gripper-action\
ros-indigo-pr2-mechanism-diagnostics ros-indigo-pr2-mechanism-model ros-indigo-pr2-dashboard-aggregator \
ros-indigo-pr2-mechanism-msgs ros-indigo-robot-mechanism-controllers ros-indigo-pr2-msgs ros-indigo-pr2-gazebo-plugins \
libcppunit-1.13-0 libcppunit-dev ros-indigo-bfl  ros-indigo-robot-pose-ekf ros-indigo-joint-trajectory-action
wait

printf "\n\n installl glxinfo\n\n"
sudo apt-get install -y 
wait

luarocks install nn
wait
luarocks install cunn
wait
luarocks install image
wait
luarocks install nngraph
wait
luarocks install loadcaffe
wait
luarocks install cutorch
wait

printf '\n\n'
echo "instaling texlive etc"
cd && sudo apt-get install -y texstudio texlive-latex-extra texlive-bibtex-extra texlive-fonts-recommended \
texlive-science
wait

echo "instaling moderncv dependencies"
sudo mktexlsr
wait

printf '\n\n'
echo "setting up git global configurations"
cd ~/Downloads/Shells ;
chmod +x gitsetup.sh;
sudo sh gitsetup.sh;
wait

printf '\n\n'
echo "Dynamically linking all files, packages and dependencies, please wait"
sudo ldconfig -d
echo "System is ready to be used"

cat <<-EOT

	install dropbox with the following command to complete the installation

	cd ~/.dropbox-dist && ./dropboxd

EOT

#Change-logs
#August 04, 2015
#		Made extra 2 lines between package installations with printf
#		Redefined installation of dropbox
#		Added ipython notebook
#		Redefined intallation of mendeley
#       	Added beignet comman parser
#August 26, 2015
#		Commented out Anaconda install as it conflicts with libtiff and opencv highgui libraries
#		Removed kalman filter library from source of orge
#		Added cuda 7.5 for ubuntu 15.04
#		Added libopencv-gpu-dev
#December 26, 2015
#       Added Torch, Lua, CUDA etc. Modified install of sensorkinect
