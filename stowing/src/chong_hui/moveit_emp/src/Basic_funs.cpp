#include <iostream>
#include <moveit/move_group_interface/move_group.h>
#include "moveit_msgs/DisplayTrajectory.h"

ros::Publisher robot_position_pub;

int main(int argc, char **argv)
{
  ros::init(argc, argv, "move_group_interface_demo", ros::init_options::AnonymousName);
  ros::AsyncSpinner spinner(1);
  spinner.start();

  ros::NodeHandle n;

  robot_position_pub=n.advertise<moveit_msgs::DisplayTrajectory>("/move_group/display_planned_path", 1);
  moveit_msgs::DisplayTrajectory display_trajectory;

  std::vector<double> group_variable_values;

  group_variable_values[0] = 1.4973969856332083;
  group_variable_values[1] = 0.5251419660003912;
  group_variable_values[2] = -2.436299391042418;
  group_variable_values[3] = -0.3171458529830087;
  group_variable_values[4] = 0.8034620057937806;
  group_variable_values[5] = 0.7968052017300938;
  group_variable_values[6] = 0.06711826994154427;

  display_trajectory.trajectory_start.joint_state.position = group_variable_values;

  std::vector<std::string> joint_name;

  joint_name[0] = "Joint1";
  joint_name[1] = "Joint2";
  joint_name[2] = "Joint3";
  joint_name[3] = "Joint4";
  joint_name[4] = "Joint5";
  joint_name[5] = "Joint6";
  joint_name[6] = "Joint7";

  display_trajectory.trajectory_start.joint_state.name = joint_name;

  robot_position_pub.publish(display_trajectory);


//// this connecs to a running instance of the move_group node
//  move_group_interface::MoveGroup group("manipulator");

//  //moveit::planning_interface::MoveGroup::Plan plan;
//  move_group_interface::MoveGroup::Plan plan;

//  group.setStartStateToCurrentState();

//  std::vector<geometry_msgs::Pose> waypoints;

//  geometry_msgs::Pose target_pose = group.getCurrentPose().pose;
//  target_pose.position.x += 0.0;
//  target_pose.position.y -= 0.0;
//  target_pose.position.z += 0.2;
//  waypoints.push_back(target_pose); // up and out

//  //target_pose.position.y -= 0.2;
//  //waypoints.push_back(target_pose); // left

//  //target_pose.position.z -= 0.2;
//  //target_pose.position.y += 0.2;
//  //target_pose.position.x -= 0.2;
//  waypoints.push_back(target_pose); // down and right (back to start)

//  moveit_msgs::RobotTrajectory trajectory_msg;
//  group.setPlanningTime(10.0);
 
//  double fraction = group.computeCartesianPath(waypoints,
//                                               0.01,  // eef_step
//                                               0.0,   // jump_threshold
//                                               trajectory_msg);

//  plan.trajectory_ = trajectory_msg;

//  ROS_INFO("Visualizing plan 4 (cartesian path) (%.2f%% acheived)",fraction * 100.0);
//  sleep(5.0);
 
//  group.execute(plan);


  ros::waitForShutdown();
}
