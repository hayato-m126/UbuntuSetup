UBUNTU_VER=$(lsb_release -sc)

# python tool
python3 -m pip install --user pipx
python3 -m pipx ensurepath
pipx completions

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -

# make tool
sudo apt -y install cmake cmake-curses-gui

# diff tool
sudo apt -y install meld
