#/bin/bash

source $HOME/.asdf/asdf.sh
asdf plugin add direnv
asdf plugin add fzf
asdf plugin add ghq
asdf plugin add golang
asdf plugin add nodejs
asdf plugin add python
asdf plugin add awscli
asdf plugin add yq
asdf plugin add ripgrep
asdf plugin add aws-sam-cli

poetry config virtualenvs.in-project true

./fish_prepare.sh

bash $HOME/.dotfiles/install.sh

# commands below needs source .bashrc
asdf install
./fisher_update.sh
