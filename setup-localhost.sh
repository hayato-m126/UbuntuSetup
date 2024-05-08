#!/bin/bash

if ! (command -v curl >/dev/null 2>&1); then
    sudo apt -y update
    sudo apt -y install curl
fi
if ! (command -v rye >/dev/null 2>&1); then
    # https://rye-up.com/guide/installation/#customized-installation
    curl -sSf https://rye-up.com/get | RYE_INSTALL_OPTION="--yes" bash
fi
source $HOME/.rye/env
if ! (command -v ansible-playbook >/dev/null 2>&1); then
    rye install ansible-core
    ansible-galaxy collection install community.general
fi
ansible-playbook ansible/ubuntu22.04.yml --ask-become-pass -e ansible_user=$USER

