#!/bin/bash

if !(command -v ansible-playbook  > /dev/null 2>&1); then
    sudo apt install -y ansible
fi

ansible-playbook -i localhost, -c local local-ubuntu20.04.yml --ask-become-pass
