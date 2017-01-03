""" 
Coordinate calibration of the bottom left markings of each obj relative to the robot. 
Reference taken from stowing_driver -> ur5.launch file which defines the full APC setup

All coordinates are in meters and taken relative to the base frame of the robot.
The base frame of the robot is elevated by a support structure (yellow) that gives the robot additional height.

The robot's base coordinate frame is defined in Gazebo, with X (red) pointing straight towards the self, Y (green) pointing to the left 
and Z (blue) following the right hand rule. 
"""

import numpy as np
from tf import transformations as TF

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
		return TF.translation_matrix(cls.base_displacement_to_obj[obj_label])

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
	delete_this_var 		= 0.4 		# Hard coded solution to make sure joint angles satisfy ur5 limits
	base_displacement_to_obj = {
		'bin_a' : [0.850 -delete_this_var, 0.613, 0.495],
		'bin_b' : [0.850 -delete_this_var, 0.200, 0.495],
		'bin_c' : [0.850 -delete_this_var, -0.213, 0.495],
		'bin_d' : [0.850 -delete_this_var, 0.613, 0.080],
		'bin_e' : [0.850 -delete_this_var, 0.200, 0.080],
		'bin_f' : [0.850 -delete_this_var, -0.213, 0.080],
		'bin_g' : [0.850 -delete_this_var, 0.613, -0.367],
		'bin_h' : [0.850 -delete_this_var, 0.200, -0.367],
		'bin_i' : [0.850 -delete_this_var, -0.213, -0.367],
	}
	x_rot = 0; y_rot = 0; z_rot = 0 		# Rotation angles from bin to robot frame

class RobotToToteTransformation(GenericTransformationContainer):
	# Provide amnesty and stowing tote base displacement here
	base_displacement_to_obj = {
		'tote_amnesty' : [0,0,0],
		'tote_stowing' : [0,0,0],
	}
	x_rot = 0; y_rot = 0; z_rot = 0 		# Rotation angles from tote to robot frame