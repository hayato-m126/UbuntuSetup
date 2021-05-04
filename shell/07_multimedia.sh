# screen shot tool
if [ $(lsb_release -sc) = "focal" ]; then
    sudo add-apt-repository ppa:linuxuprising/shutter
fi
sudo apt -y install shutter

#screen capture, video
sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
sudo apt -y update
sudo apt -y install simplescreenrecorder

# vlc
sudo apt -y install vlc

# paint tool
sudo apt -y install kolourpaint4

#gif capture tool
sudo apt -y install ffmpeg
sudo add-apt-repository -y ppa:peek-developers/stable
sudo apt -y update
sudo apt -y install peek

snap install irfanview
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# link fonts
cd ~/.local/share/fonts
for file in `find . -type f` ; do
  relative_path=`echo $file | sed s@\.\/@@`
  ln -snfv `realpath $file` ~/snap/irfanview/common/.wine/drive_c/windows/Fonts
done
