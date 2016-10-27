#ifndef RADOE_PLUGIN_H
#define RADOE_PLUGIN_H

#include <QWidget>
#include <rviz/panel.h>
#include <ros/ros.h>
#include "std_msgs/String.h"
#include <moveit/move_group_interface/move_group.h>
//#include "radoe_msgs/point2point.h"
#include "radoe_msgs/command_from_gui.h"
#include "radoe_msgs/JointPosArray.h"
#include "radoe_msgs/feedback_from_robot.h"
#include "visualization_msgs/InteractiveMarkerFeedback.h"
#include "geometry_msgs/PoseArray.h"
#include "geometry_msgs/Pose.h"
#include <QStringListModel>

namespace Ui {
class RADOE_plugin;
}
namespace radoe_plugin_panel
{
class RADOE_plugin : public QWidget
{
    Q_OBJECT

public:
    explicit RADOE_plugin(QWidget *parent = 0);
    ~RADOE_plugin();

    ros::NodeHandle nh2;
    ros::Publisher waypoints_pub;
    ros::Publisher waypoints_joint_pub;
    ros::Publisher command_pub;
    ros::Subscriber robot_feedback_sub;
    ros::Subscriber robot_current_pose_sub;
    ros::Subscriber robot_joint_states_sub;
    ros::Subscriber InteractiveMarkerFeedback_sub;
    ros::Subscriber trajectory_from_robot_sub;
    std_msgs::String msg2;
    move_group_interface::MoveGroup::Plan plan;
    //radoe_msgs::point2point way_points;
    radoe_msgs::command_from_gui command;
    radoe_msgs::feedback_from_robot robot_feedback;

    //std::vector<geometry_msgs::Pose> waypoints;
    geometry_msgs::PoseArray waypoints;
    geometry_msgs::Pose target_pose;

    radoe_msgs::JointPosArray waypoints_joint;
    radoe_msgs::JointPos target_pose_joint;

    moveit_msgs::RobotTrajectory planned_trajectory;

    void robot_feedbackCallback(const radoe_msgs::feedback_from_robot::ConstPtr& msg);
    void InteractiveMarkerFeedbackCallback(const visualization_msgs::InteractiveMarkerFeedback::ConstPtr& msg);
    void robottrajectoryCallback(const moveit_msgs::RobotTrajectory::ConstPtr& msg);
    void robot_currentPoseCallback(const geometry_msgs::Pose::ConstPtr& msg);
    void robot_joint_statesCallback(const sensor_msgs::JointState::ConstPtr& msg);


    void save_trajectory();

    int ready_to_execute;
    int finish_execution;
    int executing;
    int synchronized_p2p;
    int synchronized_joint;
    float home_joint[6];
    geometry_msgs::Pose robot_current_pose;
    sensor_msgs::JointState robot_joint_states;

    QStringListModel* loggingModel() { return &logging_model; }
    QStringListModel* loggingModel_joint() { return &logging_model_joint; }
    //std::stringstream logging_model_msg;

    int way_points_no;
    int way_points_no_joint;


public Q_SLOTS:
    void on_save_button_clicked();


    void on_plan_button_clicked();

    void on_exe_button_clicked();


    //void on_connect_button_clicked();

    void update_button_status();


    void on_add_point_button_clicked();

    void on_clearpoints_button_clicked();
    void update_listView();
    void update_listView_joint();
    void updateLoggingView();

    void on_waypoint_x_valueChanged(double arg1);
    void on_waypoint_y_valueChanged(double arg1);
    void on_waypoint_z_valueChanged(double arg1);
    void on_add_point_joint_button_clicked();
    void on_clearpoints_joint_button_clicked();
Q_SIGNALS:
    void loggingUpdated();  
    void loggingUpdated_joint();


private:
    Ui::RADOE_plugin *ui;
    QStringListModel logging_model;
    QStringListModel logging_model_joint;
};
}
#endif // RADOE_PLUGIN_H
