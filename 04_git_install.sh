# add repository
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt -y update

# git and git gui tools
sudo apt -y install git
sudo apt -y install gitk

# git lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt -y install git-lfs

# RabbitVCS
sudo apt -y install rabbitvcs-core rabbitvcs-cli rabbitvcs-nautilus
# cinnamonの環境が入っているとnemo用パッケージもインストールできる
sudo apt -y install nemo-rabbitvcs

