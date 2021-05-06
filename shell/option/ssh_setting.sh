# ssh security setting
sudo sed -i -e s/"#Port 22"/"Port $2"/ /etc/ssh/sshd_config
sudo sed -i -e s/"#AuthorizedKeysFile"/"AuthorizedKeysFile"/ /etc/ssh/sshd_config
sudo sed -i -e s/"#PasswordAuthentication yes"/"PasswordAuthentication no"/ /etc/ssh/sshd_config

sudo sed -i -e s/"PermitRootLogin prohibit-password"/"PermitRootLogin no"/ /etc/ssh/sshd_config
