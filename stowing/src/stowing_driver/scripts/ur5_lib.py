#!/usr/bin/python2.7
"""
Author 	: Johan Kok Zhi Kang
Mail 	: JKOK005@e.ntu.edu.sg 

This is a custom motion planning library for the UR5. Motion planning is currently done using available algorithms from
OMPL. 
 
Dependencies:
1) ur_kin_py library	- python-UR kinematics wrapper class from https://github.com/gt-ros-pkg/ur_kin_py.git
2) boost numpy 
3) rospy
4) ros tf library 
5) numpy 
6) OMPL
7) poseinterpolator.py  (in directory)
8) Q_Slerp 				- Transformation library with Quaternion Slerp 

"""

import rospy 
import numpy as np
from std_msgs.msg import *
from trajectory_msgs.msg import *
from ur_kin_py.kin import Kinematics 
from tf import transformations as TF
from poseInterpolator import *

class Ur5_motion_planner:
	joint_lim_low 				= [-1,-0.5,-0.5,-np.pi,-np.pi,-np.pi]			# Default joint limits.
	joint_lim_high 				= [-i for i in joint_lim_low]

	def __init__(self):
		self.joint_name 		= ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']
		self.kin 				= Kinematics("ur5")

	def __unicode__(self):
		return """UR5 custom motion planning library"""
		
	@classmethod
	def change_joint_limits(cls,lim_low,lim_high):
		try:
			cls.__verify_joint_input(lim_low,lim_high)
			cls.joint_lim_low			= lim_low
			cls.joint_lim_high			= lim_high
		
		except AssertionError as e:
			print "Wrong input length or type for limits"

		except Exception as e:
			# Do not interrupt programme flow by breaking code
			print e
		
		return

	@staticmethod
	def __verify_joint_input(lim_low,lim_high):	
		assert type(lim_low) is list and len(lim_low) == 6
		assert type(lim_high) is list and len(lim_high) == 6

		for i in range(6):
			if lim_low[i] > lim_high[i]:
				raise Exception('Please sort your high and low limits')

		return

	def __get_ik_from_matrix(self, h_matrix):
		# Gets all possible IK solutions from homogeneous matrix that satisfies joint limits defined
		ik_sols								= self.kin.inverse_all(x=h_matrix)
		ik_sols_cleaned						= self.__assert_joint_limits(ik_sols)

		assert ik_sols_cleaned is not None
		return ik_sols_cleaned

	def __cartesian_to_ik(self, cartesian):
		# Cartesian coordinates of [roll,pitch,yaw,X,Y,Z] to ik solutions
		roll,pitch,yaw,X,Y,Z 				= cartesian

		matrix_from_euler					= TF.euler_matrix(roll,pitch,yaw)
		matrix_from_translation				= TF.translation_matrix(trans_vector) - TF.identity_matrix()
		matrix_from_cartesian 				= matrix_from_euler + matrix_from_translation 

		return self.__get_ik_from_matrix(matrix_from_cartesian)

	def __assert_joint_limits(self, ik_sols):
		# Asserts that the given joint space coordinate falls within the allowable joint limits or throw AssertionError
		ik_sols_cleaned 					= []

		for each_ik_sol in ik_sols:
			if __solution_within_joint_limits(each_ik_sol):
				ik_sols_cleaned  			+= each_ik_sol

		return ik_sols_cleaned
	
	def __solution_within_joint_limits(self, each_ik_sol):
		length 								= len(each_ik_sol)

		for i in range(length):
			# Check if joint limit has been exceed for each UR joint
			if each_ik_sol[i] < joint_lim_low[i] or each_ik_sol[i] > joint_lim_high[i]:
				return False
		return True

	def __get_cartesian_from_joint(self, joint_vals):
		# Gets homogeneous matrix from joint values
		fk_sol	 							= self.kin.forward(q=joint_vals)

		return self.__get_cartesian_from_matrix(fk_sol)

	def __get_cartesian_from_matrix(self, h_matrix):
		euler_from_matrix					= list(TF.euler_from_matrix(h_matrix))
		translation_from_matrix				= list(TF.translation_from_matrix(h_matrix))

		return euler_from_matrix + translation_from_matrix

	def plan_to_cartesian(self, current_joint_val, goal_cartesian, no_points=10):
		"""
		Plans to given cartesian from current coordinate with intermediate way points.
		"""
		# Goal cartesian is a list of [roll,pitch,yaw,X,Y,Z]
		# Start with a linear planner that plans in cartesian space using SLERP interpolation
		current_cartesian 					= self.__get_cartesian_from_joint(current_joint_val)
		way_points 							= []

		# import ipdb
		# ipdb.set_trace()

		for i in range(no_points):
			point 			= linear_pose_interp(current_cartesian, goal_cartesian, (i+1.0) /no_points)
			way_points 		+= [point['lin'] + quat2euler(point['rot'])]

		return way_points

	def select_ompl_planner(self, name):
		# Changes the planner from OMPL used to <name>
		# To be implemented in future
		pass

if __name__ == "__main__":
	current_joint_val	= [-0.206423593026,-1.88930973546,1.93371669802,3.891687163,2.27589753846,-0.230542109703]
	goal_cartesian 		= [-0.8139287376537965,-0.574451023319419, -2.465989452029603, 0.18783751718385825, -0.003253999496774948, 0.58640475380916413]

	driver = Ur5_motion_planner()
	points 	= driver.plan_to_cartesian(current_joint_val,goal_cartesian)
	print points