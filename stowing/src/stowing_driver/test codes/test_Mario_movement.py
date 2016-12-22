import roslib
roslib.load_manifest('stowing_driver')

from or_motion_planning import ORMotionPlanning
from ur5_lib import MarioKinematics

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

	planner 			= ORMotionPlanning('apc_env.xml')

	collision_struct 	= {"checker":'pqp', 
							"collision_options":[op.CollisionOptions.Contacts]}

	# DEPRECATED CODE
	# driver 				= MarioKinematics()
	# driver.action_server_move_arm([np.array(joint_start)], total_points=1)
	# IPython.embed()

	# for itr in range(9):
	# 	#  Move from bin to tote
	#  	planner.init_planning_setup(robot_path[itr][0], collision_struct)
	#  	final_trajectory 	=	planner.optimize_trajopt(joint_target=robot_path[itr][1])
	#  	# planner.simulate(trajectory=final_trajectory)
	#  	driver.action_server_move_arm(joint_space=final_trajectory, total_points=len(final_trajectory))
	#  	rospy.sleep(2)

	#  	planner.init_planning_setup(robot_path[itr][1], collision_struct)
	#  	linear_trajectory 	= 	planner.move_linear(joint_target=robot_path[itr][2])
	#  	# planner.simulate(trajectory=linear_trajectory)
	#  	driver.action_server_move_arm(joint_space=linear_trajectory, total_points=len(linear_trajectory))
	#  	rospy.sleep(2)

	#  	# Move from tote to bin
	#  	# planner.simulate(trajectory=reversed(linear_trajectory))
	#  	driver.action_server_move_arm(joint_space=reversed(linear_trajectory), total_points=len(linear_trajectory))
	# 	rospy.sleep(2)

	#  	# planner.simulate(trajectory=reversed(final_trajectory))
	#  	driver.action_server_move_arm(joint_space=reversed(final_trajectory), total_points=len(final_trajectory))
	#  	rospy.sleep(2)