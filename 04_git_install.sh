# add repository
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt -y update

# git and git gui tools
sudo apt -y install git
sudo apt -y install gitk

# git lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt -y install git-lfs

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "test -d /home/linuxbrew/.linuxbrew && eval \$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" | tee -a ~/.bashrc

# document tool
sudo apt -y install doxygen doxygen-gui graphviz

# make tool
sudo apt -y install cmake cmake-curses-gui

brew install anyenv
brew install fzf
