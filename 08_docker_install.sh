UBUNTU_VER=$(lsb_release -sc)

sudo apt -y update
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"
sudo apt -y update
sudo apt -y install docker-ce docker-ce-cli containerd.io
# add user to docker group
sudo gpasswd -a $USER docker
# install docker-compose
# check github latest release and replace version number.
sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# グループに追加しても、dockerコマンドをユーザーのまま実行出来なかった。再起動したらいけた
sudo reboot
