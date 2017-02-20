"""
Author: Johan Kok Zhi Kang 

Description:
This module defines Mario's state machine for the stowing process. The state diagram that it 
attempts to recreate can be found in the drive.

Dependencies:
1) smach
2) rospy
"""

import rospy
import smach
import smach_ros
from Queue import Queue
from apc_global_params import *
from ur5_lib import MarioFullSystem
from or_motion_planning import ORMotionPlanning
from jxGraspingMain import *

""" Global parameters """
is_simulation 				= True
display_on_motion_planner 	= False
pick_or_stow 				= 0 		# 0 - pick task / 1 - stow task

""" Shared variables by all states """
# Motion planner and OpenRave parameters
task_queue 					= Queue()	# FIFO
current_task 				= None
banned_strats 				= [0 ,2 ,3 ,4 ,5 ,6]

class StateMover:
	mario_motion_planner 	= ORMotionPlanning('apc_env.xml')
	mario_full_system 		= MarioFullSystem(is_simulation)

	@classmethod
	def motionplan_move_to_item(cls, item_field):
		assert item_field in global_params.keys()
		start 			= cls.mario_full_system.get_robot_joint_state()

		for each in range(len(start) -1):
			start[each] 	= -start[each] 			# THIS IS A HACK CAUSE IM TOO LAZY TO MAKE THINGS RIGHT :/

		cls.mario_motion_planner.init_planning_setup(start, 'pqp')
		final 			= cls.mario_motion_planner.optimize_trajopt(joint_target=global_params[item_field])

		if(display_on_motion_planner):
			cls.mario_motion_planner.simulate(trajectory=final)

		cls.mario_full_system.action_server_move_arm(joint_space=final, total_points=len(final))

	@classmethod
	def move_to_joint_space_single(cls, joint_space):
		# This is without motion planning
		cls.mario_full_system.action_server_move_arm(joint_space=joint_space, total_points=1)

	@classmethod
	def position_arm_for_grasping(cls, obj_label, grasp_results, grasp_type):
		assert obj_label in global_params.keys()
		joint_space 	= cls.mario_full_system.get_joint_sol_from_bin_grasping(obj_label, grasp_results, grasp_type)
		cls.move_to_joint_space_single(joint_space)

	@classmethod
	def attempt_grasp(cls, approach, delta_dis):
		axis 			= approach['axis']
		limit 		 	= [approach['direction'], approach['direction'] *-1]
		way_points 		= cls.mario_full_system.get_joint_space_from_delta_robot_frame(axis, delta_dis *limit[0])
		cls.move_to_joint_space_single(way_points)
		rospy.sleep(1)
		way_points 		= cls.mario_full_system.get_joint_space_from_delta_robot_frame(axis, delta_dis *limit[1])
		cls.move_to_joint_space_single(way_points)

	@classmethod
	def pump_state(cls, state):
		if(state):
			cls.mario_full_system.on_pump()
		else:
			cls.mario_full_system.off_pump()

class Start_planning(smach.State):
	# Gets JSON input from bin and performs sorting
	# Ensures that the arm is at the scanning position above tote 
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Main_vision'], input_keys=['input'], output_keys=['output'])
		StateMover.move_to_joint_space_single(joint_space=global_params['starting_position'])
		rospy.sleep(5)

	def dequeue_task(self):
		if(not task_queue.empty()):
			return task_queue.get(block=False)

	def execute(self, userdata):
		rospy.loginfo("Mario -> Start moving to first bin in queue")
		global current_task 
		current_task 	= self.dequeue_task()
		StateMover.motionplan_move_to_item(current_task)
		return 'goto_Main_vision'

class Scan_and_capture_vision(smach.State):
	# Scans and captures image
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_PCL_segmentation_vision'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Scanning tote and generating point cloud data")
		return 'goto_PCL_segmentation_vision'

class PCL_segmentation_vision(smach.State):
	# Recreates point cloud data
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Compare_rgb_vision'], input_keys=['input'], output_keys=['output'])
	
	def execute(self, userdata):
		rospy.loginfo("Mario -> PCL segmentation")
		return 'goto_Compare_rgb_vision'

class Compare_rgb_vision(smach.State):
	# Generates image capture confidence and target object pose
	def __init__(self):
		smach.State.__init__(self, outcomes=['end_vision_goto_grasping','end_vision_goto_error_vision'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Comparing RGB image to generate target pose and confidence")

		if(True):
			return 'end_vision_goto_grasping'
		else:
			return 'end_vision_goto_error_vision'

class Reattempt_vision_error(smach.State):
	# Error handling - Bring arm back to tote for rescan
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Main_vision'], input_keys=['input'], output_keys=['output'])
	
	def execute(self, userdata):
		rospy.loginfo("Mario -> Image capture failed. Moving arm to tote for rescan")
		return 'goto_Main_vision'

class Strategy_dispatcher_grasping(smach.State):
	# Evaluates all possible grasping strategies for a given target object
	# Filters out illegal grasping poses
	# Checks space constraint of grasp relative to tote
	# Determine grasping confidence with vision > tolerance
	# JX FILL UP
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Implement_strategy_grasping','end_grasping_goto_error_grasping'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Evaluating grasping strategy")

		try:
			item_id_from_vision 		= hard_coded_items[current_task].get("id")
			item_coord_from_vision 		= hard_coded_items[current_task].get("coords")
			position 					= item_coord_from_vision[3:]
			RPY 						= item_coord_from_vision[:3]

			result 						= grasp_Main(item_id_from_vision, pick_or_stow, position, RPY, banned_strats)
			strategyIDchosen 			= result[0] 			# HACKS: NEED TO IMPROVE
			end_effector_pos 			= result[1][0]

			global banned_strats
			banned_strats[strategyIDchosen %6] = strategyIDchosen

			output 						= {	"strategy_id" 		: strategyIDchosen, 
											"end_effector_pos" 	: end_effector_pos,
											}
			userdata.output 			= output
			return 'goto_Implement_strategy_grasping'
		except Exception as error:
			rospy.loginfo(error)
			return 'end_grasping_goto_error_grasping'

class Implement_strategy_grasping(smach.State):
	# Receives a grasping strategy
	# Moves arm to grasp pose and ready for grasping object
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Execute_grasping'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Grasp pose received. Moving to tote pre-grasp pose")
		StateMover.move_to_joint_space_single(global_params[current_task])

		end_effector_pos			= userdata.input.get('end_effector_pos')
		StateMover.position_arm_for_grasping(current_task, end_effector_pos, 0)
		return 'goto_Execute_grasping'

class Execute_grasping(smach.State):
	# Determines which suction method is selected
	# Executes grasping 
	# Verifies that the object is grasped successfully due to feedback
	def __init__(self):
		smach.State.__init__(self, outcomes=['end_grasping_goto_stowing','end_grasping_goto_error_grasping'], input_keys=['input'], output_keys=['output'])

	def get_grasp_axis_and_direction(self, strategyIDchosen):
		approach 	= {'axis': ' ', 'direction' : 1}
		# JX FILL UP
		if(strategyIDchosen == 0):
			approach['axis']  		= 'z'	# Top suction
			approach['direction'] 	= -1 	# Approach top down
			rospy.loginfo("Execute_grasping -> Approaching from Z axis")
		elif(strategyIDchosen == 1):
			approach['axis']  		= 'x'	# Front suction
			approach['direction'] 	= 1 	# Approach front
			rospy.loginfo("Execute_grasping -> Approaching from X axis")
		return approach

	def execute(self, userdata):
		rospy.loginfo("Mario -> Attempting to grasp item")
		StateMover.pump_state(True)
		strategy_id 	= userdata.input.get('strategy_id')
		approach 		= self.get_grasp_axis_and_direction(strategy_id)
		StateMover.attempt_grasp(approach, 0.1)
		
		if(True):
			return 'end_grasping_goto_stowing'
		else:
			return 'end_grasping_goto_error_grasping'

class Pre_stow_position_stowing(smach.State):
	# Commands the arm to go to pre-stowing position for tote
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Select_bin_stowing'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Moving to pre-stowing position")
		StateMover.move_to_joint_space_single(global_params[current_task])
		return 'goto_Select_bin_stowing'

class Select_bin_stowing(smach.State):
	# Performs item identification. If identified, go to bin. If not, go to amnesty tote
	# Selects which bin to stow given item 
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Move_to_bin_stowing', 'goto_Amnesty_tote'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Item identification and bin selection")

		if(True):
			return 'goto_Move_to_bin_stowing'
		else:
			return 'goto_Amnesty_tote'

class Reattempt_grasp_error(smach.State):
	# Error handling - Regrasping attempt for target object
	# Transits to reattempting vision if failure rate for grasping is too high
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Main_grasping','goto_Reattempt_vision_error'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Grasping of target object failed. Reattempting to generate new grasp data.")
		
		if(True):
			return 'goto_Main_grasping'
		else:
			return 'goto_Reattempt_vision_error'

class Move_to_amnesty_tote(smach.State):
	# Motion plan to pre-stowing position for amnesty tote
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Execute_stowing'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Moving to amnesty tote")
		return 'goto_Amnesty_tote'

class Move_to_bin_stowing(smach.State):
	# Motion plan to pre-stowing position for bin and move robot
	# Checks if item is still intact. If not, jump staight to update_bin_and_repeat
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Execute_stowing','goto_Update_bin_and_repeat_stowing'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Moving arm to selected bin for stowing")
		
		if(True):
			return 'goto_Execute_stowing'
		else:
			return 'goto_Update_bin_and_repeat_stowing'

class Execute_stowing(smach.State):
	# Stows the item into the bin by moving the arm forward and then depositing the item
	# Retracts the arm to pre-stowing position for bin
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Update_bin_and_repeat_stowing'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Stowing object into bin")
		return 'goto_Update_bin_and_repeat_stowing'

class Update_bin_and_repeat_stowing(smach.State):
	# Updates the bin on newly added contents
	# Repeats the process if items are still in the tote
	def __init__(self):
		smach.State.__init__(self, outcomes=['end_stowing_goto_terminate','end_stowing_goto_repeat'], input_keys=['input'], output_keys=['output'])

	def __reset_all_variables(self):
		global banned_strats 				
		banned_strats 	= [0 ,2 ,3 ,4 ,5 ,6]

	def execute(self, userdata):
		rospy.loginfo("Mario -> Stowing success! Updating bin and checking for empty tote list")
		
		if(task_queue.empty()):
			return 'end_stowing_goto_terminate'
		else:
			self.__reset_all_variables();
			return 'end_stowing_goto_repeat'

if __name__ == "__main__":
	rospy.init_node('Mario_stowing', anonymous=True)

	parent 						= smach.StateMachine(outcomes=['terminate_stowing_process'])
	parent.userdata.data_field 	= 2.3

	with parent:
		smach.StateMachine.add('Start_planning', Start_planning(), 
								transitions	= {
												'goto_Main_vision'	: 'child_Main_vision',
												},
								remapping	= {
												'input'		: 'data_field',
												'output' 	: 'data_field',
												})

		# Add vision unit
		child_Main_vision		= smach.StateMachine(outcomes=['goto_Main_grasping','goto_Reattempt_vision'])
		child_Main_vision.userdata.data_field = 50
		with child_Main_vision:
			smach.StateMachine.add('Scan_and_capture_vision', Scan_and_capture_vision(), 
									transitions	= {
													'goto_PCL_segmentation_vision' 	: 'PCL_segmentation_vision'
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

			smach.StateMachine.add('PCL_segmentation_vision', PCL_segmentation_vision(), 
									transitions	= {
													'goto_Compare_rgb_vision' 	: 'Compare_rgb_vision'
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

			smach.StateMachine.add('Compare_rgb_vision', Compare_rgb_vision(), 
									transitions	= {
													'end_vision_goto_grasping' 		: 'goto_Main_grasping',
													'end_vision_goto_error_vision' 	: 'goto_Reattempt_vision',
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

		smach.StateMachine.add('child_Main_vision', child_Main_vision,
								transitions	= {
												'goto_Main_grasping' 	: 'child_Main_grasping',
												'goto_Reattempt_vision'	: 'Reattempt_vision_error'
												},
								remapping	= {
												'input'		: 'data_field',
												'output' 	: 'data_field',
												})


		# Add grasping unit
		child_Main_grasping 	= smach.StateMachine(outcomes=['goto_Main_stowing','goto_reattempt_grasp'])
		child_Main_grasping.userdata.data_field 	= 400
		with child_Main_grasping:
			smach.StateMachine.add('Strategy_dispatcher_grasping', Strategy_dispatcher_grasping(),
									transitions	= {
													'goto_Implement_strategy_grasping' 	: 'Implement_strategy_grasping',
													'end_grasping_goto_error_grasping'	: 'goto_reattempt_grasp'
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

			smach.StateMachine.add('Implement_strategy_grasping', Implement_strategy_grasping(),
									transitions	= {
													'goto_Execute_grasping' : 'Execute_grasping'
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

			smach.StateMachine.add('Execute_grasping', Execute_grasping(),
									transitions	= {
													'end_grasping_goto_stowing' 		: 'goto_Main_stowing',
													'end_grasping_goto_error_grasping'	: 'goto_reattempt_grasp'
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

		smach.StateMachine.add('child_Main_grasping', child_Main_grasping,
								transitions	= {
												'goto_Main_stowing' 	: 'child_Main_stowing',
												'goto_reattempt_grasp'	: 'Reattempt_grasp_error'
												},
								remapping	= {
												'input'			: 'data_field',
												'output' 		: 'data_field',
												})


		# Add stowing unit
		child_Main_stowing		= smach.StateMachine(outcomes=['goto_terminate_stowing_process','goto_repeat_stowing_process'])
		child_Main_stowing.userdata.data_field 	= 5000
		with child_Main_stowing:
			smach.StateMachine.add('Pre_stow_position_stowing', Pre_stow_position_stowing(),
									transitions	= {
													'goto_Select_bin_stowing' : 'Select_bin_stowing'
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

			smach.StateMachine.add('Select_bin_stowing', Select_bin_stowing(),
									transitions	= {
													'goto_Move_to_bin_stowing' 	: 'Move_to_bin_stowing',
													'goto_Amnesty_tote' 		: 'Move_to_amnesty_tote'
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

			smach.StateMachine.add('Move_to_bin_stowing', Move_to_bin_stowing(),
									transitions	= {
													'goto_Execute_stowing' 					: 'Execute_stowing',
													'goto_Update_bin_and_repeat_stowing' 	: 'Update_bin_and_repeat_stowing'
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

			smach.StateMachine.add('Move_to_amnesty_tote', Move_to_amnesty_tote(),
									transitions	= {
													'goto_Execute_stowing' 					: 'Execute_stowing',
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

			smach.StateMachine.add('Execute_stowing', Execute_stowing(),
									transitions	= {
													'goto_Update_bin_and_repeat_stowing' 	: 'Update_bin_and_repeat_stowing'
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

			smach.StateMachine.add('Update_bin_and_repeat_stowing', Update_bin_and_repeat_stowing(),
									transitions	= {
													'end_stowing_goto_terminate' 	: 'goto_terminate_stowing_process',
													'end_stowing_goto_repeat'		: 'goto_repeat_stowing_process'
													},
									remapping	= {
													'input'			: 'data_field',
													'output' 		: 'data_field',
													})

		smach.StateMachine.add('child_Main_stowing', child_Main_stowing,
								transitions	= {
												'goto_terminate_stowing_process' 	: 'terminate_stowing_process',
												'goto_repeat_stowing_process'		: 'Start_planning'
												},
								remapping	= {
												'input'		: 'data_field',
												'output' 	: 'data_field',
												})


		# Add reattempt vision error state
		smach.StateMachine.add('Reattempt_vision_error', Reattempt_vision_error(), 
								transitions	= {
												'goto_Main_vision'	: 'child_Main_vision',
												},
								remapping	= {
												'input'		: 'data_field',
												'output' 	: 'data_field',
												})


		# Add reattempt grasping error state
		smach.StateMachine.add('Reattempt_grasp_error', Reattempt_grasp_error(), 
								transitions	= {
												'goto_Main_grasping'			: 'child_Main_grasping',
												'goto_Reattempt_vision_error' 	: 'Reattempt_vision_error'
												},
								remapping	= {
												'input'		: 'data_field',
												'output' 	: 'data_field',
												})


	initial_task_sequence 				=  ["ready_bin_B", "ready_bin_C", "ready_bin_E"]
	for i in initial_task_sequence:
		task_queue.put(i)

	parent.execute()
	rospy.loginfo("Mario -> Stowing task completed. Terminating Mario's operationsself.")