#include "ros/ros.h"
#include "std_msgs/String.h"
#include <iostream>
#include "moveit/move_group_interface/move_group.h"
//#include "/home/haibin/catkin_ws/src/moveit/move_group_interface/move_group.h"
#include "radoe_msgs/command_from_gui.h"
#include "radoe_msgs/feedback_from_robot.h"
#include "geometry_msgs/PoseArray.h"
#include <geometry_msgs/Twist.h>


int command = 0;
int mode=0;
int isplanned=0;
int isexecuted=0;
float vel_x=0;
float vel_y=0;
float vel_z=0;

ros::Publisher robot_feedback_pub;
ros::Publisher robot_trajectory_pub;
//ros::Publisher robot_currentpose_pub;
radoe_msgs::feedback_from_robot robot_feedback;
//std::vector<geometry_msgs::Pose> waypoints;
geometry_msgs::PoseArray waypoints;

void chatterCallback(const radoe_msgs::command_from_gui::ConstPtr& msg)
{
  command = msg->command;
  mode = msg->mode;

if(mode==2)
  ROS_INFO("moveMulPos: command received");
}

void TeleoperateCallback(const geometry_msgs::Twist::ConstPtr& msg)
{
  ROS_INFO("moveMulPos: Teleoperate command received");
  //mode=2;
  //command=1;
  //vel_x=msg->linear.x;
  //vel_y=msg->linear.y;
  //vel_z=msg->linear.z;
}


void waypointsCallback(const geometry_msgs::PoseArray::ConstPtr& msg)
{
  waypoints.poses= msg->poses;
if(mode==2)
  ROS_INFO("moveMulPos: waypoints received");
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "listener");

  ros::AsyncSpinner spinner(1);
  spinner.start();

  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("/radoe/command_from_gui", 1000, chatterCallback);

  ros::Subscriber sub1 = n.subscribe("/radoe/waypoints", 1000, waypointsCallback);

  ros::Subscriber sub2 = n.subscribe("/Nextage/cmd_vel", 1000, TeleoperateCallback);

  robot_feedback_pub=n.advertise<radoe_msgs::feedback_from_robot>("radoe/feedback_from_robot",10);

  robot_trajectory_pub=n.advertise<moveit_msgs::RobotTrajectory>("radoe/trajectory_from_robot",10);

  //robot_currentpose_pub=n.advertise<geometry_msgs::Pose>("radoe/currentpose_from_robot",10);

  // plan to a multi-position goal
  // this connecs to a running instance of the move_group node
  
  ROS_INFO("HELLO WORLD!");
  //move_group_interface::MoveGroup group("manipulator"); //for ABB robot
  //move_group_interface::MoveGroup group("right_arm"); //for Nextage-Open robot
  //move_group_interface::MoveGroup group("left_arm"); //for Nextage-Open robot
  //move_group_interface::MoveGroup group("dual_arm"); //for Nextage-Open robot
  move_group_interface::MoveGroup group("manipulator"); //for UR5 robot
  move_group_interface::MoveGroup::Plan plan;

  group.setStartStateToCurrentState();

  moveit_msgs::RobotTrajectory trajectory_msg;

  ROS_INFO("HERE~~dddd~");
  ros::Rate loop_rate(1);

  while(ros::ok())
  {

    if(mode==2)
    {
      if(command==1)
      {
        ROS_INFO("HERE~~~ddd");
        isplanned=0;
        isexecuted=0;
        robot_feedback.planned=isplanned;
        robot_feedback.executed=isexecuted;
        std::vector<geometry_msgs::Pose> waypoints1;
        geometry_msgs::Pose current_pose = group.getCurrentPose().pose;
        //robot_currentpose_pub.publish(current_pose);
        ROS_INFO("group.getCurrentPose().pose: %f %f %f", current_pose.position.x, current_pose.position.y, current_pose.position.z);
        //ROS_INFO("WAYPOINTS1: %f %f %f", waypoints.poses[1].position.x, waypoints.poses[1].position.y, waypoints.poses[1].position.z);
        //ROS_INFO("WAYPOINTS0: %f %f %f", waypoints.poses[0].position.x, waypoints.poses[0].position.y, waypoints.poses[0].position.z);

        geometry_msgs::Pose target_pose = current_pose;
        waypoints1.push_back(current_pose); // up and out
//        //ROS_INFO("It is OK now!");
//        target_pose.position.x=current_pose.position.x+vel_x;
//        target_pose.position.y=current_pose.position.y+vel_y;
//        target_pose.position.z=current_pose.position.z+vel_z;

        //target_pose.position.x= waypoints.poses[1].position.x+vel_x;
        //target_pose.position.y= waypoints.poses[1].position.y+vel_y;
        //target_pose.position.z= waypoints.poses[1].position.z+vel_z;
//        waypoints1.push_back(target_pose); // up and out
//        target_pose.position.x= waypoints.poses[2].position.x;
//        target_pose.position.y= waypoints.poses[2].position.y;
//        target_pose.position.z= waypoints.poses[2].position.z;
//        waypoints1.push_back(target_pose); // up and out

//        ROS_INFO("Current_pose: %f %f %f", current_pose.position.x,current_pose.position.y, current_pose.position.z);
//        ROS_INFO("Target_pose: %f %f %f", target_pose.position.x,target_pose.position.y, target_pose.position.z);

       int n = waypoints.poses.size();
       ROS_INFO("N== %i", n);
       for (int i=1;i<waypoints.poses.size();i++)
       {
           geometry_msgs::Pose pose;
           target_pose.position.x = waypoints.poses[i].position.x;
           target_pose.position.y = waypoints.poses[i].position.y;
           target_pose.position.z = waypoints.poses[i].position.z;
           waypoints1.push_back(target_pose);
       }


        group.setPlanningTime(10);
        ROS_INFO("HERE~~~");
        double fraction = group.computeCartesianPath(waypoints1,
                                               0.01,  // eef_step
                                               0.0,   // jump_threshold
                                               trajectory_msg);
        ROS_INFO("moveMulPos: fraction=%f",fraction);
        plan.trajectory_ = trajectory_msg;
        if (1-fraction<=0.0001)
        {
        ROS_INFO("HERE234~~~");
        command = 0;
        isplanned=1;
        robot_feedback.planned=isplanned;
        robot_feedback_pub.publish(robot_feedback);
        robot_trajectory_pub.publish(trajectory_msg);

        //ROS_INFO("moveMulPos: start");
        //group.execute(plan);
        //sleep(1.0);
        //group.setStartStateToCurrentState();

        }
	command=0;
       ROS_INFO("KKKKK");
       sleep(1);

      }
      else if(command==2)
      {
          ROS_INFO("rrrrr");
            sleep(1);
          //robot_trajectory_pub.publish(trajectory_msg);
     ROS_INFO("moveMulPos: start");
     group.execute(plan);
     sleep(5.0);
          isexecuted=1;
	  isplanned=0;
          robot_feedback.executed=isexecuted;
	  robot_feedback.planned=isplanned;
          robot_feedback_pub.publish(robot_feedback);
	  command=0;
	  
      }
    }
    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}



