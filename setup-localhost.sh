#!/bin/bash

if ! (command -v curl >/dev/null 2>&1); then
    sudo apt -y update
    sudo apt -y install curl
fi
if ! (command -v rye >/dev/null 2>&1); then
    # https://rye-up.com/guide/installation/#customized-installation
    curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash
fi
source $HOME/.rye/env
if ! (command -v ansible-playbook >/dev/null 2>&1); then
    rye install ansible-core
    ansible-galaxy collection install community.general
fi

VERSION_ID=$(grep '^VERSION_ID=' /etc/os-release | cut -d'=' -f2 | tr -d '"')
UBUNTU_CODE=$(grep '^UBUNTU_CODENAME=' /etc/os-release | cut -d'=' -f2 | tr -d '"')
ENV_JSON=env.json
ansible-playbook ansible/ubuntu.yml --ask-become-pass -e ansible_user=$USER -e os_version=$VERSION_ID -e ubuntu_code=$UBUNTU_CODE -e @${ENV_JSON}
