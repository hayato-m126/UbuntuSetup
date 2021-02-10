UBUNTU_VER=$(lsb_release -sc)

if [ "$UBUNTU_VER" = "focal" ]; then
    sudo apt install pipx
    sudo apt install python3-venv
fi

# make tool
sudo apt -y install cmake cmake-curses-gui

brew install anyenv
brew install fzf
brew install ghq

# diff tool
sudo apt -y install meld

# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
sudo apt -y install virtualbox-6.1
