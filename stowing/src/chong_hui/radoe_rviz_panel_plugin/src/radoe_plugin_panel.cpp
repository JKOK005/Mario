#include "../include/radoe_rviz_panel_plugin/radoe_plugin_panel.hpp"
#include "../include/radoe_rviz_panel_plugin/radoe_plugin.hpp"
#include "ui_radoe_plugin_panel.h"
#include <QMessageBox>
#include <QTimer>
#include <iostream>
#include <moveit/move_group_interface/move_group.h>
#include <QtGui>

#define PI 3.14159265354

namespace radoe_plugin_panel
{

RADOE_plugin::RADOE_plugin(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::RADOE_plugin)
{
    ui->setupUi(this);
    QTimer* status_update_timer = new QTimer( this );
    connect( status_update_timer, SIGNAL( timeout() ), this, SLOT( update_button_status() ));
    status_update_timer->start( 1000 );

    //init

    ready_to_execute = 0;
    finish_execution=0;
    executing = 0;
    way_points_no=0;
    way_points_no_joint=0;
    synchronized_p2p=0;
    synchronized_joint=0;

    command_pub = nh2.advertise<radoe_msgs::command_from_gui>("/radoe/command_from_gui",10);
    waypoints_pub=nh2.advertise<geometry_msgs::PoseArray>("/radoe/waypoints",10);
    waypoints_joint_pub=nh2.advertise<radoe_msgs::JointPosArray>("/radoe/waypoints_joint",10);
    robot_feedback_sub = nh2.subscribe("/radoe/feedback_from_robot",10,&RADOE_plugin::robot_feedbackCallback,this);
    robot_current_pose_sub=nh2.subscribe("/radoe/currentPos_from_robot",10,&RADOE_plugin::robot_currentPoseCallback,this);
    //robot_joint_states_sub=nh2.subscribe("/joint_states",10,&RADOE_plugin::robot_joint_statesCallback,this);
    InteractiveMarkerFeedback_sub = nh2.subscribe("/rviz_moveit_motion_planning_display/robot_interaction_interactive_marker_topic/feedback",10,&RADOE_plugin::InteractiveMarkerFeedbackCallback,this);
    trajectory_from_robot_sub = nh2.subscribe("/radoe/trajectory_from_robot",10,&RADOE_plugin::robottrajectoryCallback,this);

    QObject::connect(this, SIGNAL(loggingUpdated()), this, SLOT(updateLoggingView()));
    QObject::connect(this, SIGNAL(loggingUpdated_joint()), this, SLOT(updateLoggingView()));

    ui->listView->setModel(loggingModel());
    ui->listView_joint->setModel(loggingModel_joint());

    ui->plan_button->setEnabled(false);
}

void RADOE_plugin::robottrajectoryCallback(const moveit_msgs::RobotTrajectory::ConstPtr& msg)
{
    planned_trajectory = *msg;

}
void RADOE_plugin::robot_joint_statesCallback(const sensor_msgs::JointState::ConstPtr& msg)
{
    robot_joint_states = *msg;
    for(int i=3;i<9;i++)
        home_joint[i-3]=robot_joint_states.position.at(i);
    //ROS_INFO("callback: H1=%f",home_joint[0]);

    if(!synchronized_joint)
    {
        on_add_point_joint_button_clicked();
        synchronized_joint=1;
    }
}

void RADOE_plugin::robot_feedbackCallback(const radoe_msgs::feedback_from_robot::ConstPtr& msg)
{

    ready_to_execute = msg->planned;
    finish_execution = msg->executed;
    ROS_INFO("received feedback,ready_to_execute=%d,finish_execution=%d",ready_to_execute,finish_execution);
    if(finish_execution)
    {
        //ROS_INFO("way_points_no=%d",way_points_no);
        executing = 0;
        while(way_points_no>0)
        {
            on_clearpoints_button_clicked();
            //ROS_INFO("way_points_no=%d",way_points_no);
        }
        on_add_point_button_clicked();

        while(way_points_no_joint>0)
        {
            on_clearpoints_joint_button_clicked();
            //ROS_INFO("way_points_no=%d",way_points_no);
        }
        on_add_point_joint_button_clicked();
    }
}

void RADOE_plugin::robot_currentPoseCallback(const geometry_msgs::Pose::ConstPtr& msg)
{
    robot_current_pose = *msg;

    if(executing)
    {
        ui->waypoint_x->setValue(msg->position.x);
        ui->waypoint_y->setValue(msg->position.y);
        ui->waypoint_z->setValue(msg->position.z);
        //ROS_INFO("%f,%f,%f",msg->position.x,msg->position.y,msg->position.z);
    }
    else if(!synchronized_p2p)
    {
        ui->waypoint_x->setValue(msg->position.x);
        ui->waypoint_y->setValue(msg->position.y);
        ui->waypoint_z->setValue(msg->position.z);
        //ROS_INFO("%f,%f,%f",msg->position.x,msg->position.y,msg->position.z);

        ui->waypoint_x->setValue(target_pose.position.x);
        ui->waypoint_y->setValue(target_pose.position.y);
        ui->waypoint_z->setValue(target_pose.position.z);
        on_add_point_button_clicked();

        synchronized_p2p=1;
    }
}

void RADOE_plugin::InteractiveMarkerFeedbackCallback(const visualization_msgs::InteractiveMarkerFeedback::ConstPtr& msg)
{
    //ROS_INFO("mouse captured");
    target_pose.position.x=msg->pose.position.x;
    target_pose.position.y=msg->pose.position.y;
    target_pose.position.z=msg->pose.position.z;



    ui->waypoint_x->setValue(target_pose.position.x);
    ui->waypoint_y->setValue(target_pose.position.y);
    ui->waypoint_z->setValue(target_pose.position.z);


}

RADOE_plugin::~RADOE_plugin()
{
    delete ui;
}
void RADOE_plugin::on_save_button_clicked()
{
    save_trajectory();
    ROS_INFO("joint trajectory exported");
    QMessageBox msgBox;
    msgBox.setText("Joint trajectory exported, RAPID code generated");
    msgBox.exec();
}

void RADOE_plugin::save_trajectory()
{
    int i,j;
    QFile outputFile("../RADOE/Source_code/src/radoe_rviz_panel_plugin/export/rapid_code.mod");
    //QFile outputFile("../Dropbox/RAPIDCODE/pMain.mod");
    if(!outputFile.open(QIODevice::ReadWrite | QIODevice::Text | QIODevice::Truncate))
    {
        QMessageBox msgBox;
        msgBox.setText("Couldn't find the parameter file to write, will create a new one");
        msgBox.exec();
        //return;
    }
    QTextStream out(&outputFile);



    out<<"MODULE pMain\n\n";

    for(i=0;i<planned_trajectory.joint_trajectory.points.size();i++)
    {
        out<<"\tLOCAL CONST jointtarget p"<<i<<" :=[ [";
        for(j=0;j<6;j++)
        {

            out<<planned_trajectory.joint_trajectory.points[i].positions[j]*180/PI;
            if(j==5)
                out<<"]";
            else
                out<<",";
        }
        out<<", [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];\n";

    }

    out<<"\tPERS tooldata tt;\n";
    out<<"\nPROC Path()\n";
    out<<"\n\tVAR speeddata v;\n\tVAR zonedata z;\n";
    out<<"\n\tv:=v100;\n\tz:=z50;\n\ttt:=tool0;\n\n";


    for(i=0;i<planned_trajectory.joint_trajectory.points.size();i++)
    {

        out<<"\tMoveAbsJ p"<<i<<" , v, z, tt;\n";

    }
    out<<"ENDPROC\n";
    out<<"PROC main()\n"<<"\tPath;\n"<<"ENDPROC\n\nENDMODULE";


//    out<<geometry_msgs::Pose( waypoints.poses[0]).position.x<<"\t";
//    out<<geometry_msgs::Pose( waypoints.poses[0]).position.y<<"\t";
//    out<<geometry_msgs::Pose( waypoints.poses[0]).position.z<<"\n";


    outputFile.close();
}

void RADOE_plugin::on_plan_button_clicked()
{
    if(ui->joint_control->isChecked())
    {
        if(way_points_no_joint<2)
        {
            QMessageBox msg;
            msg.setText("Not enough points has been added for joint control");
            msg.exec();
        }
        else
        {
            command.mode=1;
            ROS_INFO("joint control mode");
        }
    }
    else if(ui->point2point->isChecked())
    {
        if(way_points_no<2)
        {
            QMessageBox msg;
            msg.setText("Not enough points has been added for point to point control");
            msg.exec();
        }
        else
        {
            command.mode=2;
            ROS_INFO("point to point control mode");
        }
    }

    command.command=1;//do planning
//    command.planned=0;


    if(ros::ok)
    {
        command_pub.publish(command);

        if(command.mode==1)
            waypoints_joint_pub.publish(waypoints_joint);
        else if(command.mode==2)
            waypoints_pub.publish(waypoints);

        if(command.mode==1)
            ROS_INFO("command=plan, mode=joint control");
        else if(command.mode==2)
            ROS_INFO("command=plan, mode=point to point control control");
    }
    else
        ROS_INFO("ros not ok");
}
void RADOE_plugin::on_exe_button_clicked()
{
    command.command=2;//do executing

    if(ros::ok)
    {
        command_pub.publish(command);
        ROS_INFO("executing");
    }
    executing=1;

    ui->exe_button->setEnabled(false);
    ui->save_button->setEnabled(false);
}
//void RADOE_plugin::on_connect_button_clicked()
//{
//    //read feedback from robot
//    //ROS_INFO("test4");

//}

void RADOE_plugin::update_button_status()
{

    if(way_points_no<2 && way_points_no_joint<2)
        ui->plan_button->setEnabled(false);

    if(ready_to_execute)
    {
        //QMessageBox::about(this, tr("Message"),tr("<h2>Trajectory has been planned successfully.</p>"));
        ROS_INFO("Trajectory has been planned successfully");
        //ui->exe_button->setEnabled(true);
        ui->exe_button->setEnabled(true);
    }
    ready_to_execute=0;

    if(finish_execution)
    {
        QMessageBox::about(this, tr("Message"),tr("<h2>Execution finshed.</p>"));
        ui->save_button->setEnabled(false);
        //ui->exe_button->setEnabled(true);
        ui->exe_button->setEnabled(false);
    }
    finish_execution=0;
}

void RADOE_plugin::on_add_point_button_clicked()
{
    waypoints.poses.push_back(target_pose);
    //waypoints.push_back(target_pose);
    way_points_no++;

    if(way_points_no>=2)
        ui->plan_button->setEnabled(true);
    update_listView();
    ROS_INFO("rviz: add a point, number of way points=%d",way_points_no);

}

void RADOE_plugin::update_listView()
{
    std::stringstream logging_model_msg;

    logging_model.insertRows(logging_model.rowCount(),1);

    if(logging_model.rowCount()==1)
    {
        logging_model_msg<<"x\ty\tz\n";
        //logging_model.insertRows(logging_model.rowCount(),1);
    }


    logging_model_msg<<target_pose.position.x<<"\t"<<target_pose.position.y<<"\t"<<target_pose.position.z;


    QVariant new_row(QString(logging_model_msg.str().c_str()));
    logging_model.setData(logging_model.index(logging_model.rowCount()-1),new_row);
    Q_EMIT loggingUpdated();
    //updateLoggingView();

}

void RADOE_plugin::on_clearpoints_button_clicked()
{
    if(way_points_no>0)
    {
        logging_model.removeRows(logging_model.rowCount()-1,1);
        waypoints.poses.erase(waypoints.poses.end());
        //waypoints.erase(waypoints.end());
        way_points_no--;
        ROS_INFO("a point is cleared");
    }


}

void RADOE_plugin::updateLoggingView()
{
    ui->listView->scrollToBottom();
    ui->listView_joint->scrollToBottom();
}



void RADOE_plugin::on_add_point_joint_button_clicked()
{
    ROS_INFO("rviz: add a point in joint space, number of way points in joint space=%d",way_points_no_joint);


    if(way_points_no_joint==0)
    {
        target_pose_joint.jointposition.joint1=home_joint[0];
        target_pose_joint.jointposition.joint2=home_joint[1];
        target_pose_joint.jointposition.joint3=home_joint[2];
        target_pose_joint.jointposition.joint4=home_joint[3];
        target_pose_joint.jointposition.joint5=home_joint[4];
        target_pose_joint.jointposition.joint6=home_joint[5];
        //ROS_INFO("add_point: H1=%f",home_joint[0]);
    }
    else
    {
        target_pose_joint.jointposition.joint1=ui->waypoint_J1->value()+home_joint[0];
        target_pose_joint.jointposition.joint2=ui->waypoint_J2->value()+home_joint[1];
        target_pose_joint.jointposition.joint3=ui->waypoint_J3->value()+home_joint[2];
        target_pose_joint.jointposition.joint4=ui->waypoint_J4->value()+home_joint[3];
        target_pose_joint.jointposition.joint5=ui->waypoint_J5->value()+home_joint[4];
        target_pose_joint.jointposition.joint6=ui->waypoint_J6->value()+home_joint[5];
    }


    waypoints_joint.jointPos.push_back(target_pose_joint);
    //waypoints.push_back(target_pose);
    way_points_no_joint++;

    if(way_points_no_joint>=2)
        ui->plan_button->setEnabled(true);

    update_listView_joint();
}

void RADOE_plugin::on_clearpoints_joint_button_clicked()
{
    if(way_points_no_joint>0)
    {
        logging_model_joint.removeRows(logging_model_joint.rowCount()-1,1);
        way_points_no_joint--;
        waypoints_joint.jointPos.erase(waypoints_joint.jointPos.end());
    }

}
void RADOE_plugin::update_listView_joint()
{
    std::stringstream logging_model_msg_joint;

    logging_model_joint.insertRows(logging_model_joint.rowCount(),1);

    if(logging_model_joint.rowCount()==1)
        logging_model_msg_joint<<"J1\tJ2\tJ3\tJ4\tJ5\tJ6\n";

    logging_model_msg_joint<<target_pose_joint.jointposition.joint1<<"\t"<<target_pose_joint.jointposition.joint2<<"\t"<<target_pose_joint.jointposition.joint3<<"\t";
    logging_model_msg_joint<<target_pose_joint.jointposition.joint4<<"\t"<<target_pose_joint.jointposition.joint5<<"\t"<<target_pose_joint.jointposition.joint6;

    QVariant new_row(QString(logging_model_msg_joint.str().c_str()));
    logging_model_joint.setData(logging_model_joint.index(logging_model_joint.rowCount()-1),new_row);
    Q_EMIT loggingUpdated_joint();


}

void RADOE_plugin::on_waypoint_x_valueChanged(double arg1)
{
    target_pose.position.x=arg1;
}
void RADOE_plugin::on_waypoint_y_valueChanged(double arg1)
{
    target_pose.position.y=arg1;
}
void RADOE_plugin::on_waypoint_z_valueChanged(double arg1)
{
    target_pose.position.z=arg1;
}
}

