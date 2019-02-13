# manipulator tools
sudo apt -y install ros-${ROS_VER}-moveit-*
sudo apt -y install ros-${ROS_VER}-dynamixel-motor #melodic package was not found 2019/2/11
sudo apt -y install ros-${ROS_VER}-ros-control
sudo apt -y install ros-${ROS_VER}-gazebo-ros-control
sudo apt -y install ros-${ROS_VER}-joint-state-controller
sudo apt -y install ros-${ROS_VER}-joint-trajectory-controller
sudo apt -y install ros-${ROS_VER}-effort-controllers
sudo apt -y install ros-${ROS_VER}-octomap*
sudo apt -y install ros-${ROS_VER}-object-recognition-*

#vision tool
sudo apt -y install python-opencv
sudo apt -y install libopencv-dev
sudo apt -y install ros-${ROS_VER}-vision-opencv
sudo apt -y install ros-${ROS_VER}-cv-camera #melodic package was not found 2019/2/11
sudo apt -y install ros-${ROS_VER}-camera-calibration
sudo apt -y install ros-${ROS_VER}-opencv-apps
sudo apt -y install ros-${ROS_VER}-ar-track-alvar* imagemagick

#simulator
sudo apt -y install ros-${ROS_VER}-kobuki-gazebo #melodic package was not found 2019/2/11
sudo apt -y install ros-${ROS_VER}-pr2-simulator #melodic package was not found 2019/2/11
sudo apt -y install ros-${ROS_VER}-turtlebot-gazebo #melodic package was not found 2019/2/11
sudo apt -y install ros-${ROS_VER}-turtlebot-simulator #melodic package was not found 2019/2/11
sudo apt -y install ros-${ROS_VER}-turtlebot-teleop #melodic package was not found 2019/2/11
echo "export TURTLEBOT_STAGE_WORLD_FILE='/opt/ros/${ROS_VER}/share/turtlebot_stage/maps/stage/maze.world'" >> ~/.bashrc
echo "export TURTLEBOT_STAGE_MAP_FILE='/opt/ros/${ROS_VER}/share/turtlebot_stage/maps/maze.yaml'" >> ~/.bashrc
