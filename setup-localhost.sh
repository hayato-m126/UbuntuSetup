#!/bin/bash

if ! (command -v pip3 >/dev/null 2>&1); then
    sudo apt-get -y update
    sudo apt-get -y install python3-pip
fi

# Install ansible
ansible_version=$(pip3 list | grep -oP "^ansible\s+\K([0-9]+)" || true)
if [ "$ansible_version" != "5" ]; then
    sudo apt-get -y purge ansible
    pip3 install -U "ansible==5.*"
fi

ansible-playbook -i ansible/inventories/localhost.ini ansible/setup-ubuntu22.04.yml --ask-become-pass -e ansible_user=$USER
