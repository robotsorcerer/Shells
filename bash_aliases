# system maintenance
alias update='sudo apt-get update'
alias install='sudo apt install '
alias search='apt-cache search'

# Anaconda Aliases
alias 38='conda activate 38'
alias off='conda deactivate'
alias jup='jupyter notebook'
alias lab='jupyter lab'

alias wintainer='ssh -L 13389:10.8.32.20:3389 NORTHAMERICA.lekanmolu@jumptainer.westus2.cloudapp.azure.com -p 22222'
alias lintainer='ssh -p 22222 NORTHAMERICA.lekanmolu@jumptainer.westus2.cloudapp.azure.com'
alias linsandbox='ssh -X 10.8.16.39'
alias azure='ssh -i ~/.ssh/config -p 42233 lekanmolu@az-eus-p40-6-worker-30027.eastus.cloudapp.azure.com'
alias tunnel='ssh -NfL 8080:localhost:8080 gcrnix'
alias gcrnix='ssh gcrnix'
alias stew='sudo docker run -it --rm --env="DISPLAY=$DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --runtime=nvidia --volume ~/Documents/ML-Control-Rob/lalearn:/home/lalearn --volume ~/anaconda3:/home/anaconda3 --network host --gpus all lakehanne/melodic-stewart:latest'

# directories nav
alias desk='cd /home/lex/Desktop'
alias doc='cd /home/lex/Documents'
alias down='cd /home/lex/Downloads'
alias lats='cd /home/lex/Documents/ML-Control-Rob/LatentLearner/robots'
alias mlcont='cd /home/lex/Documents/ML-Control-Rob'
alias reach='cd ~/Documents/ML-Control-Rob/LevelSets'
alias lev='cd ~/Documents/ML-Control-Rob/LevelSets/LevelSetPy'
alias brat='cd ~//Documents/ML-Control-Rob/LevelSets/LargeBRAT'
alias msr='cd /home/lex/Documents/MSRProjs'
alias igl='cd /home/lex/Documents/MSRProjs/IGL'
alias blog='cd /home/lex/Documents/blog'
alias papers='cd /home/lex/Documents/Papers'
alias shells='cd /home/lex/Downloads/shells'
alias lyap='cd /home/lex/Documents/ML-Control-Rob/LyapunovLearner'
alias safe='cd /home/lex/Documents/Papers/Safety'
alias pubs22='cd /home/lex/Documents/Papers/Pubs22'
alias pubs23='cd /home/lex/Documents/Papers/Pubs23'
alias dcm='cd /home/lex/Documents/moplan/DCM/python'
alias moplan='cd /home/lex/Documents/moplan/'
alias prius='cd /home/lex/sandbox_ws/src/prius_nav'

# ROS LAUNCHERS
alias torup='roslaunch toroboarm_seven_bringup bringup_real.launch'
alias torik='roslaunch torobo_ik torobo.launch'
alias torgaz='roslaunch toroboarm_seven_gazebo toroboarm_world.launch pause:=true'
alias cb='catkin build'
alias col='colcon build'

# delineate python2.7 from anaconda installs
alias python2.7='/usr/bin/python2.7'

# Chrome size for team viewer?
export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=1024x768
# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export SOFA_ROOT=$HOME/sofa/build

# PATHS EXPORTS
export PATH=/usr/local/texlive/2023/bin/x86_64-linux/:~/Documents/moplan/pympnn/boost_py3.8/build/extern/lib:~/Documents/moplan/pympnn/build:~/Documents/moplan/pympnn/boost_py3.8/build:$HOME/bin:$HOME/gems/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/ruby:/snap/bin:/usr/local/opt/gettext/bin:/usr/local/opt/openssl/bin:${PATH:+:${PATH}}
export LD_LIBRARY_PATH=~/Documents/moplan/pympnn/boost_py3.8/build/extern/lib:~/Documents/moplan/pympnn/build:~/Documents/moplan/pympnn/boost_py3.8/build:$HOME/.mujoco/mujoco210/bin:/usr/local/cuda-11.7/lib64:$HOME/.mujoco/mujoco211/bin:${SOFA_ROOT}/lib:/usr/lib/nvidia${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so
export MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man
export INFOPATH=/usr/local/texlive/2023/texmf-dist/doc/info
export ROS_PACKAGE_PATH=/home/lex/ros2_ws/src:${ROS_PACKAGE_PATH:+${ROS_PACKAGE_PATH}}
export PYTHONPATH=~/Documents/moplan/ctr-design-and-path-plan:~/Documents/moplan/pympnn/boost_py3.8/build/extern/lib:~/Documents/moplan/pympnn/build:~/Documents/moplan/pympnn/boost_py3.8/build:~/Documents/ML-Control-Rob/LevelSets/LevelSetsPy${PYTHONPATH:+:${PYTHONPATH}}
export LIBGL_ALWAYS_INDIRECT=0

# LATEX
export TEXINPUTS=~/Documents/pgfplots/tex//:
export TEXINPUTS=~/Documents/pgfplots/doc//:
export LUAINPUTS=~/Documents/pgfplots//:

# CPP FLAGS
export LDFLAGS="-L/usr/local/opt/gettext/lib:-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/gettext/include:-I/usr/local/opt/openssl/include"

# ROS 2 Thingsy
source /opt/ros/foxy/setup.bash
source /usr/share/colcon_cd/function/colcon_cd.sh
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash

export ROS_MASTER_URI=http://localhost:11311
export ROS_HOSTNAME=localhost
export SCREENDIR=$HOME/.screen

# export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export DISPLAY=:1.0
export LIBGL_ALWAYS_INDIRECT=0

export DOCKER_HOST=unix:///run/user/1000/docker.sock
export XAUTH=/tmp/.docker.xauth
export MESA_LOADER_DRIVER_OVERRIDE=i965


# when gazebo does not work out of the box, be sure to follow:
# export LIBGL_ALWAYS_INDIRECT=0
# See https://answers.ros.org/question/369031/gazebo-simulator-window-is-not-opening/
export ROS_DISTRO=noetic
