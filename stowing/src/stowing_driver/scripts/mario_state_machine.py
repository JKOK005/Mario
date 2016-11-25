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

class Move_to_joint_space(smach.State):
	# Motion planning state to given joint angle
	pass

class Start_planning(smach.State):
	# Gets JSON input from bin and performs sorting
	# Ensures that the arm is at the scanning position above tote 
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Main_vision'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Start planning")
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

class Strategy_dispatcher_grasping(smach.State):
	# Evaluates all possible grasping strategies for a given target object
	# Filters out illegal grasping poses
	# Checks space constraint of grasp relative to tote
	# Determine grasping confidence with vision > tolerance
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Implement_strategy_grasping','end_grasping_goto_error_grasping'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Evaluating grasping strategy")
		
		if(True):
			return 'goto_Implement_strategy_grasping'
		else:
			return 'end_grasping_goto_error_grasping'

class Implement_strategy_grasping(smach.State):
	# Receives a grasping strategy
	# Moves arm to grasp pose and ready for grasping object
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Execute_grasping'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Grasp pose received. Moving to tote pre-grasp pose")
		return 'goto_Execute_grasping'

class Execute_grasping(smach.State):
	# Determines which suction method is selected
	# Executes grasping 
	# Verifies that the object is grasped successfully due to feedback
	def __init__(self):
		smach.State.__init__(self, outcomes=['end_grasping_goto_stowing','end_grasping_goto_error_grasping'], input_keys=['input'], output_keys=['output'])

	def execute(self, userdata):
		rospy.loginfo("Mario -> Attempting to grasp item")
		
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

	def execute(self, userdata):
		rospy.loginfo("Mario -> Stowing success! Updating bin and checking for empty tote list")
		
		if(True):
			return 'end_stowing_goto_terminate'
		else:
			return 'end_stowing_goto_repeat'

if __name__ == "__main__":
	rospy.init_node('Mario_stowing')

	parent 						= smach.StateMachine(outcomes=['terminate_stowing_process'])
	parent.userdata.counter 	= 2.3

	with parent:
		smach.StateMachine.add('Start_planning', Start_planning(), 
								transitions	= {
												'goto_Main_vision'	: 'child_Main_vision',
												},
								remapping	= {
												'input'		: 'counter',
												'output' 	: 'cout',
												})


		# Add vision unit
		child_Main_vision		= smach.StateMachine(outcomes=['goto_Main_grasping','goto_Reattempt_vision'])
		child_Main_vision.userdata.counter = 50
		with child_Main_vision:
			smach.StateMachine.add('Scan_and_capture_vision', Scan_and_capture_vision(), 
									transitions	= {
													'goto_PCL_segmentation_vision' 	: 'PCL_segmentation_vision'
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

			smach.StateMachine.add('PCL_segmentation_vision', PCL_segmentation_vision(), 
									transitions	= {
													'goto_Compare_rgb_vision' 	: 'Compare_rgb_vision'
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

			smach.StateMachine.add('Compare_rgb_vision', Compare_rgb_vision(), 
									transitions	= {
													'end_vision_goto_grasping' 		: 'goto_Main_grasping',
													'end_vision_goto_error_vision' 	: 'goto_Reattempt_vision',
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

		smach.StateMachine.add('child_Main_vision', child_Main_vision,
								transitions	= {
												'goto_Main_grasping' 	: 'child_Main_grasping',
												'goto_Reattempt_vision'	: 'Reattempt_vision_error'
												},
								remapping	= {
												'input'		: 'counter',
												'output' 	: 'cout',
												})


		# Add grasping unit
		child_Main_grasping 	= smach.StateMachine(outcomes=['goto_Main_stowing','goto_reattempt_grasp'])
		child_Main_grasping.userdata.counter 	= 400
		with child_Main_grasping:
			smach.StateMachine.add('Strategy_dispatcher_grasping', Strategy_dispatcher_grasping(),
									transitions	= {
													'goto_Implement_strategy_grasping' 	: 'Implement_strategy_grasping',
													'end_grasping_goto_error_grasping'	: 'goto_reattempt_grasp'
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

			smach.StateMachine.add('Implement_strategy_grasping', Implement_strategy_grasping(),
									transitions	= {
													'goto_Execute_grasping' : 'Execute_grasping'
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

			smach.StateMachine.add('Execute_grasping', Execute_grasping(),
									transitions	= {
													'end_grasping_goto_stowing' 		: 'goto_Main_stowing',
													'end_grasping_goto_error_grasping'	: 'goto_reattempt_grasp'
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

		smach.StateMachine.add('child_Main_grasping', child_Main_grasping,
								transitions	= {
												'goto_Main_stowing' 	: 'child_Main_stowing',
												'goto_reattempt_grasp'	: 'Reattempt_grasp_error'
												},
								remapping	= {
												'input'			: 'counter',
												'output' 		: 'cout',
												})


		# Add stowing unit
		child_Main_stowing		= smach.StateMachine(outcomes=['goto_terminate_stowing_process','goto_repeat_stowing_process'])
		child_Main_stowing.userdata.counter 	= 5000
		with child_Main_stowing:
			smach.StateMachine.add('Pre_stow_position_stowing', Pre_stow_position_stowing(),
									transitions	= {
													'goto_Select_bin_stowing' : 'Select_bin_stowing'
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

			smach.StateMachine.add('Select_bin_stowing', Select_bin_stowing(),
									transitions	= {
													'goto_Move_to_bin_stowing' 	: 'Move_to_bin_stowing',
													'goto_Amnesty_tote' 		: 'Move_to_amnesty_tote'
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

			smach.StateMachine.add('Move_to_bin_stowing', Move_to_bin_stowing(),
									transitions	= {
													'goto_Execute_stowing' 					: 'Execute_stowing',
													'goto_Update_bin_and_repeat_stowing' 	: 'Update_bin_and_repeat_stowing'
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

			smach.StateMachine.add('Move_to_amnesty_tote', Move_to_amnesty_tote(),
									transitions	= {
													'goto_Execute_stowing' 					: 'Execute_stowing',
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

			smach.StateMachine.add('Execute_stowing', Execute_stowing(),
									transitions	= {
													'goto_Update_bin_and_repeat_stowing' 	: 'Update_bin_and_repeat_stowing'
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

			smach.StateMachine.add('Update_bin_and_repeat_stowing', Update_bin_and_repeat_stowing(),
									transitions	= {
													'end_stowing_goto_terminate' 	: 'goto_terminate_stowing_process',
													'end_stowing_goto_repeat'		: 'goto_repeat_stowing_process'
													},
									remapping	= {
													'input'			: 'counter',
													'output' 		: 'cout',
													})

		smach.StateMachine.add('child_Main_stowing', child_Main_stowing,
								transitions	= {
												'goto_terminate_stowing_process' 	: 'terminate_stowing_process',
												'goto_repeat_stowing_process'		: 'Start_planning'
												},
								remapping	= {
												'input'		: 'counter',
												'output' 	: 'cout',
												})


		# Add reattempt vision error state
		smach.StateMachine.add('Reattempt_vision_error', Reattempt_vision_error(), 
								transitions	= {
												'goto_Main_vision'	: 'child_Main_vision',
												},
								remapping	= {
												'input'		: 'counter',
												'output' 	: 'cout',
												})


		# Add reattempt grasping error state
		smach.StateMachine.add('Reattempt_grasp_error', Reattempt_grasp_error(), 
								transitions	= {
												'goto_Main_grasping'			: 'child_Main_grasping',
												'goto_Reattempt_vision_error' 	: 'Reattempt_vision_error'
												},
								remapping	= {
												'input'		: 'counter',
												'output' 	: 'cout',
												})


	parent.execute()
	rospy.loginfo("Mario -> Stowing task completed. Terminating Mario's operationsself.")