# check CUDNN and CUDA runtime library
nvcc --version
# install cuda toolkit [cannot use this, this will install cuda 9.1]
sudo apt-get install nvidia-cuda-toolkit
# remove cuda toolkit
sudo apt-get remove --auto-remove nvidia-cuda-toolkit

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

# install NVIDIA-driver
sudo ubuntu-drivers autoinstall

# install lastest cuda using the instruction from website:
# https://developer.nvidia.com/cuda-11-4-1-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=18.04&target_type=runfile_local

# copy paste the following to the .bashrc after install latest cuda
export PATH="/usr/local/cuda-11.4/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-11.4/lib64:$LD_LIBRARY_PATH"
