#!/bin/bash

if !(command -v ansible-playbook  > /dev/null 2>&1); then
    sudo apt -y update
    sudo apt -y upgrade
    sudo apt install -y ansible
fi

ansible-playbook -i ansible/inventories/localhost.ini ansible/setup-ubuntu22.04.yml --ask-become-pass -e ansible_user=$USER

source $HOME/.asdf/asdf.sh
asdf plugin add direnv
asdf plugin add fzf
asdf plugin add ghq
asdf plugin add golang
asdf plugin add nodejs
asdf plugin add python
asdf plugin add awscli
asdf plugin add kubectl
asdf plugin add yq
asdf plugin add asciidoctorj
asdf plugin add ripgrep
asdf plugin add aws-sam-cli

poetry config virtualenvs.in-project true

./fish_prepare.sh

bash $HOME/.dotfiles/install.sh

# commands below needs source .bashrc
asdf install
./fisher_update.sh
