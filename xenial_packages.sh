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

echo "Adding the Spotify repository signing key to be able to verify downloaded packages"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo "Adding the Spotify repository"
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

printf '\n\n'
echo "fetching repository for sublime-text2"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -  #get google keys
ros-ind
printf '\n\n'
echo "adding ppa for sublime-text2"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
wait

printf '\n\n'
echo "adding google-chrome sources to your /etc/apt/sources.list"
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wait

printf '\n\n'
echo "updating your apt-get ..."
cd ~ 
sudo apt-get update
wait


printf '\n\n'
echo "Fetching mendeley"
cd ~/Downloads; 
echo "installing the mendeley .deb file"
sudo dpkg -i mendel*.deb
wait

printf '\n\n'
echo "Downloading dropbox for linux 64 bit and unpacking to your Documents directory..."
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -


printf '\n\n'
echo "Installing xdotool beignet opencl and google chrome ..."
sudo apt-get install -y xdotool wmctrl opencl-headers subversion google-chrome-unstable
wait

printf '\n\n'
sudo apt-get install -y build-essential libturbojpeg libjpeg-turbo8-dev libtool autoconf libudev-dev cmake mesa-common-dev freeglut3-dev libxrandr-dev doxygen libxi-dev libopencv-dev automake 
# sudo apt-get install libturbojpeg0-dev (Debian)
wait

printf '\n\n%s\n' 'In Ubuntu 12.04 the gspca kernel driver prevent libfreenect from claiming the Kinect device in user-mode. Either remove and blacklist the module'
sudo modprobe -r gspca_kinect 
sudo modprobe -r gspca_main
echo "blacklist gspca_kinect" |sudo tee -a /etc/modprobe.d/blacklist.conf
sudo adduser $USER plugdev
#sudo apt-get install -y freenect				#part of ros indigo

printf '\n\n'
echo "Installing sublime-text2, thank you for your patience"
sudo apt-get install -y sublime-text openjdk-6-jdk freeglut3-dev libusb-1.0-0-dev ros-`rosversion -d`-desktop-full 
wait

printf '\n\n'
echo "Initializing rosdep"
sudo rosdep init
wait

printf '\n\n'
echo "updating ros dependencies"
rosdep update
wait

printf '\n\n'
echo "getting rosinstall"
sudo apt-get install -y python-rosinstall spotify-client
wait


printf '\n\n'
echo "setting up your catkin workspace"
cd ~
mkdir -p ~/catkin_ws/src;
cd ~/catkin_ws/src;
catkin_init_workspace;
wait
cd ~/catkin_ws/;
catkin_make;
wait

printf '\n\n'
echo "Sourcing the bash files for your catkin_ws environment into ~/.bashrc"
source /opt/ros/`(rosversion -d`/setup.bash >> ~/.bashrc
source /home/lex/catkin_ws/devel/setup.bash >> ~/.bashrc
wait


printf '\n\n%s\n' 'installing pip'
sudo apt-get install -y python-pip python-dev python3-pip
wait

printf '\n\n%s' 'installing ipython'
pip install -y "ipython[notebook]"
wait

echo "\n\nInstalling okular and ros-indigo-moveit-full\n\n"
sudo apt-get install -y okular galculator  ros-`rosversion -d`-moveit-full 
wait

printf "\n\n installing torch \n\n"
curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash;
wait
git clone https://github.com/torch/distro.git ~/torch --recursive;
cd ~/torch; ./install.sh
wait

source ~/.bashrc
wait

printf "\n\n installing matio\n\n"
sudo apt-get install -y libmatio2;
wait
luarocks install -y matio
wait


printf "\n\n installl glxinfo\n\n"
sudo apt-get install -y mesa-utils
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

if lspci | grep -i nvidia && gcc --version; then
	luarocks install cutorch;
	printf "\n\n Installing CUDA"
	echo "Details here: http://docs.nvidia.com/cuda/cuda-getting-started-guide-for-linux/#axzz3vTMAvnnO"
	cd ~/Downloads;
	wget http://developer.download.nvidia.com/compute/cuda/8_0/Prod/local_installers/rpmdeb/cuda-repo-ubuntu1604-8-0-local_8.0-28_amd64.deb
	wait
	#Verify conflicting installation methods
	 sudo /usr/local/cuda-X.Y/bin/uninstall_cuda_*.*;
	wait
	sudo dpkg -i cuda-repo-ubuntu1604-8-0-local_8.0-28_amd64.deb
	wait
	sudo apt-get install cuda
	wait

	```bash
		The PATH variable needs to include /usr/local/cuda-8.0/bin
		Setting it up 'for ya'
	```
	if uname -m == x86_64; then
		$(export PATH=/usr/local/cuda-8.0/bin:$PATH)
		$(export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH)
	else  #[[ $(uname -m) -ne x86_64 ]]; then  #assume 32-bit OS
		$(export PATH=/usr/local/cuda-8.0/bin:$PATH)
		$(export LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib:$LD_LIBRARY_PATH)
		#statements
	fi
else 

	   printf "\n\nYou have no cuda capable gpu. Exiting the Cuda installation loop.\n\n"
		
fi

printf '\n\n'
echo "instaling texlive etc"
cd && sudo apt-get install -y texstudio texlive-latex-extra texlive-bibtex-extra texlive-fonts-recommended
texlive-science
wait

echo "instaling moderncv dependencies"
sudo mktexlsr
wait

printf '\n\n'
echo "installing mendeley desktop"
sudo apt-get install -y mendeleydesktop 
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
