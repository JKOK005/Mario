#include <moveit/move_group_interface/move_group.h>
#include <iostream>
int main(int argc, char **argv)
{
  ros::init(argc, argv, "move_group_interface_demo", ros::init_options::AnonymousName);
  // start a ROS spinning thread
  ros::AsyncSpinner spinner(1);
  spinner.start();
  // this connecs to a running instance of the move_group node
  move_group_interface::MoveGroup group("manipulator");
//
  //// specify that our target will be a random one
  //group.setRandomTarget();
//
  // plan to a joint-space goal
  // First get the current set of joint values for the group.
  std::vector<double> group_variable_values;
  group.getCurrentState()->copyJointGroupPositions(group.getCurrentState()->getRobotModel()->getJointModelGroup(group.getName()), group_variable_values);
  // modify one of the joints, plan to the new joint space goal
  group_variable_values[1] += 0.5;
  group.setJointValueTarget(group_variable_values);
  // plan the motion and then move the group to the sampled target 
  //group.move();
  // plan the motion and then move the group to the sampled target
  bool success = group.move();
  ROS_INFO("SUCCESS %s",success?"":"FAILED");
  ros::waitForShutdown();
}
