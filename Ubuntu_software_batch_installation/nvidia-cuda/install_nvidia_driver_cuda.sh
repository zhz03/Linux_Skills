# install NVIDIA-driver
sudo ubuntu-drivers autoinstall

# check nvidia-drive
nvidia-smi

# check cuda version
nvcc --version

# install lastest cuda using the instruction from website:
# https://developer.nvidia.com/cuda-11-4-1-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=18.04&target_type=runfile_local

# Linux; 
# x86_64
# Ubuntu 18.04 
# cuda 11.4 runfile 
# wget https://developer.download.nvidia.com/compute/cuda/11.4.1/local_installers/cuda_11.4.1_470.57.02_linux.run
# sudo sh cuda_11.4.1_470.57.02_linux.run

# copy paste the following to the .bashrc after install latest cuda
# export PATH="/usr/local/cuda-11.4/bin:$PATH"
# export LD_LIBRARY_PATH="/usr/local/cuda-11.4/lib64:$LD_LIBRARY_PATH"
