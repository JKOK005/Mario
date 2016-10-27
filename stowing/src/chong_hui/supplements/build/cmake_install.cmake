# Install script for directory: /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src

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
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install/_setup_util.py")
FILE(INSTALL DESTINATION "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install" TYPE PROGRAM FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/catkin_generated/installspace/_setup_util.py")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install/env.sh")
FILE(INSTALL DESTINATION "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install" TYPE PROGRAM FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/catkin_generated/installspace/env.sh")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install/setup.bash")
FILE(INSTALL DESTINATION "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install" TYPE FILE FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/catkin_generated/installspace/setup.bash")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install/setup.sh")
FILE(INSTALL DESTINATION "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install" TYPE FILE FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/catkin_generated/installspace/setup.sh")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install/setup.zsh")
FILE(INSTALL DESTINATION "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install" TYPE FILE FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/catkin_generated/installspace/setup.zsh")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install/.rosinstall")
FILE(INSTALL DESTINATION "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/install" TYPE FILE FILES "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/catkin_generated/installspace/.rosinstall")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/catkin/profile.d" TYPE FILE FILES "/opt/ros/hydro/share/catkin/cmake/env-hooks/05.catkin_make.bash")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/catkin/profile.d" TYPE FILE FILES "/opt/ros/hydro/share/catkin/cmake/env-hooks/05.catkin_make_isolated.bash")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/gtest/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/abb_irb2400_blue_room_moveit_config/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/ccny_vision/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/libartoolkit/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/universal_robot/universal_robot/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/universal_robot/ur5_moveit_config/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/universal_robot/ur_kinematics/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/universal_robot/ur_msgs/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/object_manipulation_msgs/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/ar_pose/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/universal_robot/ur_driver/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/abb/abb_common/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/industrial_robot_simulator/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/motoman_config/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/abb/abb_moveit_plugins/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/universal_robot/ur_description/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/universal_robot/ur_bringup/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/universal_robot/ur_gazebo/cmake_install.cmake")
  INCLUDE("/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/abb/irb_2400_moveit_config/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
