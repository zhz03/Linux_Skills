# how to remove all NVIDIA driver and CUDA tool-kit
## Deleting any NVIDIA/CUDA packages you may already have installed
sudo rm /etc/apt/sources.list.d/cuda*
sudo apt remove --autoremove nvidia-cuda-toolkit
sudo apt remove --autoremove nvidia-*

## Deleting any remaining Cuda files on /usr/local/
sudo rm -rf /usr/local/cuda*

## Purge any remaining NVIDIA configuration files
sudo apt-get purge nvidia*

## updating and deleting unnecessary dependencies.
sudo apt-get update
sudo apt-get autoremove
sudo apt-get autoclean

