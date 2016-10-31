/* Software License Agreement (BSD License)
 *
 * Copyright (c) 2011, Willow Garage, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of Willow Garage, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * Auto-generated by genmsg_cpp from file /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOState.msg
 *
 */


#ifndef UR_MSGS_MESSAGE_IOSTATE_H
#define UR_MSGS_MESSAGE_IOSTATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ur_msgs
{
template <class ContainerAllocator>
struct IOState_
{
  typedef IOState_<ContainerAllocator> Type;

  IOState_()
    : pin(0)
    , state(0.0)  {
    }
  IOState_(const ContainerAllocator& _alloc)
    : pin(0)
    , state(0.0)  {
    }



   typedef uint8_t _pin_type;
  _pin_type pin;

   typedef float _state_type;
  _state_type state;




  typedef boost::shared_ptr< ::ur_msgs::IOState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ur_msgs::IOState_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct IOState_

typedef ::ur_msgs::IOState_<std::allocator<void> > IOState;

typedef boost::shared_ptr< ::ur_msgs::IOState > IOStatePtr;
typedef boost::shared_ptr< ::ur_msgs::IOState const> IOStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ur_msgs::IOState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ur_msgs::IOState_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace ur_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'ur_msgs': ['/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::ur_msgs::IOState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ur_msgs::IOState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ur_msgs::IOState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ur_msgs::IOState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ur_msgs::IOState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ur_msgs::IOState_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ur_msgs::IOState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "341541c8828d055b6dcc443d40207a7d";
  }

  static const char* value(const ::ur_msgs::IOState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x341541c8828d055bULL;
  static const uint64_t static_value2 = 0x6dcc443d40207a7dULL;
};

template<class ContainerAllocator>
struct DataType< ::ur_msgs::IOState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ur_msgs/IOState";
  }

  static const char* value(const ::ur_msgs::IOState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ur_msgs::IOState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 pin\n\
float32 state\n\
";
  }

  static const char* value(const ::ur_msgs::IOState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ur_msgs::IOState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pin);
      stream.next(m.state);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct IOState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ur_msgs::IOState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ur_msgs::IOState_<ContainerAllocator>& v)
  {
    s << indent << "pin: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.pin);
    s << indent << "state: ";
    Printer<float>::stream(s, indent + "  ", v.state);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UR_MSGS_MESSAGE_IOSTATE_H