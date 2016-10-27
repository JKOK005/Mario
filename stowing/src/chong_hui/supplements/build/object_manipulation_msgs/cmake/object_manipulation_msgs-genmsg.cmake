# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "object_manipulation_msgs: 8 messages, 0 services")

set(MSG_I_FLAGS "-Iobject_manipulation_msgs:/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg;-Iobject_manipulation_msgs:/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg;-Iactionlib_msgs:/opt/ros/hydro/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/hydro/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/hydro/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/hydro/share/sensor_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/hydro/share/trajectory_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/hydro/share/sensor_msgs/cmake/../msg;-Ihousehold_objects_database_msgs:/opt/ros/hydro/share/household_objects_database_msgs/cmake/../msg;-Ishape_msgs:/opt/ros/hydro/share/shape_msgs/cmake/../msg;-Imanipulation_msgs:/opt/ros/hydro/share/manipulation_msgs/cmake/../msg;-Iobject_recognition_msgs:/opt/ros/hydro/share/object_recognition_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(object_manipulation_msgs_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionFeedback.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_cpp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_cpp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_cpp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_cpp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_cpp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/Grasp.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/GripperTranslation.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_cpp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionActionGoal.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/Grasp.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/JointState.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionActionFeedback.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/GripperTranslation.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionFeedback.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionActionResult.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionResult.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_cpp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionResult.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_manipulation_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(object_manipulation_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_manipulation_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(object_manipulation_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(object_manipulation_msgs_generate_messages object_manipulation_msgs_generate_messages_cpp)

# target for backward compatibility
add_custom_target(object_manipulation_msgs_gencpp)
add_dependencies(object_manipulation_msgs_gencpp object_manipulation_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS object_manipulation_msgs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionFeedback.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_lisp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_lisp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_lisp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_lisp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_lisp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/Grasp.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/GripperTranslation.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_lisp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionActionGoal.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/Grasp.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/JointState.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionActionFeedback.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/GripperTranslation.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionFeedback.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionActionResult.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionResult.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_lisp(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionResult.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_manipulation_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(object_manipulation_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_manipulation_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(object_manipulation_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(object_manipulation_msgs_generate_messages object_manipulation_msgs_generate_messages_lisp)

# target for backward compatibility
add_custom_target(object_manipulation_msgs_genlisp)
add_dependencies(object_manipulation_msgs_genlisp object_manipulation_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS object_manipulation_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionFeedback.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_py(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_py(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_py(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_py(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_py(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/Grasp.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/GripperTranslation.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_py(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionActionGoal.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/Grasp.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/JointState.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionActionFeedback.msg;/opt/ros/hydro/share/manipulation_msgs/cmake/../msg/GripperTranslation.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionFeedback.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionActionResult.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionResult.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs
)
_generate_msg_py(object_manipulation_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/GraspHandPostureExecutionResult.msg;/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/hydro/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(object_manipulation_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(object_manipulation_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(object_manipulation_msgs_generate_messages object_manipulation_msgs_generate_messages_py)

# target for backward compatibility
add_custom_target(object_manipulation_msgs_genpy)
add_dependencies(object_manipulation_msgs_genpy object_manipulation_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS object_manipulation_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_manipulation_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/object_manipulation_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(object_manipulation_msgs_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
add_dependencies(object_manipulation_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(object_manipulation_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(object_manipulation_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
add_dependencies(object_manipulation_msgs_generate_messages_cpp trajectory_msgs_generate_messages_cpp)
add_dependencies(object_manipulation_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
add_dependencies(object_manipulation_msgs_generate_messages_cpp household_objects_database_msgs_generate_messages_cpp)
add_dependencies(object_manipulation_msgs_generate_messages_cpp shape_msgs_generate_messages_cpp)
add_dependencies(object_manipulation_msgs_generate_messages_cpp manipulation_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_manipulation_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/object_manipulation_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(object_manipulation_msgs_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
add_dependencies(object_manipulation_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(object_manipulation_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(object_manipulation_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
add_dependencies(object_manipulation_msgs_generate_messages_lisp trajectory_msgs_generate_messages_lisp)
add_dependencies(object_manipulation_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
add_dependencies(object_manipulation_msgs_generate_messages_lisp household_objects_database_msgs_generate_messages_lisp)
add_dependencies(object_manipulation_msgs_generate_messages_lisp shape_msgs_generate_messages_lisp)
add_dependencies(object_manipulation_msgs_generate_messages_lisp manipulation_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/object_manipulation_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(object_manipulation_msgs_generate_messages_py actionlib_msgs_generate_messages_py)
add_dependencies(object_manipulation_msgs_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(object_manipulation_msgs_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(object_manipulation_msgs_generate_messages_py sensor_msgs_generate_messages_py)
add_dependencies(object_manipulation_msgs_generate_messages_py trajectory_msgs_generate_messages_py)
add_dependencies(object_manipulation_msgs_generate_messages_py sensor_msgs_generate_messages_py)
add_dependencies(object_manipulation_msgs_generate_messages_py household_objects_database_msgs_generate_messages_py)
add_dependencies(object_manipulation_msgs_generate_messages_py shape_msgs_generate_messages_py)
add_dependencies(object_manipulation_msgs_generate_messages_py manipulation_msgs_generate_messages_py)
