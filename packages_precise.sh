#!/bin/bash
#olalekan ogunmolu
#June 25, 2014
# Use this script for a basic packages installation after a dry format of ubuntu 14.04.2 LTS
# creates most of the packages needful for the vision/control engineer
echo "setting up sources for ros hydro"
printf '\n'
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list' 

printf '\n\n'
echo "setting up your ros keys"
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

echo "Adding the Spotify repository signing key to be able to verify downloaded packages"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo "Adding the Spotify repository"
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

printf '\n\n'
echo "setting up ppa keys for beignet opencl dev"
sudo apt-add-repository ppa:pmjdebruijn/beignet-testing
wait
sudo apt-get update 

printf '\n\n'
echo "fetching repository for sublime-text2"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -  #get google keys

printf '\n\n'
echo "adding ppa for sublime-text2"
sudo add-apt-repository ppa:webupd8team/sublime-text-2

printf '\n\n'
echo "adding google-chrome sources to your /etc/apt/sources.list"
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wait

printf '\n\n'
echo "Fetching mendeley"
cd ~/Downloads; wget -v https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
echo "installing the mendeley .deb file"
sudo dpkg -i mendel*.deb
wait

printf '\n\n'
echo "Downloading dropbox for linux 64 bit and unpacking to your Documents directory..."
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

printf '\n\n'
echo "updating your apt-get ..."
cd ~ 
sudo apt-get update
wait

printf '\n\n'
echo "Installing ulogme dependencies ..."
sudo apt-get install xdotool wmctrl
wait

printf '\n\n Installing beignet-dev\n\n'
sudo apt-get install beignet-dev
wait

printf '\n\n'
echo "You may now launch ulogme a separate terminal ..."

printf '\n\n'
echo "installing opencl headers ..."
sudo apt-get install opencl-headers
wait

printf '\n\n'
echo "Installing libfreenect2's dependencies ..."
sudo apt-get install build-essential libturbojpeg libjpeg-turbo8-dev libtool autoconf libudev-dev cmake mesa-common-dev freeglut3-dev libxrandr-dev doxygen libxi-dev libopencv-dev automake 
# sudo apt-get install libturbojpeg0-dev (Debian)
wait

printf '\n\n'
echo "Cloning libfreenect2 to your Documents folder ..."
cd ~/Documents 
git clone https://github.com/lakehanne/libfreenect2.git

printf '\n\n'
echo "installing the USB 3.0 superspeed patch from Joshua Blake ..."
cd libfreenect2/depends
sh install_ubuntu.sh
wait

printf '\n\n'
echo "installing libglfw3 ..."
sudo dpkg -i libglfw3*_3.0.4-1_*.deb  # Ubuntu 14.04 only
# sudo apt-get install libglfw3-dev (Debian/Ubuntu 14.10+:)
wait

printf '\n\n'
echo "Building protonect executable"
cd ../examples/protonect/
cmake ../examples/protonect/ -DENABLE_CXX11=ON && make && sudo make install
wait
printf '\n\ncopying kinect2 rules to udev directory'
cd ~/Downloads/Shells 
sudo cp 90-kinect2.rules /etc/udev/rules.d

printf '\n\n'
echo "Protonect has been built. Please cd into the /bin directory and run Protonect" 

printf '\n\n%s\n' 'Installing subversion'
cd ~/ && sudo apt-get install subversion
wait

printf '\n\n'
echo "Installing google google-chrome-unstable"
sudo apt-get install google-chrome-unstable
wait

printf '\n\n%s\n' 'In Ubuntu 12.04 the gspca kernel driver prevent libfreenect from claiming the Kinect device in user-mode. Either remove and blacklist the module'
sudo modprobe -r gspca_kinect 
sudo modprobe -r gspca_main
echo "blacklist gspca_kinect" |sudo tee -a /etc/modprobe.d/blacklist.conf
sudo adduser $USER plugdev
#sudo apt-get install freenect				#part of ros indigo

printf '\n\n%s\n' 'libtisch PPA'
sudo add-apt-repository ppa:floe/libtisch
sudo apt-get update
wait
sudo apt-get install libfreenect libfreenect-dev libfreenect-demos


printf '\n\n'
#install sublime-text2
echo "Installing sublime-text2, thank you for your patience"
sudo apt-get install sublime-text
wait

printf '\n\n'
echo "Installing openni dependencies"
sudo apt-get install openjdk-6-jdk freeglut3-dev libusb-1.0-0-dev
wait

printf '\n\n'

echo "Installing OpenNI"
cd ~/Downloads 
git clone https://github.com/OpenNI/OpenNI.git
wait

echo "Installing SensorKinect"
printf '\n\n'
cd ~/Downloads 
git clone https://github.com/OpenNI/OpenNI.git

cd ~/Downloads/OpenNI/Platform/Linux/Build
make -j8
wait
cd ../Redist/OpenNI-Bin-Dev-Linux-x64-v1.5.7.10/
sudo make install
wait


printf '\n\n'
echo "Installing SensorKinect"
cd ~/Downloads 
printf '\n\n'
git clone https://github.com/avin2/SensorKinect.git
wait
cd ~/Downloads/SensorKinect/Platform/Linux/Build
make -j8
wait
cd ~/Downloads/SensorKinect/Platform/Linux/Redist/Sensor-Bin-Linux-x64-v5.1.2.1
sudo ./install.sh
wait
printf '\n\nI have finished OpenNI Installation. Please test OpenNI samples.'

printf '\n\n'
echo "Installing ros-hydro-dektop-full"
printf '\n\n'
cd ~
sudo apt-get install ros-hydro-desktop-full
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
sudo apt-get install python-rosinstall
wait

# Installing Spotify
echo "# Installing Spotify"
sudo apt-get install spotify-client

printf '\n\n'
echo "setting up your catkin workspace"
cd ~
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
wait
cd ~/catkin_ws/
catkin_make
wait

printf '\n\n'
echo "Sourcing the bash files for your catkin_ws environment into ~/.bashrc"
source /opt/ros/hydro/setup.bash >> ~/.bashrc
source /home/lex/catkin_ws/devel/setup.bash >> ~/.bashrc
wait

printf '\n\n%s%s' 'setting command parser to 0; disabling the whitelist'
echo 0 > /sys/module/i915/parameters/enable_cmd_parser 
echo 0 > /sys/module/i915/parameters/enable_cmd_parser >> ~/.bashrc

#Installing Kinect2's bridge to ROS
printf '\n\n'
echo "Installing Kinect2's bridge to ROS"
cd ~/catkin_ws/src
git clone https://github.com/lakehanne/iai_kinect2.git
wait

cd iai_kinect2
rosdep install -r --from-paths .
wait


cd ~/catkin_ws
catkin_make -DCMAKE_BUILD_TYPE="Release"
wait

printf '\n\n%s\n' 'installing pip'
sudo apt-get install python-pip python-dev 
wait

printf '\n\n%s' 'installing ipython'
pip install "ipython[notebook]"
wait

echo "\n\nInstalling okular\n\n"
sudo apt-get install okular
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
sudo apt-get install libmatio2;
wait
luarocks install matio
wait


printf "\n\n installl glxinfo\n\n"
sudo apt-get install mesa-utils
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
	wget http://developer.download.nvidia.com/compute/cuda/7_0/Prod/local_installers/rpmdeb/cuda-repo-ubuntu1404-7-0-local_7.0-28_amd64.deb
	wait
	#Verify conflicting installation methods
	 sudo /usr/local/cuda-7.0/bin/uninstall_cuda_*.*;
	wait
	sudo dpkg -i cuda-repo-ubuntu1404-7-0-local_7.0-28_amd64.deb
	wait
	sudo apt-get install cuda
	wait

	```bash
			The PATH variable needs to include /usr/local/cuda-7.0/bin
			Setting it up 'for ya'
	```
	if [[ $(uname -m) == "x86_64" ]]; then
		$(export PATH=/usr/local/cuda-7.0/bin:$PATH)
		$(export LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib64:$LD_LIBRARY_PATH)
	else  #[[ $(uname -m) -ne x86_64 ]]; then  #assume 32-bit OS
		$(export PATH=/usr/local/cuda-7.0/bin:$PATH)
		$(export LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib:$LD_LIBRARY_PATH)
		#statements
	fi

	
	#if [[ $driver == *"NVIDIA"* ]]; then
	if [[ true ]]; then
		#install cuda examples
		sh cuda-install-samples-7.0.sh ~/Documents/
		cd ~/Documents/NVIDIA_CUDA-7.0_Samples;
		make -j8
		#statements
	fi

else 

	   printf "\n\nYou have no cuda capable gpu. Exiting the Cuda installation loop.\n\n"
		
fi

printf '\n\n'
echo "instaling galculator"
cd && sudo apt-get install galculator
wait

printf '\n\n'
echo "instaling texlive etc"
cd && sudo apt-get install texstudio
wait
echo "instaling moderncv dependencies"
sudo mktexlsr
wait
sudo apt install texlive-latex-extra texlive-bibtex-extra
wait
echo "instaling font expansion dependencies"
sudo apt-get install texlive-fonts-recommended
wait
printf '\n\n For a more complete install, I am'
echo 'pulling tex from http://tug.org/texlive/acquire-netinstall.html'
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
wait
tar -xzvf install-tl-unx.tar.gz
wait
cd install-tl*
sudo ./install-tl
wait


printf '\n\n'
echo "installing mendeley desktop"
sudo apt-get install mendeleydesktop 
wait

printf '\n\n'
echo "setting up git global configurations"
cd ~/Downloads/Shells 
chmod +x gitsetup.sh
sudo sh gitsetup.sh
wait

printf '\n\n%s\n' 'pulling ruby tar'
cd ~/Downloads && wget https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
tar -xzvf ruby-2.2.2.tar.gz 
wait
cd ruby-2.2.2 && ./configure && make && sudo make install
wait

printf '\n\n%s\n' 'pulling rubygems'
cd ~/Downloads && wget http://production.cf.rubygems.org/rubygems/rubygems-2.4.8.zip
wait
unzip rubygems-2.4.8.zip -d rubygems
cd rubygems/rubygems-2.4.8/ && sudo ruby setup.rb && sudo gem install rubygems-update && update_rubygems  

printf '\n\n%s\n' 'NodeJS'
cd ~/Downloads && wget https://nodejs.org/dist/v0.12.7/node-v0.12.7.tar.gz && tar -xzvf node-v0.12.7.tar.gz
wait
cd node-v0.12.7 && ./configure && make && sudo make install

printf '\n\n%s\n' 'Jekyll'
sudo gem install jekyll
printf '\n\n %s'
	```bash
			All of Jekyll’s gem dependencies are automatically installed by the above cmd,
			so you won’t have to worry about them at all.
	```


chmod 777 cuda.sh
sh cuda.sh
wait

printf '\n\n'
echo "Checking all installations!"
sudo apt-get install checkinstall
sudo checkinstall
wait

printf '\n\nInstalling gdebi for adobe reader\n\n'
sudo apt-get install gdebi
wait
echo "Doing Adobe Reader"
cd ~/Downloads 
sudo gdebi AdbeRdr9.5.5-1_i386linux_enu.deb
wait

printf '\n\n Installing Lua, Torch 7.0 nngraph Xitari fork of Arcade Learning \
        environment and AleWrap (lua interface to Xitari\n\n'

cd ~/Downloads
git clone https://github.com/lakehanne/Deep-Reinforcement-learning.git MnihRL
wait
mv ~/Downloads/MnihRL ~/Documents
cd ~/Documents/MnihRL && sudo ./install_dependencies

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
