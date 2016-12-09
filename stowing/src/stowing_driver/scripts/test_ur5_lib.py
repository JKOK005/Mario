from ur5_lib import *
import numpy as np

class TestActionMethod(SubscribeToActionServer, VelocityProfile):
	def __init__(self, *args, **kwargs):
		rospy.init_node('UR5_motion_planner', anonymous=True)
		self.is_simulation 			= True
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
	tester 			= TestActionMethod()
	point_A			= np.array([-0.25,-0.25,-1.3,3.124,1.5,-1.571])
	point_B			= np.array([1.5,0,0,0,0,0])
	point_C			= np.array([2.5,0,0,0,0,0])
	point_D 		= [0,0,0,0,0,]
	joint_space 	= [point_A] + [point_B] + [point_C]
	total_points	= len(joint_space)

	tester.action_server_move_arm(joint_space=joint_space, total_points=total_points)

