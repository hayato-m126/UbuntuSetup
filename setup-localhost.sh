#!/bin/bash

if !(command -v ansible-playbook  > /dev/null 2>&1); then
    sudo apt -y update
    sudo apt -y upgrade
    sudo apt install -y ansible
fi

ansible-playbook -i ansible/inventories/localhost.ini ansible/setup-ubuntu22.04.yml --ask-become-pass -e ansible_user=$USER
