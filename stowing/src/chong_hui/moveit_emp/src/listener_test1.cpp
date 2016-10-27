#include "ros/ros.h"
#include "std_msgs/String.h"
#include <iostream>
#include <moveit/move_group_interface/move_group.h>
#include "radoe_msgs/command_from_gui.h"
#include "radoe_msgs/feedback_from_robot.h"
/**
 * This tutorial demonstrates simple receipt of messages over the ROS system.
 */
int command = 0;
int isplanned=0;
ros::Publisher robot_feedback_pub;
radoe_msgs::feedback_from_robot robot_feedback;

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

  ROS_INFO("fraction=%f",fraction);
  plan.trajectory_ = trajectory_msg;
  isplanned=1;
  robot_feedback.planned=isplanned;
  robot_feedback_pub.publish(robot_feedback);

  sleep(0.1);

  group.execute(plan);
}

void chatterCallback(const radoe_msgs::command_from_gui::ConstPtr& msg)
{
  command = msg->command;
  ROS_INFO("I heard");
  if (command == 1)
    {
      moveMultipositions();
    }
}
int main(int argc, char **argv)
{
  /**
   * The ros::init() function needs to see argc and argv so that it can perform
   * any ROS arguments and name remapping that were provided at the command line. For programmatic
   * remappings you can use a different version of init() which takes remappings
   * directly, but for most command-line programs, passing argc and argv is the easiest
   * way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any other
   * part of the ROS system.
   */
  ros::init(argc, argv, "listener");

  /**
   * NodeHandle is the main access point to communications with the ROS system.
   * The first NodeHandle constructed will fully initialize this node, and the last
   * NodeHandle destructed will close down the node.
   */
  ros::NodeHandle n;

  /**
   * The subscribe() call is how you tell ROS that you want to receive messages
   * on a given topic.  This invokes a call to the ROS
   * master node, which keeps a registry of who is publishing and who
   * is subscribing.  Messages are passed to a callback function, here
   * called chatterCallback.  subscribe() returns a Subscriber object that you
   * must hold on to until you want to unsubscribe.  When all copies of the Subscriber
   * object go out of scope, this callback will automatically be unsubscribed from
   * this topic.
   *
   * The second parameter to the subscribe() function is the size of the message
   * queue.  If messages are arriving faster than they are being processed, this
   * is the number of messages that will be buffered up before beginning to throw
   * away the oldest ones.
   */
  ros::Subscriber sub = n.subscribe("/radoe/command_from_gui", 1000, chatterCallback);

  robot_feedback_pub=n.advertise<radoe_msgs::feedback_from_robot>("radoe/feedback_from_robot",10);

  /**
   * ros::spin() will enter a loop, pumping callbacks.  With this version, all
   * callbacks will be called from within this thread (the main one).  ros::spin()
   * will exit when Ctrl-C is pressed, or the node is shutdown by the master.
   */
  ros::spin();

  return 0;
}
