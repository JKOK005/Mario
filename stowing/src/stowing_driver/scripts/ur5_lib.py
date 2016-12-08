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
"""

import rospy 
import numpy as np
import actionlib
from std_msgs.msg import *
from trajectory_msgs.msg import *
from control_msgs.msg import *
from ur_kin_py.kin import Kinematics 
from tf import transformations as TF
from copy import copy

class VelocityProfile(object):
	def __init__(self, *args, **kwargs):
		self.max_angular_vel	= 2
		self.min_angular_vel	= 0.5
		super(VelocityProfile, self).__init__(*args, **kwargs)

	def __get_velocity_ramp(self, itr, total_points):
		if itr <= total_points /3:
			vel 		= (3 *float(itr) /total_points) *(self.max_angular_vel -self.min_angular_vel) + self.min_angular_vel
		elif itr >= total_points *2/3:
			vel 		= self.max_angular_vel -(3 *float(itr) /total_points -2) * (self.max_angular_vel -self.min_angular_vel)
		else:
			vel 		= self.max_angular_vel
		return vel

	def get_time_ramp_trajectory(self, del_theta, itr, total_points):
		velocity 			= self.__get_velocity_ramp(itr, total_points)
		time_interp 		= float(del_theta / velocity)
		return time_interp

class SubscribeToActionServer(VelocityProfile):
	def __init__(self, *args,**kwargs):
		if(self.is_simulation):
			# For gazebo
			self.server_client 		= actionlib.SimpleActionClient('arm_controller/follow_joint_trajectory', FollowJointTrajectoryAction)	
		else:
			# Actual robot
			self.server_client 		= actionlib.SimpleActionClient('follow_joint_trajectory', FollowJointTrajectoryAction)					
		super(SubscribeToActionServer, self).__init__(*args, **kwargs)

	def __frame_header_message(self):
		header 					= Header()
		header.seq 				= 1
		header.stamp			= rospy.Time.now()
		header.frame_id 		= "10"
		return header

	def __frame_single_point(self, joint_space):
		# Only 1 point to move to in joint space
		for instance in joint_space:
			single_point 			= instance
			single_point[0:5] 		*= -1 						# Some hacks to align Gazebo coordinate system with OpenRave

			point 					= JointTrajectoryPoint()
			point.positions 		= single_point.tolist()
			point.velocities 		= [0.1,0.1,0.1,0.1,0.1,0.1]
			point.accelerations 	= []
			point.time_from_start 	= rospy.Duration(2) 		# time from start must be in increasing order based on way point sequence
		return [point]

	def __frame_points_list(self, joint_space, total_points):
		point_list 				= []
		time_cumulated 			= 0.01
		no_of_points 			= total_points -1

		if(total_points == 1):
			point_list  		+= self.__frame_single_point(joint_space)
		else:
			import ipdb
			# ipdb.set_trace()
			for itr in range(no_of_points):								# TODO: Cannot handle reversed list iterator <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
				start 					= joint_space[itr]
				end 					= joint_space[itr +1]
				end_modified 			= copy(end)
				end_modified[0:5] 		= end_modified[0:5] *-1 		# Some hacks to align Gazebo coordinate system with OpenRave

				point 					= JointTrajectoryPoint()
				point.positions 		= end_modified.tolist()
				point.velocities 		= [0.1,0.1,0.1,0.1,0.1,0.1]
				point.accelerations 	= []
				point.time_from_start 	= rospy.Duration(time_cumulated) 		# time from start must be in increasing order based on way point sequence

				del_theta 				= max(abs(end -start))
				time_cumulated			+= self.get_time_ramp_trajectory(del_theta=del_theta, itr=itr, total_points=no_of_points)
				point_list 				+= [point]
		return point_list

	def __frame_trajectory_message(self, joint_space, total_points):
		trajectory 				= JointTrajectory()
		trajectory.header 		= self.__frame_header_message()
		trajectory.joint_names 	= self.joint_names
		trajectory.points 		= self.__frame_points_list(joint_space, total_points)
		return trajectory

	def __frame_path_tolerance_message(self):
		path_tolerance 					= JointTolerance()
		path_tolerance.name 			= "path_tolerance"
		path_tolerance.position 		= 0
		path_tolerance.velocity 		= 0
		path_tolerance.acceleration 	= 0
		return [path_tolerance]

	def __frame_goal_tolerance_message(self):
		goal_tolerance 					= JointTolerance()
		goal_tolerance.name 			= "goal_tolerance"
		goal_tolerance.position 		= 0
		goal_tolerance.velocity 		= 0
		goal_tolerance.acceleration 	= 0
		return [goal_tolerance]

	def __frame_goal_message(self, joint_space, total_points):
		goal_message 				= FollowJointTrajectoryGoal()

		trajectory 					= self.__frame_trajectory_message(joint_space=joint_space, total_points=total_points)
		path_tolerance 				= self.__frame_path_tolerance_message()
		goal_tolerance 				= self.__frame_goal_tolerance_message()

		goal_message.trajectory 			= trajectory
		goal_message.path_tolerance			= path_tolerance
		goal_message.goal_tolerance			= goal_tolerance
		goal_message.goal_time_tolerance 	= rospy.Duration(5,0)
		return goal_message

	def __establish_server_connection(self):
		is_conn_success 		= False
		if(self.server_client.wait_for_server()):
			rospy.loginfo("SubscribeToActionServer -> Connected to action server")
			is_conn_success 	= True
		else:
			rospy.logerr("SubscribeToActionServer -> Unable to connect to action server")
		return is_conn_success

	def action_server_move_arm(self, joint_space, total_points):
		# Handles framing of message with timing given by the velocity profile and publishing to action server
		# Joint space is a list of np.arrays data type
		if(total_points == 0):
			rospy.logerr("SubscribeToActionServer -> No joint space coords detected.")
			return 

		if(not self.__establish_server_connection()):
			rospy.logerr("SubscribeToActionServer -> Terminating connection with action server")
		else:
			goal_message 			= self.__frame_goal_message(joint_space, total_points)
			self.server_client.send_goal(goal_message)
			rospy.loginfo("SubscribeToActionServer -> Sending motion planning points to server")

			if(not self.server_client.wait_for_result(rospy.Duration(15,0))):
				rospy.logerr("SubscribeToActionServer -> Server took too long to respond with result.")
			else:
				rospy.loginfo("SubscribeToActionServer -> Movement of arm complete")
		return

class UrMotionPlanner(SubscribeToActionServer):
	joint_lim_low 				= [-1,-0.5,-0.5,-np.pi,-np.pi,-np.pi]			# Default joint limits.
	joint_lim_high 				= [-i for i in joint_lim_low]
	is_simulation				= True

	def __init__(self, *args, **kwargs):
		rospy.init_node('UR5_motion_planner', anonymous=True)
		self.move_arm_pub_gazebo 		= rospy.Publisher('arm_controller/command', JointTrajectory, 
									    queue_size=20, latch=True)

		self.joint_names 				= ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']
		self.kin 						= Kinematics("ur5")
		self.single_sol 				= False
		super(UrMotionPlanner, self).__init__(*args, **kwargs)

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

	def cartesian_to_ik(self, cartesian, single_sol=False):
		# Cartesian coordinates of [roll,pitch,yaw,X,Y,Z] to ik solutions
		# Returns all possible IK solutions within joint limits if single is False
		# Returns best IK solution within joint limit if single is True
		self.single_sol						= single_sol
		roll,pitch,yaw,X,Y,Z 				= cartesian

		matrix_from_euler					= TF.euler_matrix(roll,pitch,yaw)
		matrix_from_translation				= TF.translation_matrix([X,Y,Z]) - TF.identity_matrix()
		matrix_from_cartesian 				= matrix_from_euler + matrix_from_translation 

		return self.__get_ik_from_matrix(matrix_from_cartesian)

	def __get_ik_from_matrix(self, h_matrix):
		# Gets all possible IK solutions from homogeneous matrix that satisfies joint limits defined
		# If no possible IK solutions for given point, throws AssertionError
		ik_sols								= self.kin.inverse_all(x=h_matrix)
		ik_sols_cleaned						= self.__assert_joint_limits(ik_sols)

		assert len(ik_sols_cleaned) is not 0

		if(self.single_sol):
			ik_sols_cleaned					= self.__get_best_ik_solution(ik_sols_cleaned)

		return ik_sols_cleaned

	def __assert_joint_limits(self, ik_sols):
		# Asserts that the given joint space coordinate falls within the allowable joint limits or throw AssertionError
		ik_sols_cleaned 					= []

		for each_ik_sol in ik_sols:
			if self.__solution_within_joint_limits(each_ik_sol):
				ik_sols_cleaned  			+= each_ik_sol

		return ik_sols_cleaned
	
	def __get_best_ik_solution(self, ik_sols_cleaned, weights=6*[1.0]):
		q_guess 							= np.zeros(6)

		import ipdb
		ipdb.set_trace()

		best_sol_ind 						= np.argmin(np.sum((weights*(ik_sols_cleaned - np.array(q_guess)))**2,1))
		best_sol 							= ik_sols_cleaned[best_sol_ind]
		
		return best_sol

	def __solution_within_joint_limits(self, each_ik_sol):
		# If not within joint limit, reject each_ik_sol
		length 								= len(each_ik_sol)

		for i in range(length):
			# Check if joint limit has been exceed for each UR joint
			if each_ik_sol[i] < self.joint_lim_low[i] or each_ik_sol[i] > self.joint_lim_high[i]:
				return False
		return True

	def cartesian_from_joint(self, joint_vals):
		# Gets homogeneous matrix from joint values
		# joint_vals either be a list of multiple joint sets or a single joint set

		if(all(isinstance(i, list) for i in joint_vals)):
			lst 				= []

			for each_joint_val in joint_vals:
				fk_sol	 		= self.kin.forward(q=each_joint_val)
				lst 			+= [self.__get_cartesian_from_matrix(fk_sol)]
		else:
			fk_sol	 			= self.kin.forward(q=joint_vals)
			lst 				= self.__get_cartesian_from_matrix(fk_sol)

		return lst

	def __get_cartesian_from_matrix(self, h_matrix):
		# Returns a list of [roll, pitch, yaw, X, Y, Z]

		euler_from_matrix					= list(TF.euler_from_matrix(h_matrix))
		translation_from_matrix				= list(TF.translation_from_matrix(h_matrix))

		return euler_from_matrix + translation_from_matrix

	def plan_to_cartesian(self, current_joint_val, goal_cartesian, no_points=10):
		"""
		Plans to given cartesian from current coordinate with intermediate way points.
		"""
		# Goal cartesian is a list of [roll,pitch,yaw,X,Y,Z]
		# Start with a linear planner that plans in cartesian space using SLERP interpolation
		# Raises AssertinError when intermediate point has no solutions
		current_cartesian 					= self.cartesian_from_joint(current_joint_val)
		joint_way_points 					= []

		try:
			for i in list(reversed(range(no_points))):
				point 							= linear_pose_interp(current_cartesian, goal_cartesian, (i+1.0) /no_points)
				print point
				way_point 						= quat2euler(point['rot']) + point['lin']
				joint_way_points 				+= self.cartesian_to_ik(cartesian=way_point, single_sol=True)

		except AssertionError:
			raise AssertionError("No possible IK solutions found for coordinate: {0}".format(way_point))

		return joint_way_points

if __name__ == "__main__":
	test_joint 			= [0,0,0,0,0,0]
	joint_start 		= [-0.97,0.2,-1.4,2.75,1.5,-2.071]
	bin1 				= [-0.3,0,1,2.2,1.8,0]
	current_joint_val	= [-0.206423593026,-1.88930973546,1.93371669802,3.891687163,2.27589753846,-0.230542109703]
	goal_cartesian 		= [-0.8139287376537965, -0.574451023319419, -2.465989452029603, 0.18783751718385825, -0.003253999496774948, 0.58640475380916413]

	driver 	= UrMotionPlanner()
	# points 	= driver.plan_to_cartesian(current_joint_val,goal_cartesian)