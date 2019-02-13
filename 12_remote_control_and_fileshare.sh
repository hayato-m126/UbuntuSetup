if [ $# -ne 2 ]; then
  echo "usage: ./16_remote_control_and_fileshare.sh public_key port_number"
  exit 1
fi

UBUNTU_VER=$(lsb_release -sc)

# install ssh-server
sudo apt -y install openssh-server

mkdir ~/.ssh
chmod 700 ~/.ssh
echo $1 > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# ssh security setting
sudo sed -i -e s/"Port 22"/"Port $2"/ /etc/ssh/sshd_config
sudo sed -i -e s/"#AuthorizedKeysFile"/"AuthorizedKeysFile"/ /etc/ssh/sshd_config
sudo sed -i -e s/"#PasswordAuthentication yes"/"PasswordAuthentication no"/ /etc/ssh/sshd_config

sudo sed -i -e s/"PermitRootLogin prohibit-password"/"PermitRootLogin no"/ /etc/ssh/sshd_config

# RDP
if [ "$UBUNTU_VER" = "xenial" ]; then
    sudo add-apt-repository -y ppa:hermlnx/xrdp
    sudo apt update
fi
sudo apt -y install xrdp

#new_cursorsの無効化
sudo sed -e 's/^new_cursors=true/new_cursors=false/g' \
 -i /etc/xrdp/xrdp.ini

#xrdpサービスの再起動
sudo systemctl restart xrdp

#xsessionファイルの作成
echo "cinnamon-session" > ~/.xsession
D=/usr/share/gnome:/usr/share/cinnamon:/usr/local/share:/usr/share
D=${D}:/var/lib/snapd/desktop
C=/etc/xdg/xdg-cinnamon:/etc/xdg
cat <<EOF > ~/.xsessionrc
export XDG_SESSION_DESKTOP=cinnamon
export XDG_DATA_DIRS=${D}
export XDG_CONFIG_DIRS=${C}
EOF

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


