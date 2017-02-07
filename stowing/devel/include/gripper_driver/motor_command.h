// Generated by gencpp from file gripper_driver/motor_command.msg
// DO NOT EDIT!


#ifndef GRIPPER_DRIVER_MESSAGE_MOTOR_COMMAND_H
#define GRIPPER_DRIVER_MESSAGE_MOTOR_COMMAND_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace gripper_driver
{
template <class ContainerAllocator>
struct motor_command_
{
  typedef motor_command_<ContainerAllocator> Type;

  motor_command_()
    : read_angle(false)
    , read_load(false)
    , gripper_ready(false)
    , gripper_open(false)
    , gripper_close(false)
    , gripper_standby(false)  {
    }
  motor_command_(const ContainerAllocator& _alloc)
    : read_angle(false)
    , read_load(false)
    , gripper_ready(false)
    , gripper_open(false)
    , gripper_close(false)
    , gripper_standby(false)  {
  (void)_alloc;
    }



   typedef uint8_t _read_angle_type;
  _read_angle_type read_angle;

   typedef uint8_t _read_load_type;
  _read_load_type read_load;

   typedef uint8_t _gripper_ready_type;
  _gripper_ready_type gripper_ready;

   typedef uint8_t _gripper_open_type;
  _gripper_open_type gripper_open;

   typedef uint8_t _gripper_close_type;
  _gripper_close_type gripper_close;

   typedef uint8_t _gripper_standby_type;
  _gripper_standby_type gripper_standby;




  typedef boost::shared_ptr< ::gripper_driver::motor_command_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::gripper_driver::motor_command_<ContainerAllocator> const> ConstPtr;

}; // struct motor_command_

typedef ::gripper_driver::motor_command_<std::allocator<void> > motor_command;

typedef boost::shared_ptr< ::gripper_driver::motor_command > motor_commandPtr;
typedef boost::shared_ptr< ::gripper_driver::motor_command const> motor_commandConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::gripper_driver::motor_command_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::gripper_driver::motor_command_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace gripper_driver

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'gripper_driver': ['/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::gripper_driver::motor_command_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gripper_driver::motor_command_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gripper_driver::motor_command_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gripper_driver::motor_command_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gripper_driver::motor_command_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gripper_driver::motor_command_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::gripper_driver::motor_command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8abb8dc4e270785b228e26d3dff0970e";
  }

  static const char* value(const ::gripper_driver::motor_command_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8abb8dc4e270785bULL;
  static const uint64_t static_value2 = 0x228e26d3dff0970eULL;
};

template<class ContainerAllocator>
struct DataType< ::gripper_driver::motor_command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "gripper_driver/motor_command";
  }

  static const char* value(const ::gripper_driver::motor_command_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::gripper_driver::motor_command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool read_angle\n\
bool read_load\n\
bool gripper_ready\n\
bool gripper_open\n\
bool gripper_close\n\
bool gripper_standby\n\
";
  }

  static const char* value(const ::gripper_driver::motor_command_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::gripper_driver::motor_command_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.read_angle);
      stream.next(m.read_load);
      stream.next(m.gripper_ready);
      stream.next(m.gripper_open);
      stream.next(m.gripper_close);
      stream.next(m.gripper_standby);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct motor_command_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::gripper_driver::motor_command_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::gripper_driver::motor_command_<ContainerAllocator>& v)
  {
    s << indent << "read_angle: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.read_angle);
    s << indent << "read_load: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.read_load);
    s << indent << "gripper_ready: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.gripper_ready);
    s << indent << "gripper_open: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.gripper_open);
    s << indent << "gripper_close: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.gripper_close);
    s << indent << "gripper_standby: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.gripper_standby);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GRIPPER_DRIVER_MESSAGE_MOTOR_COMMAND_H
