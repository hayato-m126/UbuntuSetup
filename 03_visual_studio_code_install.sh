# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt -y install apt-transport-https
sudo apt -y update
sudo apt -y install code # or code-insiders

# install vscode extensions
code --install-extension EditorConfig.editorconfig
code --install-extension donjayamanne.githistory
code --install-extension ms-ceintl.vscode-language-pack-ja
code --install-extension ajshort.msg
code --install-extension ms-python.python
code --install-extension ms-iot.vscode-ros
code --install-extension smilerobotics.urdf
code --install-extension vscode-icons-team.vscode-icons
