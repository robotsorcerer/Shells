#! /bin/bash
# Olalekan Ogunmolu
# For the love of Xenial

echo "seting up ros keys"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

echo "atom keys"
sudo add-apt-repository ppa:webupd8team/atom

printf "\n\nfetching anaconda"
THIS_DIR=$(cd ~/Downloads/Shells)


printf '\n getting anaconda full version\n'
cd THIS_DIR
wget https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh
wait

while getopts 'bsh' x; do
    case "$x" in
        h)
            echo "usage: $0
This script will install Ubuntu Xenial packages and related, useful packages into $THIS_DIR.

    -b      Run without requesting any user input (will automatically add PATH to shell profile)
    -s      Skip adding the PATH to shell profile
"
            exit 2
            ;;
        b)
            BATCH_INSTALL=1
            ;;
        s)
            SKIP_RC=1
            ;;
    esac
done

sudo apt-get update

sudo apt-get install lftp atom build-essential libturbojpeg libjpeg-turbo8-dev libtool autoconf libudev-dev cmake \
mesa-common-dev freeglut3-dev libxrandr-dev doxygen libxi-dev libopencv-dev automake sublime-text openjdk-6-jdk \
freeglut3-dev libusb-1.0-0-dev python-catkin-tools python-rosinstall spotify-client  python-catkin-tools \
xdotool wmctrl beignet-dev opencl-headers subversion python-pip python-dev python3-pip \
okular galculator libmatio2 mesa-utils xclip libprotobuf-dev libleveldb-dev git \
libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler luarocks \
libprotobuf-dev libprotoc-dev libprotobuf-c0-dev protobuf-c-compiler \
python-protobuf libhdf5-dev liblmdb-dev libleveldb-dev ros-kinetic-desktop-full
wait

echo "Installing Caffe dependencies"
sudo apt-get install --no-install-recommends libboost-all-dev libatlas-base-dev libgflags-dev \
 libgoogle-glog-dev liblmdb-dev
 wait

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

 printf '\n\n'
 echo "instaling texlive etc"
 cd && sudo apt-get install -y texstudio texlive-latex-extra texlive-bibtex-extra \
 texlive-fonts-recommended texlive-science
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

 # printf '\n instaling anaconda full version\n'
 # cd $THIS_DIR
 # # bash Anaconda3-4.3.1-Linux-x86_64.sh
 # wait

 printf '\nInstalling pytorch and torchvision\n'
 conda install pytorch torchvision cuda80 -c soumith
 wait

 printf '\n\n'
 echo "Dynamically linking all files, packages and dependencies, please wait"
 sudo ldconfig -d
 echo "System is ready to be used"

cat <<-EOT

Install foxit from here:

 https://www.foxitsoftware.com/downloads/

EOT
