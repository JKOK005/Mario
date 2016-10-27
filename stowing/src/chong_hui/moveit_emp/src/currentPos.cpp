#include "ros/ros.h"
#include "std_msgs/String.h"
#include <iostream>
#include "moveit/move_group_interface/move_group.h"
#include "geometry_msgs/PoseArray.h"

ros::Publisher robot_currentpose_pub;

int main(int argc, char **argv)
{
  ros::init(argc, argv, "current_position_publisher");

  ros::AsyncSpinner spinner(1);
  spinner.start();

  ros::NodeHandle n;

  robot_currentpose_pub=n.advertise<geometry_msgs::Pose>("radoe/currentPos_from_robot",10);
  ROS_INFO("Robot_current_pose feedback start!");

  move_group_interface::MoveGroup group("manipulator"); //for UR5 robot
  group.setStartStateToCurrentState();

  ros::Rate loop_rate(10);

  while(ros::ok())
  {
    geometry_msgs::Pose current_pose = group.getCurrentPose().pose; 
    current_pose.position.z=current_pose.position.z;
    robot_currentpose_pub.publish(current_pose);
    //ROS_INFO("Robot_Current_Pose: %f %f %f", current_pose.position.x, current_pose.position.y, current_pose.position.z);
    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}



