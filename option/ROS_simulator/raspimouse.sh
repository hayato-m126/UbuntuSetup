set -e
ROS_WS=~/ros_ws/raspimouse

UBUNTU_VER=$(lsb_release -sc)
[ "$UBUNTU_VER" = "bionic" ] && ROS_VER=melodic
[ "$UBUNTU_VER" = "xenial" ] && ROS_VER=kinetic
[ "$UBUNTU_VER" = "trusty" ] && ROS_VER=indigo
if [ "$ROS_VER" = "" ]; then
    echo "This script does not support Ubuntu $UBUNTU_VER"
    exit
fi

sudo apt install -y mktemp
#make catkin_workspace
mkdir -p ${ROS_WS}/src
cd $ROS_WS
catkin_init_workspace src
echo "source ${ROS_WS}/devel/setup.bash" >> ~/.bashrc
catkin_make
source ~/.bashrc

source ${ROS_WS}/devel/setup.bash || { echo "catkin_ws is not working correctly"; exit 1; }

roscd && \
	[[ -z $(pwd | grep opt) ]] && cd ../src || { echo "catkin_ws is not working correctly"; exit 1; }
[ -e "raspimouse_ros" ] && { cd raspimouse_ros; git pull; } || git clone https://github.com/ryuichiueda/raspimouse_ros.git
roscd && cd .. && catkin_make

roscd && \
	[[ -z $(pwd | grep opt) ]] && cd ../src || { echo "catkin_ws is not working correctly"; exit 1; }
[ -e "raspimouse_ros_2" ] && { cd raspimouse_ros_2; git pull; } || git clone https://github.com/ryuichiueda/raspimouse_ros_2.git
roscd && cd .. && catkin_make

roscd && cd ../src
[ -e "raspimouse_sim" ] && { cd raspimouse_sim; git pull; git checkout ${ROS_VER}-devel; } ||  git clone -b ${ROS_VER}-devel https://github.com/rt-net/raspimouse_sim.git
roscd && cd .. && catkin_make

roscd && cd ..
rosdep install -r -y --ignore-src --from-paths src
roscd && cd .. && catkin_make


mkdir -p ~/.gazebo/models && cd ~/.gazebo/models
if [ ! -e "ground_plane" ]; then
	cd /tmp && \
	TMPDIR=$(mktemp -d tmp.XXXXXXXXXX) && \
	cd $TMPDIR && \
	wget -l1 -np -nc -r "http://models.gazebosim.org/sun" --accept=gz && \
	wget -l1 -np -nc -r "http://models.gazebosim.org/ground_plane" --accept=gz && \
	wget -l1 -np -nc -r "http://models.gazebosim.org/gas_station" --accept=gz && \
	cd "models.gazebosim.org" && \
	for i in *; do tar -zvxf "$i/model.tar.gz"; done && \
	cp -vfR * ~/.gazebo/models/
fi


