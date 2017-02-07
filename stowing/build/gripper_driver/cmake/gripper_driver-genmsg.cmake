# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "gripper_driver: 3 messages, 0 services")

set(MSG_I_FLAGS "-Igripper_driver:/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(gripper_driver_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/force.msg" NAME_WE)
add_custom_target(_gripper_driver_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gripper_driver" "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/force.msg" ""
)

get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_state.msg" NAME_WE)
add_custom_target(_gripper_driver_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gripper_driver" "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_state.msg" ""
)

get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_command.msg" NAME_WE)
add_custom_target(_gripper_driver_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gripper_driver" "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_command.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(gripper_driver
  "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/force.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_driver
)
_generate_msg_cpp(gripper_driver
  "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_driver
)
_generate_msg_cpp(gripper_driver
  "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_driver
)

### Generating Services

### Generating Module File
_generate_module_cpp(gripper_driver
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_driver
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(gripper_driver_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(gripper_driver_generate_messages gripper_driver_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/force.msg" NAME_WE)
add_dependencies(gripper_driver_generate_messages_cpp _gripper_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_state.msg" NAME_WE)
add_dependencies(gripper_driver_generate_messages_cpp _gripper_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_command.msg" NAME_WE)
add_dependencies(gripper_driver_generate_messages_cpp _gripper_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gripper_driver_gencpp)
add_dependencies(gripper_driver_gencpp gripper_driver_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gripper_driver_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(gripper_driver
  "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/force.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_driver
)
_generate_msg_lisp(gripper_driver
  "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_driver
)
_generate_msg_lisp(gripper_driver
  "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_driver
)

### Generating Services

### Generating Module File
_generate_module_lisp(gripper_driver
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_driver
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(gripper_driver_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(gripper_driver_generate_messages gripper_driver_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/force.msg" NAME_WE)
add_dependencies(gripper_driver_generate_messages_lisp _gripper_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_state.msg" NAME_WE)
add_dependencies(gripper_driver_generate_messages_lisp _gripper_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_command.msg" NAME_WE)
add_dependencies(gripper_driver_generate_messages_lisp _gripper_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gripper_driver_genlisp)
add_dependencies(gripper_driver_genlisp gripper_driver_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gripper_driver_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(gripper_driver
  "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/force.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_driver
)
_generate_msg_py(gripper_driver
  "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_driver
)
_generate_msg_py(gripper_driver
  "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_driver
)

### Generating Services

### Generating Module File
_generate_module_py(gripper_driver
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_driver
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(gripper_driver_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(gripper_driver_generate_messages gripper_driver_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/force.msg" NAME_WE)
add_dependencies(gripper_driver_generate_messages_py _gripper_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_state.msg" NAME_WE)
add_dependencies(gripper_driver_generate_messages_py _gripper_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apc16/apc_2016/mario_catkin_workspace/stowing/src/gripper_driver/msg/motor_command.msg" NAME_WE)
add_dependencies(gripper_driver_generate_messages_py _gripper_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gripper_driver_genpy)
add_dependencies(gripper_driver_genpy gripper_driver_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gripper_driver_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_driver
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(gripper_driver_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_driver
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(gripper_driver_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_driver)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_driver\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_driver
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(gripper_driver_generate_messages_py std_msgs_generate_messages_py)
