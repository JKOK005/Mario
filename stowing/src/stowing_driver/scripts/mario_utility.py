""" 
Coordinate calibration of the bottom left markings of each obj relative to the robot. 
Reference taken from stowing_driver -> ur5.launch file which defines the full APC setup

All coordinates are in meters and taken relative to the base frame of the robot.
The base frame of the robot is elevated by a support structure (yellow) that gives the robot additional height.

The robot's base coordinate frame is defined in Gazebo, with X (red) pointing straight towards the self, Y (green) pointing to the left 
and Z (blue) following the right hand rule. 
"""

import numpy as np
from math import pi
from tf import transformations as TF
from poseInterpolator import *
from apc_global_params import *

# Bin / tote transformation class
class GenericTransformationContainer(object):
	# Transforms item coordinate from object coordinates to base coordinates
	@classmethod
	def get_item_coord_from_obj_to_robot(cls, obj_label, item_coord_X, item_coord_Y, item_coord_Z):
		item_coords 		= np.array([item_coord_X, item_coord_Y, item_coord_Z, 1])
		obj_to_base_mat 	= cls.get_transformation_from_obj_to_robot(obj_label=obj_label)
		return TF.concatenate_matrices(obj_to_base_mat, item_coords)

	# Full 4 x 4 matrix used to map coordinates in obj to robot base frame
	@classmethod
	def get_transformation_from_obj_to_robot(cls, obj_label):
		trans_mat			= cls.get_full_translation_from_obj_to_robot(obj_label)
		rot_mat 			= cls.get_full_rotation_from_obj_to_robot(cls.x_rot, cls.y_rot, cls.z_rot)
		return TF.concatenate_matrices(trans_mat, rot_mat)

	@classmethod
	def get_full_translation_from_obj_to_robot(cls, obj_label):
		return TF.translation_matrix(base_displacement_to_bot_left_bin[obj_label])

	@classmethod
	def get_full_rotation_from_obj_to_robot(cls, x_rot, y_rot, z_rot):
		rot_mat_X 			= cls.__get_X_rotation_from_obj_to_robot(x_rot) 
		rot_mat_Y 			= cls.__get_Y_rotation_from_obj_to_robot(y_rot) 
		rot_mat_Z 			= cls.__get_Z_rotation_from_obj_to_robot(z_rot)
		full_rot_matrix 	= TF.concatenate_matrices(rot_mat_X, rot_mat_Y, rot_mat_Z)
		return full_rot_matrix

	@classmethod
	def __get_X_rotation_from_obj_to_robot(cls, x_rot):
		rotation 		= TF.rotation_matrix(x_rot, [1,0,0])
		return rotation

	@classmethod
	def __get_Y_rotation_from_obj_to_robot(cls, y_rot):
		rotation 		= TF.rotation_matrix(y_rot, [0,1,0])
		return rotation

	@classmethod
	def __get_Z_rotation_from_obj_to_robot(cls, z_rot):
		rotation 		= TF.rotation_matrix(z_rot, [0,0,1])
		return rotation

class RobotToNewShelfTransformation(GenericTransformationContainer):
	# Shelf is now 0.85 m in front of robot
	# Robot's base height decreases to 1.34m
	x_rot = 0; y_rot = 0; z_rot = -pi/2 		# Rotation angles from bin to robot frame

class RobotToOldShelfTransformation(GenericTransformationContainer):
	# Shelf is now 0.85 m in front of robot
	# Robot's base height decreases to 1.283m
	x_rot = 0; y_rot = 0; z_rot = -pi/2 		# Rotation angles from bin to robot frame

class RobotToToteTransformation(GenericTransformationContainer):
	# Provide amnesty and stowing tote base displacement here
	x_rot = 0; y_rot = 0; z_rot = 0 		# Rotation angles from tote to robot frame

# Gripper transformation class
class GripperToEndEffectorTransformation(object):
	# Maps gripper end effector to Mario's end effector
	@classmethod
	def gripper_frame_to_end_effector_displacement(cls, roll, pitch, yaw):
		gripper_displacement_as_array 				= np.array(cls.gripper_displacement_axis).reshape(3,1)
		gripper_to_end_effector_transformation 		= TF.euler_matrix(roll,pitch,yaw)[:3,:3]
		return np.dot(gripper_to_end_effector_transformation, gripper_displacement_as_array).reshape(1,3).tolist()[0]

class GripperFrontSuctionOffset(GripperToEndEffectorTransformation):
	X_displacement  			= 0.350		# As measured from the end effector to the gripper end effector using Gazebo coordinate frame
	Y_displacement 				= -0.0525
	Z_displacement 				= 0
	gripper_displacement_axis 	= [X_displacement, Y_displacement, Z_displacement] 	# Axis 

class GripperSideSuctionOffset(GripperToEndEffectorTransformation):
	X_displacement  			= 0.350		# As measured from the end effector to the gripper end effector using Gazebo coordinate frame
	Y_displacement 				= -0.0525
	Z_displacement 				= 0
	gripper_displacement_axis 	= [X_displacement, Y_displacement, Z_displacement] 	# Axis 


# Interpolator class
class PoseInterpolator(object):
	# Goal cartesian is a list of [roll,pitch,yaw,X,Y,Z]
	@classmethod
	def plan_to_cartesian_linear(self, current_cartesian, goal_cartesian, no_points=20):
		way_points 					= []
		roll, pitch, yaw, _ ,_ ,_ 	= current_cartesian
		for i in range(no_points):
			start 					= array(current_cartesian[3:]) 
			end 					= array(goal_cartesian[3:])
			point 					= linear_translation(start, end, (i+1.0) /no_points)
			way_point 				= [roll, pitch, yaw] + point.tolist()
			way_points 				+= [way_point]
		return way_points