#!/bin/bash
#olalekan ogunmolu
#June 25, 2014

#Use this script for a basic packages installation after a dry format of ubuntu vivid LTS. 
#Remember to copy Vivid_packages.sh into your home directory before starting out.
#Use this script for a basic packages installation after a dry format of ubuntu vivid LTS

#creates most of the packages needful for the average engineer

###KEYS SETUP
echo "setting up sources for ros jade"
printf '\n\n'
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
printf '\n\n'
wait

printf '\n\n'
echo "setting up your ros keys"
printf '\n\n'
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116
wait

printf '\n\n setting up skype sources:\n\n'

sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu vivid partner" > /etc/apt/sources.list.d/skype-sources.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu vivid partner" > /etc/apt/sources.list.d/skype-sources.list'
deb http://archive.canonical.com/ubuntu vivid partner
deb-src http://archive.canonical.com/ubuntu vivid partner
wait

echo "Adding the Spotify repository signing key to be able to verify downloaded packages"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo "Adding the Spotify repository"
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

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
#echo "Fetching mendeley"
printf '\n\n'
wait
#cd ~/Downloads && wget -v https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
echo "installing the mendeley .deb file"
#sudo dpkg -i mendel*.deb
echo "Fetching mendeley"
cd ~/Downloads && wget -v https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
echo "installing the mendeley .deb file"
sudo dpkg -i mendel*.deb
wait

printf '\n\n'
echo "Downloading dropbox for linux 64 bit and unpacking to your Documents directory..."
cd ~ 
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
wait
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

printf '\n\n'
echo "updating your apt-get ..."
cd ~ && sudo apt-get update
wait


####INSTALLATIONS
printf '\n\n'
echo "Installing git and ulogme dependencies ..."
sudo apt-get install xdotool wmctrl git
echo "Installing ulogme dependencies ..."
sudo apt-get install xdotool wmctrl
wait

printf '\n\n Installing beignet-dev\n\n'
sudo apt-get install beignet-dev
wait

printf '\n\nSpotify dependencies in vivid'
cd ~/Downloads && wget https://launchpad.net/ubuntu/+archive/primary/+files/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
sudo dpkg -i libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
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
wait

printf '\n\n'
echo "Cloning libfreenect2 to your Documents folder ..."
cd ~/Documents && git clone https://github.com/OpenKinect/libfreenect2.git

printf '\n\n'
echo "installing the USB 3.0 superspeed patch from Joshua Blake ..."
cd libfreenect2/depends
./install_ubuntu.sh
sh install_ubuntu.sh
wait

printf '\n\n'
echo "installing libglfw3 ..."
sudo dpkg -i libglfw3*_3.0.4-1_*.deb  # Ubuntu 14.04 only
# sudo apt-get install libglfw3-dev (Debian/Ubuntu 14.10+:)
wait

printf '\n\n'
echo "Building protonect executable"
cd ~/Documents/libfreenect2/examples/protonect/
mkdir build
cd build
cmake ../examples/protonect/ -DENABLE_CXX11=ON && make -j8 && sudo make install
cd ../examples/protonect/
cmake ../examples/protonect/ -DENABLE_CXX11=ON && make && sudo make install
wait

printf '\n\ncopying kinect2 rules to udev directory'
cd ~/Downloads/Shells && sudo cp 90-kinect2.rules /etc/udev/rules.d

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
sudo apt-get install freenect				#part of ros indigo

printf '\n\n%s\n' 'Installing libfreenect drives'
sudo apt-get install libfreenect libfreenect-dev libfreenect-demos libfreenect-bin
sudo adduser $USER video

printf '\n\n'
#install sublime-text2
echo "Installing sublime-text2, thank you for your patience"
sudo apt-get install sublime-text
wait

printf '\n\n'
echo "Installing java6, freeglut3 and libusb-1.0"
printf '\n\n'
sudo apt-get install openjdk-6-jdk freeglut3-dev libusb-1.0-0-dev
wait

printf '\n\n'
echo "Installing OpenNI"
printf '\n\n'
cd ~/Downloads 
git clone https://github.com/OpenNI/OpenNI.git
wait
cd ~/Downloads/OpenNI/Platform/Linux/Build
make -j8
wait
sudo make install
wait

sudo apt-get install libgl1-mesa-dev-lts-utopic
wait

printf '\n\n I am installing your jade-desktop-full. Chill. This might take a while.'
sudo apt-get install ros-jade-desktop-full
printf '\n\n'

sudo rosdep init
wait

rosdep update
wait

printf '\n\nEnvironment setup\n\n'
echo "source /opt/ros/jade/setup.bash" >> ~/.bashrc
exit && echo "source /opt/ros/jade/setup.bash" >> ~/.bashrc
echo "home/$(USER)/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

printf '\n\n Installing python-rosinstall\n\n'
sudo apt-get install python-rosinstall
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
echo "setting up your catkin workspace"
cd && mkdir -p ~/catkin_ws/src
# Installing Spotify
echo "# Installing Spotify"
sudo apt-get install spotify-client
wait

printf  "\n\ninstalling skype\n\n"
sudo apt-get install skype skype-bin
wait

printf '\n\n'
echo "setting up your catkin workspace"
exit && cd && mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws/
catkin_make
wait

printf '\n\n'
echo "Sourcing the bash files for your catkin_ws environment into ~/.bashrc"
source /opt/ros/jade/setup.bash >> ~/.bashrc
source /home/$(whoami)/catkin_ws/devel/setup.bash >> ~/.bashrc
wait


# Installing Spotify
printf '\n\n'
echo "# Installing Spotify"
sudo apt-get install spotify-client
wait

printf  "\n\ninstalling skype\n\n"
sudo apt-get install skype skype-bin
source /home/lex/catkin_ws/devel/setup.bash >> ~/.bashrc
wait

#Installing Kinect2's bridge to ROS
printf '\n\n'
echo "Installing Kinect2's bridge to ROS"
cd ~/catkin_ws/src
git clone https://github.com/lakehanne/iai_kinect2.git
wait

cd iai_kinect2
rosdep install -r --from-paths .


cd ~/catkin_ws
catkin_make -DCMAKE_BUILD_TYPE="Release"
wait

printf '\n\n%s\n' 'installing pip'
sudo apt-get install python-pip python-dev 
wait

printf '\n\n%s' 'installing ipython'
pip install "ipython[notebook]"
wait

printf '\n\n'
echo "installing galculator"
cd && sudo apt-get install galculator
wait

printf '\n\n'
echo "instaling texlive etc"
cd && sudo apt-get install texstudio
wait
echo "instaling moderncv dependencies"
sudo mktexlsr
wait
sudo apt install texlive-latex-extra
wait
echo "installing font expansion dependencies"
echo "instaling font expansion dependencies"
sudo apt-get install texlive-fonts-recommended
wait

printf '\n\n'
echo "installing mendeley desktop"
sudo apt-get install mendeleydesktop 
wait

printf '\n\n'
echo "setting up git global configurations"
cd ~/Downloads/Shells && chmod +x gitsetup.sh && sudo sh gitsetup.sh
wait

printf '\n\n%s\n' 'pulling ruby tar'
cd ~/Downloads && wget https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
tar -xzvf ruby-2.2.2.tar.gz 
wait
cd ruby-2.2.2 && ./configure && make -j8 && sudo make install
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
cd node-v0.12.7 && ./configure && make  -j8 && sudo make install

printf '\n\n%s\n' 'Jekyll Installation'
sudo gem install jekyll
printf '\n\n %s'
cd node-v0.12.7 && ./configure && make && sudo make install

printf '\n\n %s'
	```bash
			All of Jekyll’s gem dependencies are automatically installed by the above cmd,
			so you won’t have to worry about them at all.
	```


chmod 777 cuda.sh
sh cuda.sh
wait

printf '\n\n%s%s' 'setting command parser to 0; disabling the whitelist'
sudo su &&
echo 0 > /sys/module/i915/parameters/enable_cmd_parser

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
#August 31 
#	Added a separate file.sh for vivid packages
