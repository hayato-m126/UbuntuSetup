# firewall for security
sudo apt -y install gufw

#setting editor
sudo apt -y install dconf-editor

#hardware infomation and benchmark
sudo apt -y install hardinfo

#swap
sudo apt -y install dphys-swapfile

# NetBIOS name resolve
sudo apt -y install winbind
sudo sed -i -e s/" dns"/" dns wins"/ /etc/nsswitch.conf

#NTP PC clock
sudo apt -y install chrony
sudo apt -y install ntpdate
sudo ntpdate -q ntp.nict.jp

# GUI grub editor
if [ $(lsb_release -sc) != "focal" ]; then
    sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
    sudo apt -y update
fi
sudo apt -y install grub-customizer

# partition tool
sudo apt -y install gparted

# disk analyzer
sudo apt -y install ncdu
