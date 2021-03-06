# install mono
sudo apt -y install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt -y update
sudo apt -y install mono-devel

# install manictime
wget https://cdn.manictime.com/setup/linux/v1_1_1_0/ManicTime.deb
sudo dpkg -i ManicTime.deb
sudo apt -f install -y
