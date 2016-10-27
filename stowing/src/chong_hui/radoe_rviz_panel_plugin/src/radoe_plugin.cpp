#include "../include/radoe_rviz_panel_plugin/radoe_plugin.hpp"
#include "../include/radoe_rviz_panel_plugin/radoe_plugin_panel.hpp"
#include <QLineEdit>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QLabel>
#include <QPushButton>

#include "QtSql/qsqlquery.h"

#include <QTimer>

namespace radoe_plugin_panel
{
radoe_plugin_panel::radoe_plugin_panel(QWidget* parent)
  : rviz::Panel(parent)
{
    QHBoxLayout* topic_layout = new QHBoxLayout;
    QVBoxLayout* layout = new QVBoxLayout;
    layout->addLayout( topic_layout );

    widget_ = new RADOE_plugin;
    layout->addWidget( widget_ );



    setLayout( layout );


//    chatter_pub = nh_.advertise<std_msgs::String>("chatter", 1000);

//   if(ros::ok())
    {
//        count=0;

//        std::stringstream ss;
//        ss << "hello world"<<count ;
//        msg.data = ss.str();




    }
    QTimer* output_timer = new QTimer( this );
    connect( output_timer, SIGNAL( timeout() ), this, SLOT( ROS_Publish_Topics() ));
    output_timer->start( 1000 );


}

void radoe_plugin_panel::save()
{
}
void radoe_plugin_panel::load()
{
}

void radoe_plugin_panel::ROS_Publish_Topics()
{
    if(ros::ok)
    {
        count++;
        //ROS_INFO("count=%d",count);
        //chatter_pub.publish(msg);
    }
}


}

#include <pluginlib/class_list_macros.h>
PLUGINLIB_EXPORT_CLASS(radoe_plugin_panel::radoe_plugin_panel,rviz::Panel )
