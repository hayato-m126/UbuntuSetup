UBUNTU_VER=$(lsb_release -sc)
[ "$UBUNTU_VER" = "bionic" ] && ROS_VER=melodic
[ "$UBUNTU_VER" = "xenial" ] && ROS_VER=kinetic
[ "$UBUNTU_VER" = "focal" ] && ROS_VER=noetic
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
if [ "$UBUNTU_VER" = "focal" ]; then
    sudo apt -y install python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
else
    sudo apt -y install python-rosinstall python-rosinstall-generator python-wstool build-essential
fi

#tool
sudo apt -y install ros-${ROS_VER}-rqt*
sudo apt -y install ros-${ROS_VER}-rosdoc-lite
sudo apt -y install ros-${ROS_VER}-usb-cam
sudo apt -y install ros-${ROS_VER}-rosserial ros-${ROS_VER}-rosserial-arduino
sudo apt -y install ros-${ROS_VER}-joy
sudo apt -y install ros-${ROS_VER}-rosbridge-server
sudo apt -y install ros-${ROS_VER}-rosbridge-suite
sudo apt -y install ros-${ROS_VER}-smach-viewer
sudo apt -y install ros-${ROS_VER}-jsk-visualization
sudo apt install -y python3-vcstool

#joystic setting tool
sudo apt -y install jstest-gtk


