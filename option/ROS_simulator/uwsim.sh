set -e
ROS_WS=~/ros_ws/uwsim

UBUNTU_VER=$(lsb_release -sc)
[ "$UBUNTU_VER" = "bionic" ] && ROS_VER=melodic
[ "$UBUNTU_VER" = "xenial" ] && ROS_VER=kinetic
[ "$UBUNTU_VER" = "trusty" ] && ROS_VER=indigo
if [ "$ROS_VER" = "" ]; then
    echo "This script does not support Ubuntu $UBUNTU_VER"
    exit
fi

#uwsim
if [ "$UBUNTU_VER" = "trusty" ]; then
    sudo apt -y install ros-${ROS_VER}-uwsim
fi
if [ "$UBUNTU_VER" = "bionic" ] || [ "$UBUNTU_VER" = "xenial" ]; then #melodic package was not found 2018/8/1
    #make catkin_workspace
    mkdir -p ${ROS_WS}/src
    cd $ROS_WS
    catkin_init_workspace src
    echo "source ${ROS_WS}/devel/setup.bash" >> ~/.bashrc
    catkin_make
    source ~/.bashrc

    echo "- other: {local-name: /opt/ros/$ROS_VER/share/ros}" > ${ROS_WS}/.rosinstall
    echo "- other: {local-name: /opt/ros/$ROS_VER/share}" >> ${ROS_WS}/.rosinstall
    echo "- setup-file: {local-name: /opt/ros/$ROS_VER/setup.sh}" >> ${ROS_WS}/.rosinstall
    echo "- git: {local-name: src/underwater_simulation, uri: 'https://github.com/uji-ros-pkg/underwater_simulation.git', version: $ROS_VER-devel}" >> ${ROS_WS}/.rosinstall
    cd ${ROS_WS}
    rosws update
    rosdep install --from-paths src --ignore-src --rosdistro $ROS_VER -y
    catkin_make install -j4 -l4
    cd -
fi
