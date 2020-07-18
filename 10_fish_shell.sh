if [ $(lsb_release -sc) != "focal" ]; then
    sudo apt-add-repository -y ppa:fish-shell/release-3
    sudo apt update
fi
sudo apt -y install fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# brew install fzf
