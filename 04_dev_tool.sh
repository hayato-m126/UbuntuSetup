# document tool
sudo apt -y install doxygen doxygen-gui graphviz

# make tool
sudo apt -y install cmake cmake-curses-gui

brew install anyenv
brew install fzf
brew install ghq
brew install sachaos/tap/ac-deck
brew install github/gh/gh

# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt -y install virtualbox-6.1

# vmware
wget https://download3.vmware.com/software/player/file/VMware-Player-15.5.6-16341506.x86_64.bundle
sudo bash VMware-Player-15.5.6-16341506.x86_64.bundle
rm -rf VMware-Player-*.x86_64.bundle

# vagrant
wget https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb
sudo dpkg -i vagrant_*_x86_64.deb
rm -rf vagrant_*_x86_64.deb
