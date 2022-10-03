#!/bin/bash
# install script for UBUNUT 20.04

cd ~
sudo apt-get update
sudo apt upgrade

# remove apport pop-up windows
sudo apt remove apport apport-gtk

# install synaptic package manager
sudo apt-get install synaptic
sudo apt-get update

# install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

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

# install tweaks
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
sudo apt install gnome-shell-extensions

# dash-to-dock
# in the fire fox web browser:
# install Gnome extensions
# https://extensions.gnome.org/extension/307/dash-to-dock/

# install remmina
sudo snap install remmina

# install media player
sudo snap install vlc

# install java
sudo apt install default-jre
sudo apt install default-jdk

# install zoom
# using snap store or:
sudo snap install zoom-client

# install pycharm
sudo snap install pycharm-professional --classic

# install clion
sudo snap install clion --classic

# install wps office
# go to https://www.wps.com/
# cd Downloads/
# sudo dpkg -i wps-office_11.1.0.10920.XA_amd64.deb
# to remove a.deb file
# sudo apt-get remove package_name

# install anaconda
# download anconda from website: https://www.anaconda.com/products/distribution#Downloads
# cd Downloads/
# bash Anaconda3-2021.11-Linux-x86_64.sh
#  conda config --set auto_activate_base false


# install gparted
sudo apt-get install gparted

# install ruby
# check ruby version
# ruby -v
# check gem version
# gem --version
# sudo gem update --system
# sudo apt install ruby-dev




