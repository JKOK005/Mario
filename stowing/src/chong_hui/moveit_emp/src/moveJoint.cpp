#include "ros/ros.h"
#include "std_msgs/String.h"
#include <iostream>
#include <moveit/move_group_interface/move_group.h>
#include "radoe_msgs/command_from_gui.h"
#include "radoe_msgs/JointPosArray.h"
#include "radoe_msgs/feedback_from_robot.h"
#include "radoe_msgs/jointvalue_from_robot.h"
#include "geometry_msgs/PoseArray.h"

int command = 0;
int mode=0;
int isplanned=0;
int isexecuted=0;
ros::Publisher robot_feedback_pub;
ros::Publisher robot_currentjoint_pub;
radoe_msgs::feedback_from_robot robot_feedback;
std::vector<radoe_msgs::JointPos> waypoints_joint;

//std::vector<double> group_variable_values;
bool success = false;

void chatterCallback(const radoe_msgs::command_from_gui::ConstPtr& msg)
{
  command = msg->command;
  mode=msg->mode;
  ROS_INFO("moveJoint: command received");
}

void waypoints_jointCallback(const radoe_msgs::JointPosArray::ConstPtr& msg)
{
    waypoints_joint=msg->jointPos;



    //ROS_INFO("no of points=%f",waypoints_joint.at(1).jointposition.joint1);
    ROS_INFO("moveJoint: joint waypoints received");
}
/*
void jointstateCallback(const sensor_msgs::JointState::ConstPtr& msg)
{
  //group_variable_values = msg->position;
  //ROS_INFO("I heard2");
}
*/

int main(int argc, char **argv)
{
  ros::init(argc, argv, "listener");

  // start a ROS spinning thread
  ros::AsyncSpinner spinner(1);
  spinner.start();

  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("/radoe/command_from_gui", 1000, chatterCallback);
  ros::Subscriber waypoints_joint_sub = n.subscribe("/radoe/waypoints_joint", 100, waypoints_jointCallback);

  //ros::Subscriber sub1 = n.subscribe("/joint_states", 1000, jointstateCallback);

  robot_feedback_pub=n.advertise<radoe_msgs::feedback_from_robot>("radoe/feedback_from_robot",10);

  robot_currentjoint_pub=n.advertise<radoe_msgs::jointvalue_from_robot>("radoe/currentjoint_from_robot",10);

  // plan to a multi-position goal
  // this connects to a running instance of the move_group node
  //move_group_interface::MoveGroup group("manipulator"); //for ABB robot
  //move_group_interface::MoveGroup group("right_arm"); //for Nextage-Open robot
  //move_group_interface::MoveGroup group("left_arm"); //for Nextage-Open robot
  //move_group_interface::MoveGroup group("dual_arm"); //for Nextage-Open robot
  move_group_interface::MoveGroup group("manipulator"); //for UR10 robot
  move_group_interface::MoveGroup::Plan plan;

  ros::Rate loop_rate(1);

  while(ros::ok())
  {
   ROS_INFO("MoveJoint Node Start!");
    if(mode==1)
    {     
      if(command==1)
      {
          ROS_INFO("HERE~~xee~");
          isplanned=0;
          isexecuted=0;
          robot_feedback.planned=isplanned;
          robot_feedback.executed=isexecuted;
          // First get the current set of joint values for the group.
          radoe_msgs::jointvalue_from_robot value;

          std::vector<double> group_variable_values;
          group.getCurrentState()->copyJointGroupPositions(group.getCurrentState()->getRobotModel()->getJointModelGroup(group.getName()), group_variable_values);


          ROS_INFO("moveJoint: Variables articulares %f %f %f %f %f %f",group_variable_values[0],group_variable_values[1],group_variable_values[2],group_variable_values[3],group_variable_values[4],group_variable_values[5]);
          value.jointvalue = group_variable_values;
          robot_currentjoint_pub.publish(value);

          // modify one of the joints, plan to the new joint space goal
          group_variable_values[0] = waypoints_joint.back().jointposition.joint1;
          group_variable_values[1] = waypoints_joint.back().jointposition.joint2;
          group_variable_values[2] = waypoints_joint.back().jointposition.joint3;
          group_variable_values[3] = waypoints_joint.back().jointposition.joint4;
          group_variable_values[4] = waypoints_joint.back().jointposition.joint5;
          group_variable_values[5] = waypoints_joint.back().jointposition.joint6;
          //group_variable_values[6] += 0.5;
          group.setJointValueTarget(group_variable_values);

          success = group.plan(plan);
          ROS_INFO("moveJoint: SUCCESS %s",success?"":"moveJoint: FAILED");

          if (success)
            {
                ROS_INFO("moveJoint: planned");
                command = 0;
                isplanned=1;
                robot_feedback.planned=isplanned;
                robot_feedback_pub.publish(robot_feedback);
            }
          command=0;
          /* Sleep to give Rviz time to visualize the plan. */
          sleep(1.0);
          //group.execute(plan);
      }
      else if(command==2)
      {
          ROS_INFO("moveJoint: execute");
          group.execute(plan);
	  sleep(1.0);
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

