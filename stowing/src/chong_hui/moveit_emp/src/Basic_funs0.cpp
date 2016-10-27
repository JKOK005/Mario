#include <iostream>
#include <moveit/move_group_interface/move_group.h>

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
  double x = 2.0;
  double y = 0.0;
  double z = 1.0;
  ROS_INFO("Move to : x=%f, y=%f, z=%f",x,y,z);
  group.setPositionTarget(x,y,z);
  // plan the motion and then move the group to the sampled target 
  group.move();
  ros::waitForShutdown();
}
