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

class Ur5_motion_planner:
	joint_lim_low 				= [-1,-0.5,-0.5,-np.pi,-np.pi,-np.pi]			# Default joint limits.
	joint_lim_high 				= [-i for i in joint_lim_low]
	joint_names 				= ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']
	freq 						= 30	 		# Hz
	max_angular_vel 			= 0.5 			# rad /s
	min_angular_vel 			= 0.1

	def __init__(self):
		rospy.init_node('ur5_gazebo_publisher', anonymous=True)
		self.ros_rate 				= rospy.Rate(self.freq)
		self.move_arm_pub 			= rospy.Publisher('arm_controller/command', JointTrajectory, 
									queue_size=20, latch=True)

		self.joint_name 			= ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']
		self.kin 					= Kinematics("ur5")
		self.single_sol 			= False

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

				import ipdb
				ipdb.set_trace()	

				joint_way_points 				+= self.cartesian_to_ik(cartesian=way_point, single_sol=True)

		except AssertionError:
			raise AssertionError("No possible IK solutions found for coordinate: {0}".format(way_point))

		return joint_way_points

	def select_ompl_planner(self, name):
		# Changes the planner from OMPL used to <name>
		# To be implemented in future
		pass

	def _frame_message(self, joint_space, time_interp):
		interpolation_time 				= time_interp			# seconds

		joint_traj_msg 					= JointTrajectory()
		sensor_msg_header 				= Header()
		JointTrajectoryPoint_points 	= JointTrajectoryPoint()

		sensor_msg_header.seq 			= 1
		sensor_msg_header.stamp 		= rospy.get_rostime()
		sensor_msg_header.frame_id 		= "10"

		positions 						= [-i for i in joint_space]
		positions[5] 					*= -1 					# Some hacks to make Gazebo model the same as OpenRave

		JointTrajectoryPoint_points.positions			= positions
		JointTrajectoryPoint_points.velocities			= []
		JointTrajectoryPoint_points.accelerations 		= []
		JointTrajectoryPoint_points.effort 				= []
		JointTrajectoryPoint_points.time_from_start 	= rospy.Duration(interpolation_time)

		joint_traj_msg.header 			= sensor_msg_header
		joint_traj_msg.joint_names 		= self.joint_names
		joint_traj_msg.points 			= [JointTrajectoryPoint_points]

		return joint_traj_msg

	def __publish_joint_msg(self, single_joint_space, time_interp=2):
			joint_traj_msg			= self._frame_message(single_joint_space, time_interp)
			self.move_arm_pub.publish(joint_traj_msg)	
			self.ros_rate.sleep()
			# rospy.sleep(1)

	def __move_arm_single(self, joint_space):
		self.__publish_joint_msg(single_joint_space=joint_space)

	def __get_velocity_ramp(self, itr, max_no_points):

		if itr <= max_no_points /3:
			vel 		= (3 *float(itr) /max_no_points) *(self.max_angular_vel -self.min_angular_vel) + self.min_angular_vel

		elif itr >= max_no_points *2/3:
			vel 		= self.max_angular_vel -(3 *float(itr) /max_no_points -2) * (self.max_angular_vel -self.min_angular_vel)

		else:
			vel 		= self.max_angular_vel

		return vel

	def __generate_ramp_trajectory(self, joint_space):
		max_no_points			= len(joint_space)

		for itr in range(max_no_points -1):
			start 				= joint_space[itr]
			target 				= joint_space[itr +1]
			
			max_angle_change 	= max(abs(target -start))
			velocity 			= self.__get_velocity_ramp(itr, max_no_points)
			time_interp 		= float(max_angle_change / velocity)

			# print(time_interp)

			self.__publish_joint_msg(single_joint_space=target, time_interp=time_interp)

	def __move_arm_trajectory(self, joint_space, v_profile):
		# Moves the arm according to a list of joint trajectories

		if v_profile == "ramp":
			# Ramp velocity specified
			self.__generate_ramp_trajectory(joint_space)

		else:
			rospy.logerr("Move arm trajectory -> Invalid v_profile selected")
			raise Exception()

	def move_arm(self, joint_space, v_profile=None):

		if(v_profile != None):
			self.__move_arm_trajectory(joint_space, v_profile)
		else:
			self.__move_arm_single(joint_space)


if __name__ == "__main__":
	test_joint 			= [0,0,0,0,0,0]
	joint_start 		= [-0.97,0.2,-1.4,2.75,1.5,-2.071]
	bin1 				= [-0.3,0,1,2.2,1.8,0]
	current_joint_val	= [-0.206423593026,-1.88930973546,1.93371669802,3.891687163,2.27589753846,-0.230542109703]
	goal_cartesian 		= [-0.8139287376537965, -0.574451023319419, -2.465989452029603, 0.18783751718385825, -0.003253999496774948, 0.58640475380916413]

	driver 	= Ur5_motion_planner()
	# points 	= driver.plan_to_cartesian(current_joint_val,goal_cartesian)
	driver.move_arm(joint_start)
	# print points