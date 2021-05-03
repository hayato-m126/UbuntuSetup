UBUNTU_VER=$(lsb_release -sc)

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
mkdir -p ~/.config/fish/completions
ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

# for pyenv build
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl

# python tool
python3 -m pip install --user pipx
python3 -m pipx ensurepath
pipx completions

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -

# make tool
sudo apt -y install cmake cmake-curses-gui

# diff tool
sudo apt -y install meld
