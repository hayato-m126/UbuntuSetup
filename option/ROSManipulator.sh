# refer https://gbiggs.github.io/ros_moveit_rsj_tutorial/index.html

cd ~/Downloads
git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
git clone https://github.com/gbiggs/dynamixel_servo_check.git

cd ~/catkin_ws/src
git clone https://github.com/gbiggs/rsj_tutorial_2017_ros_intro.git

mkdir -p ~/crane_plus_ws/src/
cd ~/crane_plus_ws/src
git clone https://github.com/gbiggs/crane_plus_arm.git
git clone https://github.com/gbiggs/rsj_2017_pick_and_placer

mkdir -p ~/rsj_2017_application_ws/src
cd ~/rsj_2017_application_ws/src
git clone https://github.com/gbiggs/rsj_2017_pick_and_placer.git
git clone https://github.com/Suzuki1984/rsj_2017_block_finder
git clone https://github.com/gbiggs/crane_plus_arm.git

