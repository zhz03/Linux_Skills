# install ROS
## Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

## Set up your keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

## update souce
sudo apt update

## install ROS noetic
sudo apt install ros-noetic-desktop-full

## setup environment
source /opt/ros/noetic/setup.bash

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

## install package dependency
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

# sudo apt-get install build-essential

## initialize rosdep 
sudo rosdep init 
rosdep update 

# bug fix
# https://blog.csdn.net/tom17/article/details/107748686
# Command ‘roscore’ not found, but can be installed with:
# sudo apt install python-roslaunch
# sudo apt-get install ros-noetic-desktop

