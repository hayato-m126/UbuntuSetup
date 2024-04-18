#!/bin/bash

if ! (command -v curl >/dev/null 2>&1); then
    sudo apt install curl
fi
if ! (command -v rye >/dev/null 2>&1); then
    # https://rye-up.com/guide/installation/#customized-installation
    curl -sSf https://rye-up.com/get | RYE_INSTALL_OPTION="--yes" bash
fi
if ! (command -v ansible-playbook >/dev/null 2>&1); then
    source $HOME/.rye/env
    rye install ansible
    export PATH=$HOME/.rye/tools/ansible/bin:$PATH
fi
ansible-playbook -i ansible/inventories/localhost.ini ansible/setup-ubuntu22.04.yml --ask-become-pass -e ansible_user=$USER -t dotfiles
