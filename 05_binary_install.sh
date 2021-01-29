# keeweb
wget https://github.com/keeweb/keeweb/releases/download/v1.16.7/KeeWeb-1.16.7.linux.x64.deb
sudo dpkg -i KeeWeb-*.linux.x64.deb
rm -rf KeeWeb-*.linux.x64.deb

# activitywatch
wget https://github.com/ActivityWatch/activitywatch/releases/download/v0.8.0b9/activitywatch-v0.8.0b9-linux-x86_64.zip
unzip activitywatch-*.zip
sudo mv activitywatch /opt/
rm -rf activitywatch-v0.8.0b9-linux-x86_64.zip

# autostart activitywatch
echo "[Desktop Entry]" | tee -a ~/.config/autostart/activitywatch.desktop
echo "Type=Application" | tee -a ~/.config/autostart/activitywatch.desktop
echo "Exec=/opt/activitywatch/aw-qt" | tee -a ~/.config/autostart/activitywatch.desktop
echo "X-GNOME-Autostart-enabled=true" | tee -a ~/.config/autostart/activitywatch.desktop
echo "NoDisplay=false" | tee -a ~/.config/autostart/activitywatch.desktop
echo "Hidden=false" | tee -a ~/.config/autostart/activitywatch.desktop
echo "Name[ja_JP]=activitywatch" | tee -a ~/.config/autostart/activitywatch.desktop
echo "Comment[ja_JP]=No description" | tee -a ~/.config/autostart/activitywatch.desktop
echo "X-GNOME-Autostart-Delay=10" | tee -a ~/.config/autostart/activitywatch.desktop

# thunderbird
wget https://ftp.mozilla.org/pub/thunderbird/releases/78.4.3/linux-x86_64/ja/thunderbird-78.4.3.tar.bz2
tar -jxvf thunderbird*.tar.bz2
sudo mv thunderbird /opt/
rm -rf thunderbird*.tar.bz2
# desktop entry
echo "[Desktop Entry]" | tee -a ~/.local/share/applications/thunderbird.desktop
echo "Encoding=UTF-8" | tee -a ~/.local/share/applications/thunderbird.desktop
echo "Name=Thunderbird" | tee -a ~/.local/share/applications/thunderbird.desktop
echo "GenericName=Mail/News Client" | tee -a ~/.local/share/applications/thunderbird.desktop
echo "Comment=Mail/News Client" | tee -a ~/.local/share/applications/thunderbird.desktop
echo "Exec=/opt/thunderbird/thunderbird" | tee -a ~/.local/share/applications/thunderbird.desktop
echo "Icon=/opt/thunderbird/chrome/icons/default/default32.png" | tee -a ~/.local/share/applications/thunderbird.desktop
echo "Terminal=false" | tee -a ~/.local/share/applications/thunderbird.desktop
echo "Type=Application" | tee -a ~/.local/share/applications/thunderbird.desktop
echo "StartupNotify=true" | tee -a ~/.local/share/applications/thunderbird.desktop
echo "MimeType=x-scheme-handler/mailto;" | tee -a ~/.local/share/applications/thunderbird.desktop

# slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.11.1-amd64.deb
sudo apt install ./slack-desktop-*.deb
rm -rf slack-desktop-*.deb

# peazip
wget https://ymu.dl.osdn.jp/peazip/73744/peazip_7.4.2.LINUX.x86_64.GTK2.deb
sudo dpkg -i peazip_*.LINUX.x86_64.GTK2.deb
rm -rf peazip_*.LINUX.x86_64.GTK2.deb
