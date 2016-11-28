"""
Author: Johan Kok Zhi Kang 

Description:
This module serves as the motion planner for the UR5 robot. The environment models the actual
competition from APC 2016. 

The file UR5.dae contains the UR5 robot collada model. The manipulator present is called "arm".
Details can be found on OpenRave main site, universalrobots-ur6-85-5-a Robot. 

Sequence of use:
a) Initialize OP_motion_planning object
b) Call init_planning_setup to initialize robot configuration and collision checking
c) Call optimize to obtain trajectories 
d) Call simulate to display motion

Dependencies:
1) Openrave 0.9
2) TrajOpt
3) or_ompl python bindings
4) ur5_lib.py		- Custom library with UR5 kinematics
5) UR5.dae
6) apc_env.xml
"""


import openravepy as op
import trajoptpy
import json
import time
import IPython
import numpy as np
import rospy
import os
from ur5_lib import Ur5_motion_planner
from trajoptpy.check_traj import traj_is_safe


class OR_motion_planning:
	def __init__(self, env_file):
		"""
		Constructor to initialize the environment and the UR5 robot in APC 2016 settings
		params: 
			env_file <string>	: 	The environment file you want to load
		"""
		self.env 			= op.Environment()
		self.load_environment_context(env_file)

		self.robot 			= self.env.GetRobots()[0]
		self.mario_arm 		= self.robot.GetManipulator('arm')

		self.ur_kin 		= Ur5_motion_planner()

	def load_environment_context(self, env_file):
		try:
			self.env.StopSimulation()
			self.env.SetViewer('qtcoin')
			self.env.Load(env_file)
		except Exception as e:
			print("Failed to load environment")
		return

	def init_planning_setup(self, init_joint_val, collision_struct):
		# Before planning, initilize robot's current configuration and collision checking options
		try:
			self.__init_arm_joint(init_joint_val)
			self.__init_collision_checker(collision_struct)
		except Exception as e:
			print("Failed to initialize planning setup")
			print(e)

	def __init_arm_joint(self, init_joint_val):
		with self.env:
			arm_indx 				= self.mario_arm.GetArmIndices()
			self.get_robot().SetActiveDOFs(arm_indx)	
			self.get_robot().SetActiveManipulator(self.mario_arm)	
			self.get_robot().SetActiveDOFValues(init_joint_val)

	def __init_collision_checker(self, collision_struct):
		"""
		params: 
			collision_struct <dict> with <key> : <param> values:
				checker <string> : The name of the Checker used for collision detection. Eg. 'pqp' collision checker
				collision_options <list><op::CollisionOptions> : Various collision options available expressed as a list
		"""
		checker 					= collision_struct['checker']
		collision_options 			= collision_struct['collision_options']
		collisionChecker 			= op.RaveCreateCollisionChecker(self.env, checker)

		j = 0
		for i in collision_options:
			j = j|i

		collisionChecker.SetCollisionOptions(j)
		self.env.SetCollisionChecker(collisionChecker)

	def __get_n_val(self, starting_cartesian, target_cartesian, steps_per_meter):
		start 					= np.array(starting_cartesian)
		end 					= np.array(target_cartesian)
		dist 					= np.linalg.norm(end -start)
		n_steps 				= np.ceil(dist *steps_per_meter)
		n_steps_min 			= 50		# Minimum number of steps

		return int(max(n_steps, n_steps_min))

	def __get_n_steps_from_dist(self, starting_DOF, joint_target):
		starting_cartesian 		= self.ur_kin.cartesian_from_joint(starting_DOF)[3:]
		target_cartesian 		= self.ur_kin.cartesian_from_joint(joint_target)[3:]
		steps_per_meter			= 1000 		# 100 steps per meter

		return self.__get_n_val(starting_cartesian, target_cartesian, steps_per_meter)

	def __construct_problem(self, request):
		jd 				= json.dumps(request) # convert dictionary into json-formatted string
		prob 			= trajoptpy.ConstructProblem(jd, self.env) # create object that stores optimization problem
		return trajoptpy.OptimizeProblem(prob) # do optimization

	def optimize_trajopt(self, joint_target):
		starting_DOF 		= self.get_manip_DOF()

		n_steps = self.__get_n_steps_from_dist(starting_DOF, joint_target)

		request = {
		  "basic_info" : {
		    "n_steps" : n_steps,
		    "manip" : "arm", # see below for valid values
		    "start_fixed" : True # i.e., DOF values at first timestep are fixed based on current robot state
		  },
		  "costs" : [
		  {
			"type" : "joint_vel", 			# joint-space velocity cost
			"params": {"coeffs" : [10]} 	# list of length 1 is will be expanded to all DOF 
		  },
		  {
		  	# Self collision checker
			"type" : "collision",
			"params" : {
			  "coeffs" : [1000], 
			  "dist_pen" : [0.03], 			# robot-obstacle distance that penalty kicks in. expands to length n_timesteps
			  "continuous" : True
			}
		  },

		  {
			"type" : "collision",
			"params" : {
			  "coeffs" : [1000], # penalty coefficients. list of length one is automatically expanded to a list of length n_timesteps
			  "dist_pen" : [0.03], # robot-obstacle distance that penalty kicks in. expands to length n_timesteps
			  "continuous" : False
			}
		  }    
		  ],
		  "constraints" : [
	  		{
		    "type" : "joint", # joint-space target
		    "params" : {"vals" : joint_target } # length of vals = # dofs of manip
		  },
			{	
		    "type" : "cart_vel",
		    "name" : "cart_vel",
		    "params" : {
		        "max_displacement" : 0.05,
		        "first_step" : 0,
		        "last_step" : n_steps-1, #inclusive
		        "link" : "link6"
		    },
		  }
		  ],
		  "init_info" : {
		      "type" : "straight_line", # straight line in joint space.
		      "endpoint" : joint_target
		      # "type" : "stationary",
		  }
		}

		result 							= self.__construct_problem(request)

		try:
			assert traj_is_safe(result.GetTraj(), self.robot) 
		except AssertionError:
			print("Straight line planning failed. Reverting to stationary planning")
			self.get_robot().SetActiveDOFValues(starting_DOF)		# Reset arm positioning

			request["init_info"]		= {"type" : "stationary"}
			result 						= self.__construct_problem(request)

		rospy.loginfo("No of points -> {0}".format(n_steps))
		return result.GetTraj()

	def move_linear(self, joint_target):
		starting_DOF_array 		= self.get_manip_DOF()
		joint_target_array		= np.array(joint_target)
		no_of_points 			= 100

		linear_trajectory		= starting_DOF_array
		for i in range(no_of_points):
			path 				= starting_DOF_array + (i +1.0)/no_of_points *(joint_target_array -starting_DOF_array)
			linear_trajectory 	= np.vstack((linear_trajectory, path))
		
		return linear_trajectory

	def simulate(self, trajectory):
		"""
		Call to simulate the movement of the desired manip to joint goal
		"""
		for each_traj in trajectory:
			self.robot.SetDOFValues(each_traj, self.get_manip().GetArmIndices())
			time.sleep(0.02)

	def __check_safe(self, trajectory):
		"""
		Asserts a safe path by calling the collision checker through every iteration of the resultant trajectory
		Return:
			bool : If the path is safe then return True, else False
		"""
		self.env.GetCollisionChecker().SetCollisionOptions(op.CollisionOptions.Contacts)

		for each_traj in trajectory:
			self.robot.SetDOFValues(each_traj, self.get_manip().GetArmIndices())
			flag = self.env.CheckCollision(kin.GetLinks()[3], kin.GetLinks()[6])		

			if flag == True:
				return False		# That means that collision happened
			time.sleep(0.01)
		return True

	def get_robot(self):	
		return self.robot

	def get_manip(self):
		return self.mario_arm

	def get_manip_DOF(self):
		return self.get_manip().GetArmDOFValues()

	def set_manip_DOF(self, DOF):
		"""
		Sets the DOF for a given manipulator. Thereafter, a call to update the global DOF status of the robot will be done
		""" 
		arm_indices				= self.get_manip().GetArmIndices()
		self.get_robot().SetDOFValues(DOF, arm_indices)


if __name__ == "__main__":	
	joint_start 		= [-0.25,-0.25,-1.3,3.124,1.5,-1.571]
	bin1 				= [-0.55,-0.08,1.0,2.2,2.1,-1.571]
	bin1_extended 		= [-0.56,0.2,0.25,2.6,2.1,-1.571]
	sequence_1 			= [joint_start] + [bin1] + [bin1_extended] 

	bin2 				= [0.04,-0.25,1.9,1.5,1.571,-1.571]
	bin2_extended 		= [0.04,-0.1,1,2.2,1.571,-1.571]
	sequence_2 			= [joint_start] + [bin2] + [bin2_extended] 

	bin3 				= [0.8,-0.2,1.5,1.8,0.75,-1.571]
	bin3_extended 		= [0.65,0.2,0.25,2.6,0.85,-1.571]
	sequence_3 			= [joint_start] + [bin3] + [bin3_extended] 

	bin4 				= [-0.60,-0.78,1.5,2.3,2.1,-1.501]
	bin4_extended 		= [-0.60,-0.4,0.6,2.9,2.1,-1.501]
	sequence_4 			= [joint_start] + [bin4] + [bin4_extended] 

	bin5 				= [0.10,-0.85,1.55,2.4,1.4,-1.571]
	bin5_extended 		= [0.0,-0.9,1.4,2.6,1.6,-1.501]
	sequence_5 			= [joint_start] + [bin5] + [bin5_extended] 

	bin6 				= [0.60,-0.9,1.70,2.3,1.0,-1.571]
	bin6_extended		= [0.65,-0.6,0.9,2.8,0.9,-1.501]
	sequence_6 			= [joint_start] + [bin6] + [bin6_extended] 

	bin7 				= [-0.58,-0.8,0.4,3.5,2.1,-1.571]
	bin7_extended 		= [-0.58,-0.4,-0.2,3.4,1.9,-1.571]
	sequence_7 			= [joint_start] + [bin7] + [bin7_extended] 

	bin8 				= [0.04,-1.2,0.75,3.5,1.5,-1.571]
	bin8_extended 		= [0.04,-0.45,-0.4,3.9,1.5,-1.571]
	sequence_8   		= [joint_start] + [bin8] + [bin8_extended] 

	bin9 				= [0.75,-1.1,1.0,3.0,0.8,-1.75]
	bin9_extended 		= [0.6,-0.2,-0.5,3.3,1.0,-1.8]
	sequence_9			= [joint_start] + [bin9] + [bin9_extended] 

	robot_path 			= [sequence_1] + [sequence_2] + [sequence_3] + [sequence_4] + [sequence_5] + [sequence_6] + \
							[sequence_7] + [sequence_8] + [sequence_9]

	planner 			= OR_motion_planning('apc_env.xml')

	collision_struct 	= {"checker":'pqp', 
							"collision_options":[op.CollisionOptions.Contacts]}

	IPython.embed()
	driver 		= Ur5_motion_planner()
	driver.move_arm(joint_start)
 	raw_input("Press enter to continue: ")

	for itr in range(9):
		#  Move from bin to tote
	 	planner.init_planning_setup(robot_path[itr][0], collision_struct)
	 	final_trajectory 	=	planner.optimize_trajopt(joint_target=robot_path[itr][1])
	 	# planner.simulate(trajectory=final_trajectory)
	 	final_traj_dict 	= {'trajectory': final_trajectory,
	 							'length': len(final_trajectory),}
	 	driver.move_arm(joint_space=final_traj_dict, v_profile="ramp")
	 	rospy.sleep(2)

	 	planner.init_planning_setup(robot_path[itr][1], collision_struct)
	 	linear_trajectory 	= 	planner.move_linear(joint_target=robot_path[itr][2])
	 	# planner.simulate(trajectory=linear_trajectory)
	 	linear_traj_dict 	= {'trajectory': linear_trajectory,
	 							'length': len(linear_trajectory),}
	 	driver.move_arm(joint_space=linear_traj_dict, v_profile="ramp")
	 	rospy.sleep(2)

	 	# Move from tote to bin
	 	# planner.simulate(trajectory=reversed(linear_trajectory))
	 	linear_traj_dict 	= {'trajectory': reversed(linear_trajectory),
	 							'length': len(linear_trajectory),}
	 	driver.move_arm(joint_space=linear_traj_dict, v_profile="ramp")
		rospy.sleep(2)

	 	# planner.simulate(trajectory=reversed(final_trajectory))
	 	final_traj_dict 	= {'trajectory': reversed(final_trajectory),
	 							'length': len(final_trajectory),}
	 	driver.move_arm(joint_space=final_traj_dict, v_profile="ramp")
	 	rospy.sleep(2)