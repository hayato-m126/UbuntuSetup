#!/bin/fish

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

asdf plugin add direnv
asdf plugin add fzf
asdf plugin add ghq
asdf plugin add golang
asdf plugin add nodejs
asdf plugin add python
asdf plugin add awscli
asdf plugin add kubectl
asdf plugin add yq
asdf plugin add asciidoctorj
asdf plugin add ripgrep
asdf plugin add aws-sam-cli
asdf install

pipx completions
poetry config virtualenvs.in-project true
