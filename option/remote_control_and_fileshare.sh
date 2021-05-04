UBUNTU_VER=$(lsb_release -sc)

# install ssh-server
sudo apt -y install openssh-server

# windows file share
sudo apt -y install samba
# share ~/share
mkdir -p ~/share
echo "[share]" | sudo tee -a /etc/samba/smb.conf
echo "path = /home/$USER/share" | sudo tee -a /etc/samba/smb.conf
echo "read only = No" | sudo tee -a /etc/samba/smb.conf
echo "guest ok = Yes" | sudo tee -a /etc/samba/smb.conf
echo "force user = $USER" | sudo tee -a /etc/samba/smb.conf
sudo service smbd restart
