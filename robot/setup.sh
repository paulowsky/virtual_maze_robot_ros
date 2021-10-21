#!/bin/bash

echo 'source "/opt/ros/$ROS_DISTRO/setup.bash"' >> /root/.bashrc
echo 'source "/root/catkin_ws/devel/setup.bash"' >> /root/.bashrc

source /opt/ros/$ROS_DISTRO/setup.bash
source /root/catkin_ws/devel/setup.bash

catkin_make
