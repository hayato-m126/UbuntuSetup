#!/bin/bash

if [ -f "$HOME/.ssh/github_rsa" ]; then
    bash $HOME/.dotfiles/install.sh
    mise install -y
else
    echo "$HOME/.ssh/github_rsa not found"
fi

read -p "Do you want install python cli tools using rye? (y/n): " answer

if [ "$answer" == "y" ]; then
    uv tool install pre-commit
    uv tool install argcomplete
    uv tool install vcstool
    vu tool install ruff
else
    echo "cancel"
fi

