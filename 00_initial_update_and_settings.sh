UBUNTU_VER=$(lsb_release -sc)

# initial update
sudo apt -y update
sudo apt -y upgrade

# git repository
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt -y update

# git and git gui tools
sudo apt -y install git

# git lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt -y install git-lfs

# install curl
sudo apt -y install curl

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "test -d /home/linuxbrew/.linuxbrew && eval \$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" | tee -a ~/.bashrc

# English folder name, easy to type directory
LANG=C xdg-user-dirs-update --force

# delete guest session, bionic default off
if [ "$UBUNTU_VER" = "xenial" ]; then
    echo "allow-guest=false" | sudo tee -a /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
fi

# do not sleep when close display
echo "HandleLidSwitch=ignore" | sudo tee -a /etc/systemd/logind.conf

# add to dialout group to use serial port
sudo gpasswd -a $USER dialout

# clock setting, use localtime
sudo timedatectl set-local-rtc 1 --adjust-system-clock
sudo hwclock -D --systohc --localtime

# multi window console
sudo apt -y install terminator

# google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt -y update
sudo apt -y install google-chrome-stable
#なぜかキーが重複していると言われるので消す
sudo rm /etc/apt/sources.list.d/google.list

# install Hardware Enablement kernel
if [ "$UBUNTU_VER" = "xenial" ]; then
    sudo apt -y install --install-recommends linux-generic-hwe-16.04
    sudo apt -y install --install-recommends xserver-xorg-hwe-16.04
fi
if [ "$UBUNTU_VER" = "bionic" ]; then
    sudo apt -y install --install-recommends linux-generic-hwe-18.04
fi
if [ "$UBUNTU_VER" = "focal" ]; then
    sudo apt -y install --install-recommends linux-generic-hwe-20.04
fi

# and then reboot
sudo reboot
