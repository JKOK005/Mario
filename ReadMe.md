# Mario ROS version 1.0.0

This repository contains the programme manager node and core libraries that support the workings of Mario, an autonomous UR5 system for warehouse picking of goods. 

Mario has been tested on Ubuntu 14.0.4 

## Dependencies
### Core dependencies
1. ROS indigo: [link](http://wiki.ros.org/ROS/Installation) 
2. ROS UR_kinematics package: [link](http://wiki.ros.org/ur_kinematics)
3. OpenRave: [link](http://openrave.org/docs/0.8.2/install/)
4. TrajOpt: [link](http://rll.berkeley.edu/trajopt/doc/sphinx_build/html/)
5. rospy 

### Optional
1. ROS Gazebo
2. ROS SMACH (For task execution)
3. ROS serial Arduino: [link](http://wiki.ros.org/rosserial_arduino/Tutorials/Arduino%20IDE%20Setup)

## Installation instructions
1. Install all prior dependencies as mentioned above
2. git clone this repository

## Architecture
Mario's programme manager script can be found in the `stowing_driver` package in the source directory. 

Key scripts to take note of are:
1. ur5_lib.py - Contains the programme manager class *MarioFullSystem* 
2. or_motion_planning.py - Contains the interface to the motion planner
3. mario_utility.py - Utilities library for Mario
4. apc_global_params.py - Script containing hard coded parameters (for the bin picking setup)

The following image shows the UML diagram for Mario and exposes key interfaces which the user can use:

![Mario UML](/relative/images/mario_class.png)
