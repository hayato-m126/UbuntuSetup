#!/bin/zsh

if ! (command -v brew >/dev/null 2>&1); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if ! (command -v uv >/dev/null 2>&1); then
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.cargo/bin:$PATH"
fi
if ! (command -v ansible-playbook >/dev/null 2>&1); then
    uv tool install ansible-core
    ansible-galaxy collection install community.general
fi

ENV_JSON=env.json
ansible-playbook ansible/ubuntu.yml --ask-become-pass -e @${ENV_JSON}
