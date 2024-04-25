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
fi
# dockerの場合とか考えると、パスワード聞かれるの都合悪い。TODO
ansible-playbook -i ansible/inventories/localhost.ini ansible/setup-ubuntu22.04.yml --ask-become-pass -e ansible_user=$USER
