if [ $# -ne 2 ]; then
  echo "usage: ./ssh_settings.sh public_key port_number"
  exit 1
fi

mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo $1 > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# ssh security setting
sudo sed -i -e s/"#Port 22"/"Port $2"/ /etc/ssh/sshd_config
sudo sed -i -e s/"#AuthorizedKeysFile"/"AuthorizedKeysFile"/ /etc/ssh/sshd_config
sudo sed -i -e s/"#PasswordAuthentication yes"/"PasswordAuthentication no"/ /etc/ssh/sshd_config

sudo sed -i -e s/"PermitRootLogin prohibit-password"/"PermitRootLogin no"/ /etc/ssh/sshd_config
