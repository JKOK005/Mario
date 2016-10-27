# Install script for directory: /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/object_manipulation_msgs/msg" TYPE FILE FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/msg/ManipulationResult.msg")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/object_manipulation_msgs/action" TYPE FILE FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/action/GraspHandPostureExecution.action")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/object_manipulation_msgs/msg" TYPE FILE FILES
    "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionAction.msg"
    "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionGoal.msg"
    "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionResult.msg"
    "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionActionFeedback.msg"
    "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionGoal.msg"
    "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionResult.msg"
    "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/object_manipulation_msgs/msg/GraspHandPostureExecutionFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/object_manipulation_msgs/cmake" TYPE FILE FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/object_manipulation_msgs/catkin_generated/installspace/object_manipulation_msgs-msg-paths.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/include/object_manipulation_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/share/common-lisp/ros/object_manipulation_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/lib/python2.7/dist-packages/object_manipulation_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/lib/python2.7/dist-packages/object_manipulation_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/object_manipulation_msgs/catkin_generated/installspace/object_manipulation_msgs.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/object_manipulation_msgs/cmake" TYPE FILE FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/object_manipulation_msgs/catkin_generated/installspace/object_manipulation_msgs-msg-extras.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/object_manipulation_msgs/cmake" TYPE FILE FILES
    "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/object_manipulation_msgs/catkin_generated/installspace/object_manipulation_msgsConfig.cmake"
    "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/object_manipulation_msgs/catkin_generated/installspace/object_manipulation_msgsConfig-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/object_manipulation_msgs" TYPE FILE FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/object_manipulation_msgs/package.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

