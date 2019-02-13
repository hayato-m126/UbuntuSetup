UBUNTU_VER=$(lsb_release -sc)

# tex environment
sudo apt -y install texlive-full
sudo apt -y install libpoppler-qt5-1
# tex editor
if [ "$UBUNTU_VER" = "bionic" ]; then
    wget http://download.opensuse.org/repositories/home:/jsundermeyer/xUbuntu_18.04/amd64/texstudio_2.12.10-1+3.1_amd64.deb
    sudo dpkg -i texstudio_2.12.10-1+3.1_amd64.deb
fi
if [ "$UBUNTU_VER" = "xenial" ]; then
    wget http://download.opensuse.org/repositories/home:/jsundermeyer/xUbuntu_16.04/amd64/texstudio_2.12.8-1+18.1_amd64.deb
    sudo dpkg -i texstudio_2.12.8-1+18.1_amd64.deb
fi

