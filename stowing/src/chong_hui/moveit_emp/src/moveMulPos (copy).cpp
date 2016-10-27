#include "ros/ros.h"
#include "std_msgs/String.h"
#include <iostream>
//#include "moveit/move_group_interface/move_group.h"
#include "/home/haibin/catkin_ws/src/moveit/move_group_interface/move_group.h"
#include "radoe_msgs/command_from_gui.h"
#include "radoe_msgs/feedback_from_robot.h"
#include "geometry_msgs/PoseArray.h"

int command = 0;
int isplanned=0;
ros::Publisher robot_feedback_pub;
ros::Publisher robot_trajectory_pub;
radoe_msgs::feedback_from_robot robot_feedback;
std::vector<geometry_msgs::Pose> waypoints;

void chatterCallback(const radoe_msgs::command_from_gui::ConstPtr& msg)
{
  command = msg->command;
  ROS_INFO("I heard");
}

void waypointsCallback(const geometry_msgs::PoseArray::ConstPtr& msg)
{
  waypoints = msg->poses;
  ROS_INFO("I heard2");
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "listener");

  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("/radoe/command_from_gui", 1000, chatterCallback);

  ros::Subscriber sub1 = n.subscribe("/radoe/waypoints", 1000, waypointsCallback);

  robot_feedback_pub=n.advertise<radoe_msgs::feedback_from_robot>("radoe/feedback_from_robot",10);

  robot_trajectory_pub=n.advertise<moveit_msgs::RobotTrajectory>("radoe/trajectory_from_robot",10);

  // plan to a multi-position goal
  // this connecs to a running instance of the move_group node
  move_group_interface::MoveGroup group("manipulator");
  move_group_interface::MoveGroup::Plan plan;

  group.setStartStateToCurrentState();

  moveit_msgs::RobotTrajectory trajectory_msg;

  ros::Rate loop_rate(1);

  while(ros::ok())
  {
    if(command==1||command==2)
    {
      if(command==1)
      {
//       std::vector<geometry_msgs::Pose> waypoints;
//        geometry_msgs::Pose target_pose = group.getCurrentPose().pose;
//        target_pose.position.x += 0.2;
//        target_pose.position.y += 0.1;
//        target_pose.position.z += 0.2;
//        waypoints.push_back(target_pose); // up and out

//        target_pose.position.y -= 0.2;
//        waypoints.push_back(target_pose); // left

//        target_pose.position.z -= 0.2;
//        target_pose.position.y += 0.2;
//        target_pose.position.x -= 0.2;
//        waypoints.push_back(target_pose); // down and right (back to start)

        group.setPlanningTime(10);

        double fraction = group.computeCartesianPath(waypoints,
                                               0.01,  // eef_step
                                               0.0,   // jump_threshold
                                               trajectory_msg);
        ROS_INFO("fraction=%f",fraction);
        plan.trajectory_ = trajectory_msg;
        if (1-fraction<=0.0001)
        {
        command = 0;
        isplanned=1;
        robot_feedback.planned=isplanned;
        robot_feedback_pub.publish(robot_feedback);
        }
	command=0;

       sleep(1);

      }
      else if(command==2)
      {
          robot_trajectory_pub.publish(trajectory_msg);
          ROS_INFO("start");
          //group.execute(plan);
	  command=0;
      }
    }
    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}



