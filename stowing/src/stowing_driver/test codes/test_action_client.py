import roslib
roslib.load_manifest('stowing_driver')

import rospy 
import numpy as np
import actionlib
from trajectory_msgs.msg import *
from std_msgs.msg import *
from control_msgs.msg import *

if __name__ == "__main__":
	rospy.init_node("test_node", anonymous=True)
	client 	= actionlib.SimpleActionClient('arm_controller/follow_joint_trajectory', FollowJointTrajectoryAction)
	print("connecting")
	client.wait_for_server()

	print("Connected to server.")

	joint_names 			= ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']
	action_goal 			= FollowJointTrajectoryActionGoal()
	goal 					= FollowJointTrajectoryGoal()

	trajectory 				= JointTrajectory()
	header 					= Header()
	points 					= JointTrajectoryPoint()
	point_B 				= JointTrajectoryPoint()
	point_C 				= JointTrajectoryPoint()

	path_tolerance 			= JointTolerance()

	goal_tolerance 			= JointTolerance()

	# Trajectory fields
	header.seq 				= 1
	header.stamp			= rospy.Time.now()
	header.frame_id 		= "10"

	points.positions 		= [1.5,0,0,0,0,0]
	points.velocities 		= []
	points.accelerations 	= []
	points.time_from_start 	= rospy.Duration(3) 		# time from start must be in increasing order based on way point sequence

	point_B.positions 			= [-1.5,0,0,0,0,0]
	point_B.velocities 			= []
	point_B.accelerations 		= []
	point_B.time_from_start 	= rospy.Duration(1)

	point_C.positions 			= [0.5,0.5,0,0,0,0]
	point_C.velocities 			= []
	point_C.accelerations 		= []
	point_C.time_from_start 	= rospy.Duration(6)

	trajectory.header 		= header
	trajectory.joint_names 	= joint_names
	trajectory.points 		= [point_B, points, point_C]

	# Path tolerance fields
	path_tolerance.name 			= "path_tolerance"
	path_tolerance.position 		= 0
	path_tolerance.velocity 		= 0
	path_tolerance.acceleration 	= 0

	# Goal tolerance fields
	goal_tolerance.name 			= "goal_tolerance"
	goal_tolerance.position 		= 0	
	goal_tolerance.velocity 		= 0
	goal_tolerance.acceleration 	= 0

	# Fill up all key fields
	goal.trajectory 			= trajectory
	goal.path_tolerance			= [path_tolerance]
	goal.goal_tolerance			= [goal_tolerance]
	goal.goal_time_tolerance 	= rospy.Duration(5,0)

	action_goal.goal 			= goal
	import IPython
	# IPython.embed()
	client.send_goal(goal)
	client.wait_for_result(rospy.Duration.from_sec(5.0))
	print("sent")	
