UBUNTU_VER=$(lsb_release -sc)

# .Net
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

if [ "$UBUNTU_VER" = "bionic" ]; then
    sudo apt -y install apt-transport-https dirmngr
    echo "deb https://download.mono-project.com/repo/ubuntu vs-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-vs.list
fi
if [ "$UBUNTU_VER" = "xenial" ]; then
    sudo apt -y install apt-transport-https
    echo "deb https://download.mono-project.com/repo/ubuntu vs-xenial main" | sudo tee /etc/apt/sources.list.d/mono-official-vs.list
fi

sudo apt -y update
sudo apt -y install monodevelop
