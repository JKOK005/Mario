# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ur_msgs: 2 messages, 1 services")

set(MSG_I_FLAGS "-Iur_msgs:/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ur_msgs_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ur_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_msgs
)
_generate_msg_cpp(ur_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOStates.msg"
  "${MSG_I_FLAGS}"
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_msgs
)

### Generating Services
_generate_srv_cpp(ur_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/srv/SetIOState.srv"
  "${MSG_I_FLAGS}"
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_msgs
)

### Generating Module File
_generate_module_cpp(ur_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ur_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ur_msgs_generate_messages ur_msgs_generate_messages_cpp)

# target for backward compatibility
add_custom_target(ur_msgs_gencpp)
add_dependencies(ur_msgs_gencpp ur_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_msgs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ur_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_msgs
)
_generate_msg_lisp(ur_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOStates.msg"
  "${MSG_I_FLAGS}"
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_msgs
)

### Generating Services
_generate_srv_lisp(ur_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/srv/SetIOState.srv"
  "${MSG_I_FLAGS}"
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_msgs
)

### Generating Module File
_generate_module_lisp(ur_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ur_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ur_msgs_generate_messages ur_msgs_generate_messages_lisp)

# target for backward compatibility
add_custom_target(ur_msgs_genlisp)
add_dependencies(ur_msgs_genlisp ur_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ur_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_msgs
)
_generate_msg_py(ur_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOStates.msg"
  "${MSG_I_FLAGS}"
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_msgs
)

### Generating Services
_generate_srv_py(ur_msgs
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/srv/SetIOState.srv"
  "${MSG_I_FLAGS}"
  "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/universal_robot/ur_msgs/msg/IOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_msgs
)

### Generating Module File
_generate_module_py(ur_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ur_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ur_msgs_generate_messages ur_msgs_generate_messages_py)

# target for backward compatibility
add_custom_target(ur_msgs_genpy)
add_dependencies(ur_msgs_genpy ur_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
