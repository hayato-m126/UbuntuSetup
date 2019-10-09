sudo locale-gen ja_JP ja_JP.UTF-8
sudo update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

sudo apt -y update
sudo apt -y install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
sudo apt -y update
sudo apt -y install ros-dashing-desktop
sudo apt -y install python3-colcon-common-extensions python3-rosdep python3-argcomplete

sudo rosdep init
rosdep update

echo "source /opt/ros/dashing/setup.bash" >> ~/.bashrc
source ~/.bashrc
