#include "ros/ros.h"
#include "std_msgs/String.h"
#include <iostream>
#include <moveit/move_group_interface/move_group.h>

double Arr[6];

void moveJoint(double Arr[])
{
  // plan to a joint-space goal
  // this connecs to a running instance of the move_group node
  move_group_interface::MoveGroup group("manipulator");
  // First get the current set of joint values for the group.
  std::vector<double> group_variable_values;
  group.getCurrentState()->copyJointGroupPositions(group.getCurrentState()->getRobotModel()->getJointModelGroup(group.getName()), group_variable_values);
  // modify one of the joints, plan to the new joint space goal
  group_variable_values[0] = Arr[0];
  group_variable_values[1] = Arr[1]; 
  group_variable_values[2] = Arr[2];
  group_variable_values[3] = Arr[3];
  group_variable_values[4] = Arr[4];
  group_variable_values[5] = Arr[5];
  group.setJointValueTarget(group_variable_values);
  // plan the motion and then move the group to the sampled target 
  group.move();
}

void moveSingleposition()
{
  // plan to a single-position goal
  // this connecs to a running instance of the move_group node
  move_group_interface::MoveGroup group("manipulator");
  double x = 1.1;
  double y = 1.0;
  double z = 1.1;
  ROS_INFO("Move to : x=%f, y=%f, z=%f",x,y,z);
  group.setPositionTarget(x,y,z);
  // plan the motion and then move the group to the sampled target 
  group.move();
}

void moveMultipositions()
{
  // plan to a multi-position goal
  // this connecs to a running instance of the move_group node
  move_group_interface::MoveGroup group("manipulator");
  move_group_interface::MoveGroup::Plan plan; 

  group.setStartStateToCurrentState();

  std::vector<geometry_msgs::Pose> waypoints;

  geometry_msgs::Pose target_pose = group.getCurrentPose().pose;
  target_pose.position.x += 0.2;
  target_pose.position.y += 0.1;
  target_pose.position.z += 0.2;
  waypoints.push_back(target_pose); // up and out

  target_pose.position.y -= 0.2;
  waypoints.push_back(target_pose); // left

  target_pose.position.z -= 0.2;
  target_pose.position.y += 0.2;
  target_pose.position.x -= 0.2;
  waypoints.push_back(target_pose); // down and right (back to start)

  moveit_msgs::RobotTrajectory trajectory_msg;
  group.setPlanningTime(10.0);
 
  double fraction = group.computeCartesianPath(waypoints,
                                               0.01,  // eef_step
                                               0.0,   // jump_threshold
                                               trajectory_msg);

  plan.trajectory_ = trajectory_msg;
  
  sleep(5.0);
 
  group.execute(plan); 
}

void arrayCallback(const std_msgs::Int32MultiArray::ConstPtr& array)
{
 
int i = 0;
// print all the remaining numbers
for(std::vector<int>::const_iterator it = array->data.begin(); it != array->data.end(); ++it)
{
Arr[i] = *it;
i++;
}
 
return;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "move_group_interface_demo",     ros::init_options::AnonymousName);
  // ROS subsriber
  ros::NodeHandle n;	
  ros::Subscriber sub = n.subscribe("array", 100, arrayCallback);
  // start a ROS spinning thread
  ros::AsyncSpinner spinner(1);
  spinner.start();
  // Choose basic robot functions
  int command = 1;

  if (command == 1)
  {
    moveJoint(Arr);
  }
  if (command == 2)
  {
    moveSingleposition();
  }
  else if (command == 3)
  {
    moveMultipositions();
  }
  ros::waitForShutdown();
}

