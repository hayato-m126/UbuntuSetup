UBUNTU_VER=$(lsb_release -sc)

# install Graphic Driver
sudo add-apt-repository ppa:graphics-drivers/ppa
if [ "$UBUNTU_VER" = "xenial" ]; then
    sudo apt -y update
    sudo apt -y install nvidia-430
fi
if [ "$UBUNTU_VER" = "bionic" ]; then
    sudo apt -y install nvidia-driver-435
fi

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt -y update
sudo apt -y install -y nvidia-container-toolkit
sudo systemctl restart docker

