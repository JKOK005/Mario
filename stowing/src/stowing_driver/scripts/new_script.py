from ur5_lib import *
from jxGraspingMain import *

itemID 		=	2
pickorstow 	= 	0 		#0 for picking, 1 for stowing
x 			= 	0.11		
y 			= 	0.0725
z 			= 	0.0475
roll 		= 	0
pitch 		= 	0
yaw 		=	0
bannedstrat1	=	1
bannedstrat2	= 	0

if __name__ == "__main__":
	mario 			= MarioFullSystem(is_simulation=False)

	graspingmodule	= grasp_Main(itemID, pickorstow, x, y, z, roll, pitch, yaw, bannedstrat1, bannedstrat2)
	grasp_type 		= 1 	# Front suction
	if graspingmodule[0] == 1:
		
		grasp_result 	= [graspingmodule[5], graspingmodule[6], graspingmodule[7], graspingmodule[2], graspingmodule[3], graspingmodule[4]]		# roll / pitch / yaw / X / Y / Z
		# grasp_result 	= [0, 0, 0, 0.1, 0, 0.20]
		obj_label 		= 'bin_middle'

		base_coord 					= mario.get_joint_sols_from_bin_grasping(obj_label, grasp_result, grasp_type)
		selected_base_coord 		= base_coord[0]
		selected_base_coord[0:5] 	*= -1 				# Some hacks to translate to Gazebo frame of reference

		mario.action_server_move_arm(joint_space=selected_base_coord, total_points=1)
	else:
		print("Failed to find pick")
