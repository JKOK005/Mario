from ur5_lib import *
import numpy as np
from or_motion_planning import ORMotionPlanning
import openravepy as op

class TestActionMethod(SubscribeToActionServer):
	def __init__(self, *args, **kwargs):
		rospy.init_node('UR5_motion_planner', anonymous=True)
		self.is_simulation 		= False
		self.joint_names 		= ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']
		super(TestActionMethod, self).__init__(*args, **kwargs)

class TestVelocityMethod(VelocityProfile):
	def __init__(self, *args, **kwargs):
		super(TestVelocityMethod, self).__init__(*args, **kwargs)

if __name__ == "__main__":
	# tester 		= TestVelocityMethod()
	# for i in range(1000):
	# 	time 	= tester.get_time_ramp_trajectory(0.1, i, 1000)
	# 	print(0.1/ time)
	point_H 			= np.array([0.07054406801332647, -0.8703416585922241, 1.7938006559955042, 1.855142895375387, 1.4151552359210413, -0.2074654738055628
])
	
	bin1 				= np.array([-0.55,-0.08,1.0,2.2,2.1,-1.571])
	bin2 				= np.array([0.04,-0.25,1.9,1.5,1.571,-1.571])
	bin3 				= np.array([0.8,-0.2,1.5,1.8,0.75,-1.571])
	bin4 				= np.array([-0.60,-0.78,1.5,2.3,2.1,-1.501])

	start 				= bin1
	robot_path 			= [bin1] + [bin2] + [bin3] + [bin4]
	tester 				= TestActionMethod()
	planner 			= ORMotionPlanning('apc_env.xml')
	tester.action_server_move_arm(start, total_points=1)
	import IPython
	IPython.embed()

	collision_struct 	= {"checker":'pqp', 
							"collision_options":[op.CollisionOptions.Contacts]}

	for itr in range(3):
		start 				= robot_path[itr].tolist()
		target 				= robot_path[itr +1].tolist()
		planner.init_planning_setup(start, collision_struct)
		final_traj 			= planner.optimize_trajopt(joint_target=target)
		planner.simulate(trajectory=final_traj)
		total_points		= len(final_traj)
		tester.action_server_move_arm(joint_space=final_traj, total_points=total_points)

