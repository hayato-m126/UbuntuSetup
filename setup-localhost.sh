#!/bin/bash

sudo apt -y update
sudo apt -y upgrade

if !(command -v ansible-playbook  > /dev/null 2>&1); then
    sudo apt install -y ansible
fi

ansible-playbook -i localhost -c local ansible/setup-ubuntu20.04.yml --ask-become-pass -e ansible_user=$USER
