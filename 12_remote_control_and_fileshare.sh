UBUNTU_VER=$(lsb_release -sc)

# install ssh-server
sudo apt -y install openssh-server

# RDP
if [ "$UBUNTU_VER" = "xenial" ]; then
    sudo add-apt-repository -y ppa:hermlnx/xrdp
    sudo apt update
fi
sudo apt -y install xrdp

# RDP設定、new_cursorsの無効化
sudo sed -e 's/^new_cursors=true/new_cursors=false/g' \
 -i /etc/xrdp/xrdp.ini

# xrdpサービスの再起動
sudo systemctl restart xrdp

# xsessionファイルの作成、cinnamonでログインする
# Ubuntu18.04では本体側でログアウトが必要。ログイン状態だとリモート出来ない。
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


