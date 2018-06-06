alias cm='catkin_make'
alias cb='catkin build'
alias ctkn='cd ~/catkin_ws'
alias jup='jupyter notebook'
alias lab='jupyter lab'
alias update='sudo apt-get update'
alias install='sudo apt install -y'
alias search='apt-cache search'
alias 27on='source activate py27'
alias 27off='source deactivate py27'
alias 35='source activate py35'
alias 35off='source deactivate py35'
alias gps='cd ~/catkin_ws/src/gps'
alias papers='cd ~/Documents/Papers'
alias shells='cd ~/Downloads/shells'
alias down='cd ~/Downloads'
alias desk='cd ~/Desktop'
alias doc='cd ~/Documents'
alias blog='cd ~/Documents/blog'
alias schol='cd ~/Desktop/scholternships'
alias shell='cd ~/Downloads/shells'
#alias mounttdrive='sudo mount.cifs //mrocfs.utmroc.swmed.org/mrocdata/ /home/lex/mount/tdrive/ -o rw,username=s179161,domain=utmroc,uid=1000,gid=1000'
alias mounttdrive="sudo mount.cifs '//mrocfs.utmroc.swmed.org/mrocdata/Phys Research/Users/Lekan' /home/lex/tdrive/ -o rw,username=s179161,domain=utmroc,uid=1000,gid=1000"
alias mountudrive='sudo mount.cifs //mrocfs.utmroc.swmed.org/home/S179161/ /home/lex/udrive/ -o rw,username=s179161,domain=utmroc,uid=1000,gid=1000'
#alias tdrive='cd "/home/lex/mount/tdrive/Phys Research/Users/Lekan"'
alias tdrive='cd "/home/lex/tdrive"'
alias udrive='cd "/home/lex/udrive"'
alias swmed='ssh -X lex@129.112.133.210'

alias oncol='cd ~/Documents/NNs/RadOncol'
alias scr='cd ~/Documents/NNs/RadOncol/beam_optim/scripts'
alias rok80='ssh -X lekan@rok80x8.dhcp.swmed.org'


# delineate python2.7 from anaconda installs
alias python2.7='/usr/bin/python2.7'

export TEXINPUTS=/home/$USER/Documents/pgfplots/tex//:
export TEXINPUTS=/home/$USER/Documents/pgfplots/doc//:
export LUAINPUTS=/home/$USER/Documents/pgfplots//:

#ROS MASTER Exports
#export ROS_MASTER_URI=http://172.17.0.2:11311
#export ROS_HOSTNAME=192.168.1.7

#ROS MASTER FOR LOCAL LONNECTIONS
export ROS_MASTER_URI=http://localhost:11311
export ROS_HOSTNAME=localhost

# CUDA EXPORTS
export PATH=/usr/local/cuda-9.1/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64:/home/$USER/mujoco/mjpro150/bin:/home/$USER/mujoco/mjpro131/bin:~/Documents/NNs/radoncol/beam_optim/build/lib:~/catkin_ws/src/gps/build/lib:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# /home/lex/anaconda3/lib
export ROS_PACKAGE_PATH=~/catkin_ws/src/gps:~/catkin_ws/src/gps/gps_agent_pkg:~/catkin_ws/src/ral/pyrnn${ROS_PACKAGE_PATH:+${ROS_PACKAGE_PATH}}
export CAFFE_ROOT=~/Documents/caffe/build_cudnn
#export PYTHONPATH=~/Documents/NNs/RadOncol/beam_optim/build/lib:~/Documents/NNs/RadOncol/prepro_dicoms/rt5py:~/catkin_ws/src/gps:~/Documents/caffe/python:~/catkin_ws/src/gps/build/lib:~/catkin_ws/src/gps/gps_agent_pkg${PYTHONPATH:+:${PYTHONPATH}}
export PYTHONPATH=~/Documents/NNs/RadOncol/beam_optim:~/Documents/NNs/RadOncol/beam_optim/scripts${PYTHONPATH:+:${PYTHONPATH}}
#source /opt/ros/kinetic/setup.bash
#source ~/catkin_ws/devel/setup.bash
#source /opt/ros/r2b3/setup.bash
#source /opt/ros/r2b3/share/ros2cli/environment/ros2-argcomplete.bash

#RMW_IMPLEMENTATION=rmw_opensplice_cpp
#source /opt/ros/r2b3/setup.bash
#source /opt/ros/r2b3/share/ros2cli/environment/ros2-argcomplete.bash
#RMW_IMPLEMENTATION=rmw_opensplice_cpp

if [ -d /home/$USER/anaconda2/bin ]; then
  export PATH="/home/$USER/anaconda2/bin:${PATH:+:${PATH}}"
elif [ -d /home/$USER/anaconda3/bin ]; then
  export PATH="/home/$USER/anaconda3/bin:${PATH:+:${PATH}}"
else
  echo "Could not find an anaconda path. Please amend your path variable manually."
fi


http_proxy=http://proxy.swmed.edu:3128
https_proxy=http://proxy.swmed.edu:3128 
export http_proxy
export https_proxyy
export BROWSER=google-chrome
source /opt/ros/kinetic/setup.bash
