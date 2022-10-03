sudo apt update
sudo apt upgrade

# setup apt repository
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"

# install virtualbox on ubuntu 18.04
sudo apt update 
sudo apt install virtualbox-6.1


