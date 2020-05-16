sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt update
sudo apt -y install fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# fisher add rafaelrinaldi/pure
# fisher add edc/bass
# fisher add jethrokuan/z
# fisher add jethrokuan/fzf


