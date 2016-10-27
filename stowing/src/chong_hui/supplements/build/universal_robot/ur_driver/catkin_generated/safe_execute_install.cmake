execute_process(COMMAND "/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/universal_robot/ur_driver/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/universal_robot/ur_driver/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
