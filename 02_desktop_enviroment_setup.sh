UBUNTU_VER=$(lsb_release -sc)

# X Window environment
if [ "$UBUNTU_VER" = "focal" ]; then
    sudo apt -y install cinnamon-desktop-environment
else
    sudo add-apt-repository -y ppa:embrosyn/cinnamon
    sudo apt -y update
    sudo apt -y install cinnamon
fi
if [ "$UBUNTU_VER" = "bionic" ]; then
    sudo apt -y install fcitx-mozc
fi

# cinnamon settings
gsettings set org.cinnamon.desktop.default-applications.terminal exec "terminator"
gsettings set org.cinnamon.desktop.wm.preferences mouse-button-modifier "<Super>"
gsettings set org.cinnamon.desktop.wm.preferences mouse-button-zoom-modifier "<Super>"
