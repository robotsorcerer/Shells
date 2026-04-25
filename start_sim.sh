#!/bin/bash

byobu new-session -d -s bringup
byobu select-pane -t 0
byobu split-window -h
byobu select-pane -t 1
byobu split-window -v
byobu select-pane -t 0
byobu split-window -v

byobu send-keys -t 0 'roscore' 'C-m'
sleep 2.
byobu send-keys -t 1 'roslaunch seed_r7_ms_bringup seed_r7_msjupiterio_bringup.launch' 'C-m'
#byobu send-keys -t 2 'roslaunch seed_r7_ms_bringup seed_r7_ms_wheel_bringup.launch' 'C-m'
byobu send-keys -t 2 'roslaunch seed_navigation_manager dummy_navigation_manager.launch' 'C-m'
sleep 2.

byobu new-window
byobu select-pane -t 0
byobu split-window -h
byobu select-pane -t 1
byobu split-window -v
byobu select-pane -t 0
byobu split-window -v

byobu send-keys -t 0 'roslaunch seed_r7_msjupiterio_moveit_config move_group.launch' 'C-m'


byobu new-window
byobu select-pane -t 0
byobu split-window -h
byobu select-pane -t 1
byobu split-window -v
byobu select-pane -t 0
byobu split-window -v

# not enough machine power, don't launch kinematics on this machine
# but launch as an option for simple navigation setup
byobu send-keys -t 0 'roslaunch seed_postural_kinematics seed_postural_kinematics.launch' 'C-m'

#byobu send-keys -t 1 'python /scripts/tf2_bridge/tf2_bridge.py' 'C-m'
# byobu send-keys -t 2 'rosrun seed_r7_controller_tests tssbridge' 'C-m'
byobu send-keys -t 2 'roslaunch seed_r7_controller_tests tssbridge.launch' 'C-m'
byobu send-keys -t 3 'roslaunch rosbridge_server rosbridge_websocket.launch unregister_timeout:=99999999' 'C-m'

byobu new-window
byobu select-pane -t 0
byobu split-window -h
byobu select-pane -t 1
byobu send-keys -t 0 'python /scripts/tf2_bridge/tf2_bridge.py' 'C-m'
#byobu send-keys -t 1 'python /scripts/tf2_bridge/dynamic_publisher.py _parent:=/map _child:=/base_link _pose:=[0,0,0,0,0,0,1]' 'C-m'

byobu attach -t bringup
