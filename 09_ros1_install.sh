UBUNTU_VER=$(lsb_release -sc)
[ "$UBUNTU_VER" = "bionic" ] && ROS_VER=melodic
[ "$UBUNTU_VER" = "xenial" ] && ROS_VER=kinetic
if [ "$ROS_VER" = "" ]; then
    echo "This script does not support Ubuntu $UBUNTU_VER"
    exit
fi

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt -y update
sudo apt -y install ros-${ROS_VER}-desktop-full

sudo rosdep init
rosdep update
echo "source /opt/ros/$ROS_VER/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt -y install python-rosinstall python-rosinstall-generator python-wstool build-essential

#tool
sudo apt -y install ros-${ROS_VER}-rqt* #melodic package of rqt_ez_publihser was not found, 2019/2/11
sudo apt -y install ros-${ROS_VER}-rosdoc-lite
sudo apt -y install ros-${ROS_VER}-usb-cam
sudo apt -y install ros-${ROS_VER}-rosserial ros-${ROS_VER}-rosserial-arduino
sudo apt -y install ros-${ROS_VER}-joy
sudo apt -y install ros-${ROS_VER}-rosbridge-server
sudo apt -y install ros-${ROS_VER}-rosbridge-suite
sudo apt -y install ros-${ROS_VER}-smach-viewer

#joystic setting tool
sudo apt -y install jstest-gtk


