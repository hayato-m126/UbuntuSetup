set -e
ROS_WS=~/ros_ws/uuvsimulator

UBUNTU_VER=$(lsb_release -sc)
[ "$UBUNTU_VER" = "xenial" ] && ROS_VER=kinetic
[ "$UBUNTU_VER" = "trusty" ] && ROS_VER=indigo
if [ "$ROS_VER" = "" ]; then
    echo "This script does not support Ubuntu $UBUNTU_VER"
    exit
fi

#make catkin_workspace
mkdir -p ${ROS_WS}/src
cd $ROS_WS
catkin_init_workspace src
wstool init src
echo "source ${ROS_WS}/devel/setup.bash" >> ~/.bashrc
catkin_make

echo "source /usr/share/gazebo-7/setup.sh" >> ~/.bashrc
echo "export GAZEBO_PREFIX=${ROS_WS}/install" >> ~/.bashrc
echo 'export GAZEBO_RESOURCE_PATH=${GAZEBO_PREFIX}/share/gazebo-7.0:${GAZEBO_RESOURCE_PATH}' >> ~/.bashrc
echo 'export GAZEBO_MODEL_PATH=${GAZEBO_PREFIX}/share/gazebo-7.0/models:${GAZEBO_MODEL_PATH}' >> ~/.bashrc
echo 'export GAZEBO_PLUGIN_PATH=${GAZEBO_PREFIX}/lib:${GAZEBO_PREFIX}/lib/x86_64-linux-gnu:${GAZEBO_PLUGIN_PATH}' >> ~/.bashrc
source ~/.bashrc

if [ "$UBUNTU_VER" = "trusty" ]; then
    sudo apt-get install gazebo7 libgazebo7-dev protobuf-compiler protobuf-c-compiler ros-indigo-gazebo7-msgs ros-indigo-gazebo7-plugins ros-indigo-gazebo7-ros ros-indigo-gazebo7-ros-control ros-indigo-gazebo7-ros-pkgs ros-indigo-effort-controllers ros-indigo-image-pipeline ros-indigo-image-common ros-indigo-perception ros-indigo-perception-pcl ros-indigo-robot-state-publisher ros-indigo-ros-base ros-indigo-viz python-wstool python-catkin-tools python-catkin-lint ros-indigo-hector-localization ros-indigo-joy ros-indigo-joy-teleop libopencv-dev
    cd $ROS_WS/src
    git clone https://github.com/ros-controls/control_msgs.git
    cd control_msgs
    git checkout c0b322b
    cd ..

    git clone https://github.com/ros-controls/control_toolbox.git
    cd control_toolbox
    git checkout 5ccdc6d
    cd ..

    git clone https://github.com/ros-simulation/gazebo_ros_pkgs.git
    cd gazebo_ros_pkgs
    git checkout 231b76d
    cd ..

    git clone https://github.com/ros-controls/realtime_tools.git
    cd realtime_tools
    git checkout bf55298
    cd ..

    git clone https://github.com/ros-controls/ros_controllers.git
    cd ros_controllers
    git checkout b4dc152
    cd ..
fi
if [ "$UBUNTU_VER" = "xenial" ]; then
    sudo apt-get install ros-kinetic-gazebo-msgs ros-kinetic-gazebo-plugins ros-kinetic-gazebo-ros ros-kinetic-gazebo-ros-control ros-kinetic-gazebo-ros-pkgs ros-kinetic-effort-controllers ros-kinetic-image-pipeline ros-kinetic-image-common ros-kinetic-perception ros-kinetic-perception-pcl ros-kinetic-robot-state-publisher ros-kinetic-ros-base ros-kinetic-viz python-wstool python-catkin-tools python-catkin-lint ros-kinetic-hector-localization ros-kinetic-joy ros-kinetic-joy-teleop libopencv-dev protobuf-compiler protobuf-c-compiler
fi

cd $ROS_WS/src
git clone https://github.com/uuvsimulator/uuv_simulator.git
cd $ROS_WS
catkin_make install -j4 -l4

