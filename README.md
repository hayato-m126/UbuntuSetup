# Ubuntu setup

setup Ubuntu 22.04 development environment

## requirements

Ubuntu 22.04 LTS 64bit日本語Remix

https://www.ubuntulinux.jp/download/ja-remix

## how to run

```shell
./setup-localhost.sh
```

## after setup

```shell
bash $HOME/.dotfiles/install.sh
cp github_rsa $HOME/.ssh/
mise install -y
```

## TODO

- [ ] wslのブラウザ
- [ ] ubuntu 24.04に対応させる
