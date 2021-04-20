#!/bin/bash

# install script for UBUNUT 20.04
# installing some basic system utilitis first

cd ~
sudo apt-get update
sudo apt upgrade

# ===========================================#

# enable firewall 
sudo ufw enable 
sudo apt-get install gufw
# to disable firewall
sudo ufw disable

# remove apport pop-up windows
sudo apt remove apport apport-gtk

# install synaptic package manager
sudo apt-get install synaptic

# install GNOME Tweak Tool
sudo apt-get install gnome-tweak-tool -y

# install ubuntu cleaner
sudo add-apt-repository ppa:gerardpuig/ppa
sudo apt-get update
sudo apt-get install Ubuntu-cleaner

# install terminator
sudo apt-get update
sudo apt-get install terminator

# install fusuma 
# https://github.com/iberianpig/fusuma
# https://blog.csdn.net/xiaoduanayu/article/details/105779245

# isntall tmux

# install ncdu

# install timetrack

# install screenfetch
sudo apt install screenfetch
# ============software installation===========#

# install java
sudo apt install default-jre
sudo apt install default-jdk

# install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# install vim (optional)
sudo apt-get update
sudo apt-get install vim

# install typora
sudo apt-get update
sudo apt-get install typora
echo "Java has been installed"

# install chrome
sudo apt update
sudo apt upgrade
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# install gitkraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb

# install arduino
# step1: https://www.arduino.cc/en/software
# download linux 64 bits
# extract to the file 
# ./install.sh

# install anaconda
# Step 1: https://www.anaconda.com/products/individual#Downloads
# Step 2: Navigate to your Downloads folder and type the follow command:
# bash Anaconda3-2020.11-Linux-x86_64.sh
# step 3: add anaconda3 path to environment:
# export PATH=/home/yourusername/anaconda3/bin:$PATH

# jupyter auto-completion
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user --skip-running-check
# activate jupyter notebook and go to "Nbextensions", click Hinterland

# install pycharm
sudo snap install pycharm-professional --classic

# install Clion



