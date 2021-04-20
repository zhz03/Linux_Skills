#!/bin/bash
# install script for UBUNUT 20.04

cd ~
sudo apt-get update
sudo apt upgrade

# remove apport pop-up windows
sudo apt remove apport apport-gtk

# remove some useless packages
sudo apt-get remove  fluid
sudo apt-get remove --auto-remove fluid

# install synaptic package manager
sudo apt-get install synaptic
sudo apt-get update

# install tmux
sudo apt-get install tmux
sudo apt-get update

# install screenfetch
sudo apt install screenfetch
sudo apt update

# install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# install vim (optional)
sudo apt-get update
sudo apt-get install vim

# install chrome
sudo apt update
sudo apt upgrade
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# install gitkraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb

# install typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora

# install terminator
sudo apt-get update
sudo apt-get install terminator

# install java
sudo apt install default-jre
sudo apt install default-jdk

# install pycharm
sudo snap install pycharm-professional --classic

# install Clion
## Go to the download website:https://www.jetbrains.com/clion/download/#section=linux
## Download the tar.gz file and go to download folder
## tar -xzf CLion-*.tar.gz
## in the extracted folder->bin-> ./Clion.sh to install

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
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool 

sudo apt-get install build-essential

## initialize rosdep 
sudo rosdep init
rosdep update 

