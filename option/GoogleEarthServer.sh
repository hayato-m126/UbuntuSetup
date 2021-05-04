#install git-lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get -y install git-lfs
git lfs install
#use ssh RSA key
ssh-add ~/.ssh/github_rsa

#install packages
sudo apt-get install gcc g++ scons automake autoconf libperl4-corelibs-perl libtool xorg-dev doxygen python-dev alien swig libgtest-dev libstdc++6 libxml2-dev gettext libxinerama-dev libxft-dev libxrandr-dev libxcursor-dev libgdbm-dev libc6 libc6-dev libmng-dev zlib1g-dev libcap-dev libpng12-0 libpng12-dev freeglut3-dev flex libx11-dev bison++ bisonc++ libjpeg-dev libjpeg8-dev python2.7 python2.7-dev libogdi3.2-dev libgif-dev libxerces-c-dev libgeos-dev libgeos++-dev libfreetype6 libfreetype6-dev python-imaging libproj-dev python-setuptools libgif-dev libxerces-c-dev libcap-dev libpq-dev openssl libxml2-utils libxmu-dev

#clone GEE source code
cd
GIT_LFS_SKIP_SMUDGE=1 git clone git@github.com:google/earthenterprise.git
cd earthenterprise
git lfs pull

#build source
cd earthenterprise/earth_enterprise/src
scons -j8 release=1 third_party
scons -j8 release=1

#install prepare
scons -j2 installdir=/tmp/fusion_os_install release=1 install
cd ..
scons -j2 installdir=/tmp/fusion_os_install install

#tutorial file
cd ~/earthenterprise/earth_enterprise/tutorial 
mkdir FusionTutorial
wget http://data.opengee.org/FusionTutorial-Full.tar.gz
tar -xvzf FusionTutorial-Full.tar.gz -C FusionTutorial
scons installdir=/tmp/fusion_os_install

#install
cd ~/earthenterprise/earth_enterprise/src/installer
sudo ./install_fusion.sh -nop
sudo ./install_server.sh

#create shortcut
sudo ln -s /opt/google/bin/fusion /usr/bin
cd ~/デスクトップ
ln -s /opt/google/bin/fusion ./



