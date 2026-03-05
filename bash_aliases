# system maintenance
alias update='sudo apt-get update'
alias install='sudo apt install '
alias search='apt-cache search'

# Anaconda Aliases
alias 311='conda activate 311'
alias 310='conda activate 310'
alias off='conda deactivate'
alias jup='jupyter notebook'
alias lab='jupyter lab'

alias stew='sudo docker run -it --rm --env="DISPLAY=$DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --runtime=nvidia --volume ~/Documents/ML-Control-Rob/lalearn:/home/lalearn --volume ~/anaconda3:/home/anaconda3 --network host --gpus all YOUR_DOCKER_USERNAME/melodic-stewart:latest'

# directories nav
alias desk='cd $HOME/Desktop'
alias doc='cd $HOME/Documents'
alias down='cd $HOME/Downloads'
alias lats='cd $HOME/Documents/ML-Control-Rob/LatentLearner/robots'
alias mlcont='cd $HOME/Documents/ML-Control-Rob'
alias reach='cd ~/Documents/ML-Control-Rob/LevelSets'
alias lev='cd ~/Documents/ML-Control-Rob/LevelSets/LevelSetPy'
alias blog='cd $HOME/Documents/blog'
alias papers='cd $HOME/Documents/Papers'
alias shells='cd $HOME/Downloads/shells'
alias cspace='cd $HOME/Documents/ML-Control-Rob/denseslam/cspace'
alias denseslam='cd $HOME/Documents/ML-Control-Rob/denseslam'
alias swe='cd $HOME/Documents/ML-Control-Rob/SWEngr'
alias prius='cd $HOME/sandbox_ws/src/prius_nav'
alias cv='cd $HOME/Documents/grants/cv'
alias grants='cd $HOME/Documents/grants'
alias data='cd /media/$USER/data'

# ROS LAUNCHERS
alias torup='roslaunch toroboarm_seven_bringup bringup_real.launch'
alias torik='roslaunch torobo_ik torobo.launch'
alias torgaz='roslaunch toroboarm_seven_gazebo toroboarm_world.launch pause:=true'
alias cb='catkin build'
alias col='colcon build'

# delineate python2.7 from anaconda installs
# alias python2.7='/usr/bin/python2.7'

# Chrome size for team viewer?
export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=1024x768
# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export SOFA_ROOT=$HOME/sofa/build

# PATHS EXPORTS
export PATH=$HOME/bin:$HOME/gems/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/ruby:/snap/bin:/usr/local/opt/gettext/bin:/usr/local/opt/openssl/bin:${PATH:+:${PATH}}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export ROS_PACKAGE_PATH=$HOME/ros2_ws/src:${ROS_PACKAGE_PATH:+${ROS_PACKAGE_PATH}}
export PYTHONPATH=$HOME/Documents/ML-Control-Rob/robotics/holosoma/src/holosoma:~/Documents/ML-Control-Rob/LevelSets/LevelSetsPy${PYTHONPATH:+:${PYTHONPATH}}
export LIBGL_ALWAYS_INDIRECT=0

# LATEX
export TEXINPUTS=~/Documents/pgfplots/tex//:
export TEXINPUTS=~/Documents/pgfplots/doc//:
export LUAINPUTS=~/Documents/pgfplots//:

# CPP FLAGS
export LDFLAGS="-L/usr/local/opt/gettext/lib:-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/gettext/include:-I/usr/local/opt/openssl/include"

# ROS 2 Thingsy
export ROS_MASTER_URI=http://localhost:11311
export ROS_HOSTNAME=localhost
export SCREENDIR=$HOME/.screen

# export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export DISPLAY=:1.0
export LIBGL_ALWAYS_INDIRECT=0

export DOCKER_HOST=unix:///run/user/1000/docker.sock
export XAUTH=/tmp/.docker.xauth
export MESA_LOADER_DRIVER_OVERRIDE=i965
export HF_TOKEN=""


# when gazebo does not work out of the box, be sure to follow:
# export LIBGL_ALWAYS_INDIRECT=0
# See https://answers.ros.org/question/369031/gazebo-simulator-window-is-not-opening/
export ROS_DISTRO=humble
source /opt/ros/humble/setup.bash

# Genesis thingsy
export OMNI_KIT_ACCEPT_EULA=yes

GIT_LFS_SKIP_SMUDGE=1 uv sync
GIT_LFS_SKIP_SMUDGE=1 uv pip install -e .


export HF_TOKEN=""
export PHENOML_USERNAME=""
export PHENOML_PASSWORD=""
export PHENOML_BASE_URL=""
export PHENOML_TOKEN=""
# Open AI Key
export OPENAI_API_KEY=""
export GOOGLE_API_KEY=""
export GOOGLE_GENAI_USE_VERTEXAI="FALSE"


export LD_LIBRARY_PATH=$HOME/.mujoco/mujoco210/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export PATH="$LD_LIBRARY_PATH:$PATH"
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so
