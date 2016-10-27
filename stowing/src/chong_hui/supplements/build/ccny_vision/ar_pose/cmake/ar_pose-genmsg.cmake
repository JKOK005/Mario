# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ar_pose: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iar_pose:/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/ar_pose/msg;-Igeometry_msgs:/opt/ros/hydro/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/hydro/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ar_pose_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ar_pose
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/ar_pose/msg/ARMarker.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ar_pose
)
_generate_msg_cpp(ar_pose
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/ar_pose/msg/ARMarkers.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/ar_pose/msg/ARMarker.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ar_pose
)

### Generating Services

### Generating Module File
_generate_module_cpp(ar_pose
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ar_pose
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ar_pose_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ar_pose_generate_messages ar_pose_generate_messages_cpp)

# target for backward compatibility
add_custom_target(ar_pose_gencpp)
add_dependencies(ar_pose_gencpp ar_pose_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ar_pose_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ar_pose
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/ar_pose/msg/ARMarker.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ar_pose
)
_generate_msg_lisp(ar_pose
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/ar_pose/msg/ARMarkers.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/ar_pose/msg/ARMarker.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ar_pose
)

### Generating Services

### Generating Module File
_generate_module_lisp(ar_pose
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ar_pose
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ar_pose_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ar_pose_generate_messages ar_pose_generate_messages_lisp)

# target for backward compatibility
add_custom_target(ar_pose_genlisp)
add_dependencies(ar_pose_genlisp ar_pose_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ar_pose_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ar_pose
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/ar_pose/msg/ARMarker.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose
)
_generate_msg_py(ar_pose
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/ar_pose/msg/ARMarkers.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/ar_pose/msg/ARMarker.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose
)

### Generating Services

### Generating Module File
_generate_module_py(ar_pose
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ar_pose_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ar_pose_generate_messages ar_pose_generate_messages_py)

# target for backward compatibility
add_custom_target(ar_pose_genpy)
add_dependencies(ar_pose_genpy ar_pose_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ar_pose_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ar_pose)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ar_pose
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(ar_pose_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ar_pose)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ar_pose
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(ar_pose_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(ar_pose_generate_messages_py geometry_msgs_generate_messages_py)
