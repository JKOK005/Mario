execute_process(COMMAND "/home/apc16/apc_2016/mario_catkin_workspace/stowing/build/universal_robot/ur_driver/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/apc16/apc_2016/mario_catkin_workspace/stowing/build/universal_robot/ur_driver/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
