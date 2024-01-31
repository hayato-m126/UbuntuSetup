#/bin/bash

poetry config virtualenvs.in-project true

./fish_prepare.sh

bash $HOME/.dotfiles/install.sh

# commands below needs source .bashrc
# mise install
./fisher_update.sh
