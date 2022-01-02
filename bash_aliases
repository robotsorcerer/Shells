# system maintenance
alias update='sudo apt-get update'
alias install='sudo apt install '
alias search='apt-cache search'

# Anaconda Aliases
alias 37='conda activate 37'
alias 38='conda activate 38'
alias siren='conda activate siren'
alias off='conda deactivate'
alias jup='jupyter notebook'
alias lab='jupyter lab'

alias wintainer='ssh -L 13389:10.8.32.20:3389 NORTHAMERICA.lekanmolu@jumptainer.westus2.cloudapp.azure.com -p 22222'
alias lintainer='ssh -p 22222 NORTHAMERICA.lekanmolu@jumptainer.westus2.cloudapp.azure.com'
alias linsandbox='ssh -X 10.8.16.39'
alias azure='ssh -i ~/.ssh/config -p 42233 lekanmolu@az-eus-p40-6-worker-30027.eastus.cloudapp.azure.com'
alias tunnel='ssh -NfL 8080:localhost:8080 gcrnix'
alias gcrnix='ssh gcrnix'
alias disp='set-variable -name DISPLAY -value 172.31.192.1:0.0'
alias DISPLAY=:0.0


# directories nav
alias desk='cd /home/lex/Desktop'
alias doc='cd /home/lex/Documents'
alias down='cd /home/lex/Downloads'
alias mlcont='cd /home/lex/Documents/ML-Control-Rob'
alias lev='cd /home/lex/Documents/ML-Control-Rob/Reachability/LevelSetsPy'
alias part='cd /home/lex/Documents/ML-Control-Rob/Reachability/PartiGames'
alias msr='cd /home/lex/Documents/MSRProjs'
alias igl='cd /home/lex/Documents/MSRProjs/IGL'
alias reach='cd /home/lex/Documents/ML-Control-Rob/Reachability'
alias blog='cd /home/lex/Documents/blog'
alias papers='cd /home/lex/Documents/Papers'
alias shells='cd /home/lex/Downloads/shells'
alias schol='cd /home/lex/Desktop/scholternships'
alias lyap='cd /home/lex/Documents/ML-Control-Rob/LyapunovLearner'

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
export PATH=$HOME/gems/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/opt/gettext/bin:/usr/local/opt/openssl/bin:${PATH:+:${PATH}}
export MANPATH=/usr/local/texlive/2019/texmf-dist/doc/man
export INFOPATH=/usr/local/texlive/2019/texmf-dist/doc/info
export LD_LIBRARY_PATH=${SOFA_ROOT}/lib:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export ROS_PACKAGE_PATH=/home/lex/catkin_ws/src/gps:${ROS_PACKAGE_PATH:+${ROS_PACKAGE_PATH}}
export PYTHONPATH=~/anaconda3:~/Documents/ML-Control-Rob/Reachability/LevelSetsPy:${PYTHONPATH:+:${PYTHONPATH}}

# LATEX
export TEXINPUTS=~/Documents/pgfplots/tex//:
export TEXINPUTS=~/Documents/pgfplots/doc//:
export LUAINPUTS=~/Documents/pgfplots//:

# CPP FLAGS
export LDFLAGS="-L/usr/local/opt/gettext/lib:-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/gettext/include:-I/usr/local/opt/openssl/include"

# ROS PATHS
source /opt/ros/melodic/setup.bash
export ROS_MASTER_URI=http://localhost:11311
export ROS_HOSTNAME=localhost
export SCREENDIR=$HOME/.screen
export OML_API_KEY="94396c70d38d67d4aa8ce5727ca55b4e"

export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

#source /opt/ros/dashing/setup.bash
#source ~/ros2_ws/install/setup.bash
