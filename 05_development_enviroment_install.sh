# serialport terminal
sudo apt -y install cutecom
sudo apt -y install gtkterm

# text editor
sudo apt -y install emacs

# document tool
sudo apt -y install doxygen doxygen-gui graphviz

# make tool
sudo apt -y install cmake cmake-curses-gui

# ssh client
sudo apt -y install putty

# arduino
wget http://downloads.arduino.cc/arduino-1.8.9-linux64.tar.xz
tar xvf arduino-1.8.9-linux64.tar.xz
sudo mv arduino-1.8.9 /opt
cd /opt/arduino-1.8.9
./install.sh

# electrical circuit editor
sudo apt -y install xcircuit
echo '[Desktop Entry]'$'\n''Version=1.0'$'\n''Type=Application'$'\n''Name=XCircuit'$'\n''Name[ja]=XCircuit'$'\n''Comment=Electrical circuit editor'$'\n''Comment[ja]=電子回路図作成'$'\n''Exec=/usr/bin/xcircuit'$'\n''Icon=/usr/share/xcircuit/pixmaps/xcircuit.ico'$'\n''Terminal=false'$'\n''Categories=Development;Graphics;'$'\n''StartupNotify=true'$'\n' | sudo tee /usr/share/applications/xcircuit.desktop
